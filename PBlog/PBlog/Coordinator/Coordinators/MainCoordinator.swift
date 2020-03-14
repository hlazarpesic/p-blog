import Foundation
import UIKit
import RxSwift

class MainCoordinator: Coordinator {
    
    var children: [Coordinator] = []

    var eventsSubject = PublishSubject<Event>()
    var db = DisposeBag()
    
    func start() {
        showMainVC()
    }
}


//MARK: Actions

extension MainCoordinator {

    func showMainVC() {
        let viewController = MainVC.instantiate()
        UIApplication.currentWindow.rootViewController = UINavigationController()
        (UIApplication.currentWindow.rootViewController as! UINavigationController).pushViewController(viewController, animated: true)
        bind(to: viewController)
    }
}


//MARK: Coordinated

extension MainCoordinator: Coordinated {
    
    enum Event {
        case startOnboardingCoordinator
    }
    
    var events: Observable<Event> {
        return eventsSubject
    }
}


//MARK: Bindings

extension MainCoordinator {

    func bind(to coordinated: MainVC) {
        coordinated.events.subscribe(onNext: { [weak self] event in
            guard let me = self else {
                return
            }


        }).disposed(by: db)
    }
}
