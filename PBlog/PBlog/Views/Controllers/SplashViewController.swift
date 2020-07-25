import Foundation
import UIKit
import RxSwift

class SplashViewController: UIViewController, Storyboard {

    fileprivate var eventSubject = PublishSubject<Event>()
    fileprivate var db = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        timeout()
    }
}


//MARK: Actions

extension SplashViewController {

    func timeout() {
        Observable<Int>
                .timer(RxTimeInterval.seconds(3), scheduler: Schedulers.instance.concurrentBackground)
                .observeOn(Schedulers.instance.main)
                .subscribe({ [weak self] _ in
                    guard let me = self else {
                        return
                    }

                    me.eventSubject.onNext(.finished)
                }).disposed(by: db)
    }
}


//MARK: Coordinated

extension SplashViewController: Coordinated {

    enum Event {
        case finished
    }

    var events: Observable<SplashViewController.Event> {
        return eventSubject
    }
}
