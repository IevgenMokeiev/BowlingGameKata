// BowlingGame.swift

final class BowlingGame {
    
    private var totalScore = 0
    private var frames: [Frame] = []
    
    func roll(_ pins: Int) {
        let roll = Roll(pins: pins)
        
        guard let lastFrame = frames.last else {
            let frame = Frame()
            frame.rolls.append(roll)
            frames.append(frame)
            return
        }
        
        if lastFrame.rolls.count == 2 {
            let frame = Frame()
            frame.rolls.append(roll)
            lastFrame.nextFrame = frame
            frames.append(frame)
        } else {
            lastFrame.rolls.append(roll)
        }
    }

    func score() -> Int {
        return frames.reduce(into: 0) { $0 = $0 + $1.score() }
    }
}
