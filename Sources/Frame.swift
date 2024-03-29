//  Frame.swift

final class Frame {
    
    var nextFrame: Frame?
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
        guard let nextFrame, nextFrame.rolls.count > 1 else { return 0 }
        return nextFrame.rolls[0].pins + nextFrame.rolls[1].pins
    }
    
    private var spareBonus: Int {
        guard let nextFrame, nextFrame.rolls.count > 0 else { return 0 }
        return nextFrame.rolls[0].pins
    }
}
