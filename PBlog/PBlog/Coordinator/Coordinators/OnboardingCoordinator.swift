import Foundation
import UIKit
import RxSwift

class OnboardingCoordinator: Coordinator {

    var children: [Coordinator] = []

    var eventsSubject = PublishSubject<Event>()
    var db = DisposeBag()

    func start() {
        showSplashVC()
    }
}


//MARK: Actions

extension OnboardingCoordinator {

    func showSplashVC() {
        let viewController = SplashVC.instantiate()
        (UIApplication.currentWindow.rootViewController as! UINavigationController).pushViewController(viewController, animated: false)
        bind(to: viewController)
    }
}


//MARK: Coordinated

extension OnboardingCoordinator: Coordinated {

    enum Event {
        case onboardingFinished
    }

    var events: Observable<Event> {
        return eventsSubject
    }
}


//MARK: Bindings

extension OnboardingCoordinator {

    func bind(to coordinated: SplashVC) {
        coordinated.events.subscribe(onNext: { [weak self] event in
            guard let me = self else {
                return
            }

            switch event {
            case .finished:
                me.eventsSubject.onNext(.onboardingFinished)
            }
        }).disposed(by: db)
    }
}
