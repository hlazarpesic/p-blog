import Foundation
import UIKit
import RxSwift

class AppCoordinator: Coordinator {
    
    var children: [Coordinator] = []

    var db = DisposeBag()

    func start() {
        startOnboardingCoordinator()
    }
}


//MARK: Actions

fileprivate extension AppCoordinator {
    
    func startOnboardingCoordinator() {
        let coordinator = OnboardingCoordinator()
        children.append(coordinator)
        bind(to: coordinator)
        coordinator.start()
    }
    
    func startMainCoodrinator() {
        let coordinator = MainCoordinator()
        children.append(coordinator)
        bind(to: coordinator)
        coordinator.start()
    }
}


//MARK: Bindings

extension AppCoordinator {
    
    func bind(to coordinator: OnboardingCoordinator) {
        coordinator.events
            .subscribe(onNext: { [weak self] event in
                guard let me = self else { return }
                
                switch event {
                case .onboardingFinished:
                    me.children.removeLast()
                    me.startMainCoodrinator()
                }}).disposed(by: db)
    }
    
    func bind(to coordinator: MainCoordinator) {
        coordinator.events
            .subscribe(onNext: { [weak self] event in
                guard let me = self else { return }
                
                switch event {
                case .startOnboardingCoordinator:
                    me.startOnboardingCoordinator()
                }}).disposed(by: db)
    }
}
