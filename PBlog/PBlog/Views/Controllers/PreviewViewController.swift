import Foundation
import UIKit
import RxSwift
import RxCocoa

class PreviewViewController: UIViewController, Storyboard {
    
    var eventsSubject = PublishSubject<Event>()
    var db = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
}


//MARK: Coordinated

extension PreviewViewController: Coordinated {
    
    enum Event {
        case finished
    }
    
    var events: Observable<PreviewViewController.Event> {
        return eventsSubject
    }
}


//MARK: Bindings

fileprivate extension PreviewViewController {
    
    func bind() {
        //call methods
    }

    //definition binding methods
}
