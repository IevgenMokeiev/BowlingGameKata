//  Frame.swift

final class Frame {
    
    var nextFrame: Frame?
    var rolls: [Roll] = []
    var isLastFrame: Bool = false

    func score() -> Int {
        rolls.reduce(into: 0) { $0 = $0 + $1.pins }
    }
}
