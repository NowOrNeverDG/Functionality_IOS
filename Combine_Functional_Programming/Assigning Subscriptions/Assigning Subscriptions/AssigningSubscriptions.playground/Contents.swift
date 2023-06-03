import UIKit
import Combine

final class LevelManager {
    var level: Int = 0 {
        didSet {
            print("User's current level \(level)")
        }
    }
}

let lvlManager = LevelManager()
let lvlRange = (0...100)
let cancellable = lvlRange
    .publisher
    .assign(to: \.level, on: lvlManager)
