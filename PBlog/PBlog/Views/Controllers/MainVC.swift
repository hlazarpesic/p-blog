import Foundation
import UIKit
import RxSwift
import RxCocoa

class MainVC: UIViewController, Storyboard {
    
    var eventsSubject = PublishSubject<Event>()
    var db = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
}


//MARK: Coordinated

extension MainVC: Coordinated {
    
    enum Event {
        case finished
    }
    
    var events: Observable<MainVC.Event> {
        return eventsSubject
    }
}


//MARK: Bindings

fileprivate extension MainVC {
    
    func bind() {
        //call methods
    }

    //definition binding methods
}
