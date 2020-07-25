import Foundation
import UIKit
import RxSwift
import RxCocoa

class PreviewViewController: UIViewController, Storyboard {
    
    fileprivate var eventSubject = PublishSubject<Event>()
    fileprivate var db = DisposeBag()

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
        return eventSubject
    }
}


//MARK: Bindings

fileprivate extension PreviewViewController {
    
    func bind() {
        //call methods
    }

    //definition binding methods
}
