//  Frame.swift

final class Frame {
    
    var nextFrame: Frame?
    var subsequentFrame: Frame?
    var rolls: [Roll] = []
    var isLastFrame: Bool = false
    
    var isStrike: Bool {
        guard rolls.count > 0 else { return false }
        return rolls[0].pins == 10
    }
    
    var isSpare: Bool {
        guard rolls.count > 1 else { return false }
        return rolls[0].pins + rolls[1].pins == 10
    }

    func score() -> Int {
        var totalScore = rolls.reduce(into: 0) { $0 = $0 + $1.pins }
        
        if isStrike {
            totalScore += strikeBonus
        } else if isSpare {
            totalScore += spareBonus
        }
        return totalScore
    }
    
    // MARK: - Private
    
    private var strikeBonus: Int {
        if isLastFrame {
            return 0
        } else {
            guard let nextFrame else { return 0 }
            if nextFrame.rolls.count >= 2 {
                return nextFrame.rolls[0].pins + nextFrame.rolls[1].pins
            } else {
                guard let subsequentFrame else { return 0 }
                return nextFrame.rolls[0].pins + subsequentFrame.rolls[0].pins
            }
        }
    }
    
    private var spareBonus: Int {
        if isLastFrame {
            return 0
        } else {
            guard let nextFrame else { return 0 }
            return nextFrame.rolls[0].pins
        }
    }
}
