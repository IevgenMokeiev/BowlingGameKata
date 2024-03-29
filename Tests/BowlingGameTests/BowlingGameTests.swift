// BowlingGameTests.swift

@testable import BowlingGame
import XCTest

class BowlingGameTests: XCTestCase {
    
    private var game: BowlingGame!
    
    override func setUp() {
        super.setUp()
        game = BowlingGame()
    }
    
    override func tearDown() {
        game = nil
        super.tearDown()
    }
    
    func testGutterGame() {
        rollMany(pins: 0, times: 20)
        XCTAssertEqual(game.score(), 0)
    }
    
    func testAllOnes() {
        rollMany(pins: 1, times: 20)
        XCTAssertEqual(game.score(), 20)
    }
    
    func testOneSpare() {
        rollSpare()
        game.roll(3)
        rollMany(pins: 0, times: 17)
        XCTAssertEqual(game.score(), 16)
    }
    
    func testOneStrike() {
        rollStrike()
        game.roll(3)
        game.roll(4)
        rollMany(pins: 0, times: 16)
        XCTAssertEqual(game.score(), 24)
    }
    
    func testPerfectGame() {
        rollMany(pins: 10, times: 12)
        XCTAssertEqual(game.score(), 300)
    }
    
    // MARK: - Private
    
    private func rollMany(pins: Int, times: Int) {
        for _ in 1...times {
            game.roll(pins)
        }
    }
    
    private func rollStrike() {
        game.roll(10)
    }
    
    private func rollSpare() {
        game.roll(5)
        game.roll(5)
    }
}
