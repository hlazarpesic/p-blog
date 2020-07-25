import Foundation
import UIKit
import RxSwift

class MainCoordinator: Coordinator {

    var children: [Coordinator] = []

    var eventsSubject = PublishSubject<Event>()
    var db = DisposeBag()

    func start() {
        showMainViewController()
    }
}


//MARK: Actions

extension MainCoordinator {

    func showMainViewController() {
        let viewController = MainViewController.instantiate()
        UIApplication.currentWindow.rootViewController = UINavigationController()
        (UIApplication.currentWindow.rootViewController as! UINavigationController).pushViewController(viewController, animated: true)
        bind(to: viewController)
    }

    func showSettingsViewController() {
        let viewController = SettingsViewController.instantiate()
        (UIApplication.currentWindow.rootViewController as! UINavigationController).pushViewController(viewController, animated: true)
        bind(to: viewController)
    }

    func backToTheMainViewController() {
        (UIApplication.currentWindow.rootViewController as! UINavigationController).popViewController(animated: true)
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

    func bind(to coordinated: MainViewController) {
        coordinated.events.subscribe(onNext: { [weak self] event in
            guard let me = self else {
                return
            }

            switch event {
            case .showPreviewScreen: break
            case .showSettings:
                me.showSettingsViewController()
            }
        }).disposed(by: db)
    }

    func bind(to coordinated: SettingsViewController) {
        coordinated.events.subscribe(onNext: { [weak self] event in
            guard let me = self else {
                return
            }

            switch event {
            case .finished:
                me.backToTheMainViewController()
            }
        }).disposed(by: db)
    }
}
