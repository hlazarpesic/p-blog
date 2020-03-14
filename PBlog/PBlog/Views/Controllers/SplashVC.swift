import Foundation
import UIKit
import RxSwift

class SplashVC: UIViewController, Storyboard {

    var eventsSubject = PublishSubject<Event>()
    var db = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        timeout()
    }
}


//MARK: Actions

extension SplashVC {

    func timeout() {
        Observable<Int>
                .timer(RxTimeInterval.seconds(3), scheduler: Schedulers.instance.concurrentBackground)
                .observeOn(Schedulers.instance.main)
                .subscribe({ [weak self] _ in
                    guard let me = self else {
                        return
                    }

                    me.eventsSubject.onNext(.finished)
                }).disposed(by: db)
    }
}


//MARK: Coordinated

extension SplashVC: Coordinated {

    enum Event {
        case finished
    }

    var events: Observable<SplashVC.Event> {
        return eventsSubject
    }
}
