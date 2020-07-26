import Foundation
import UIKit
import RxSwift
import RxCocoa

class MainViewController: UIViewController, Storyboard {
    
    fileprivate var eventSubject = PublishSubject<Event>()
    fileprivate var db = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bind()
    }
}


//MARK: UI

fileprivate extension MainViewController {
    
    func setupUI() {
        setupNavigationBarButtons()
    }

    func setupNavigationBarButtons() {
        let settingsButton: UIButton = UIButton.init(type: .custom)
        settingsButton.setImage(R.image.baseline_settings_black_24pt(), for: .normal)
        if #available(iOS 13, *) {
            settingsButton.tintColor = .label
        } else {
            settingsButton.tintColor = .black
        }
        settingsButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        settingsButton.addTarget(self, action: #selector(self.openSettings), for: .touchUpInside)
        let settingsNavBarButton = UIBarButtonItem(customView: settingsButton)
        
        let favoriteButton: UIButton = UIButton.init(type: .custom)
        favoriteButton.setImage(R.image.baseline_favorite_black_24pt(), for: .normal)
        if #available(iOS 13, *) {
            favoriteButton.tintColor = .label
        } else {
            favoriteButton.tintColor = .black
        }
        favoriteButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        favoriteButton.addTarget(self, action: #selector(self.showFavorites), for: .touchUpInside)
        let favoriteNavBarButton = UIBarButtonItem(customView: favoriteButton)
        
        navigationItem.rightBarButtonItems = [settingsNavBarButton, favoriteNavBarButton]
    }
}


//MARK: Actions

fileprivate extension MainViewController {
    
    @objc func showFavorites() {
        let alert = UIAlertController(title: R.string.localizedStrings.notAvailableInThisVersion(), message: nil, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: R.string.localizedStrings.ok(), style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func openSettings() {
        eventSubject.onNext(.showSettings)
    }
}


//MARK: Coordinated

extension MainViewController: Coordinated {
    
    enum Event {
        case showPreviewScreen
        case showSettings
    }
    
    var events: Observable<MainViewController.Event> {
        return eventSubject
    }
}


//MARK: Bindings

fileprivate extension MainViewController {
    
    func bind() {
        //call methods
    }

    //definition binding methods
}
