import UIKit
import Combine

final class LevelManager {
    var level: Int = 0 {
        didSet {
            print("User's current level \(level)")
        }
    }
    
    
}
