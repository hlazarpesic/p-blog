import Foundation
import UIKit
import RxSwift

public protocol Coordinator {
    
    var children: [Coordinator] { get }
    
    func start()
}
