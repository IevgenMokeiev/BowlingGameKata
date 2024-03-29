// BowlingGame.swift

final class BowlingGame {
    
    private var totalScore = 0
    private var frames: [Frame] = []
    
    func roll(_ pins: Int) {
        let roll = Roll(pins: pins)
        
        guard let currentFrame = frames.last else {
            addNewFrame(roll: roll)
            return
        }
        
        guard !currentFrame.isLastFrame else {
            addRollToLastFrame(frame: currentFrame, roll: roll)
            return
        }
        
        if currentFrame.rolls.count == 2 || currentFrame.isStrike {
            let newFrame = addNewFrame(roll: roll)
            currentFrame.nextFrame = newFrame
        } else {
            currentFrame.rolls.append(roll)
        }
        
        if frames.count == 10 {
            frames[9].isLastFrame = true
        }
    }
    
    func score() -> Int {
        return frames.reduce(into: 0) { $0 = $0 + $1.score() }
    }
    
    // MARK: - Private
    
    @discardableResult
    func addNewFrame(roll: Roll) -> Frame {
        let frame = Frame()
        frame.rolls.append(roll)
        frames.append(frame)
        return frame
    }
    
    func addRollToLastFrame(frame: Frame, roll: Roll) {
        if frame.rolls.count == 3 {
            return
        } else if frame.rolls.count == 2 {
            if frame.isSpare || frame.isStrike {
                frame.rolls.append(roll)
            }
        } else {
            frame.rolls.append(roll)
        }
    }
}
