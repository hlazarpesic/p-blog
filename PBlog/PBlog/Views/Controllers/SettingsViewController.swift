import Foundation
import UIKit
import RxSwift
import RxCocoa

class SettingsViewController: UIViewController, Storyboard {
    
    @IBOutlet weak var versionLabel: UILabel!
    
    fileprivate let viewModel = SettingsViewModel()
    
    fileprivate var eventSubject = PublishSubject<Event>()
    fileprivate var db = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}


//MARK: UI

fileprivate extension SettingsViewController {

    func setupUI() {
        setupNavigationBar()
        setupVersionLabel()
    }

    func setupNavigationBar() {
        self.title = R.string.localizedStrings.settings()
        
        self.navigationItem.hidesBackButton = true
        
        let backButton: UIButton = UIButton.init(type: .custom)
        backButton.setTitle(R.string.localizedStrings.back(), for: .normal)
        backButton.tintColor = .white
        backButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        backButton.addTarget(self, action: #selector(self.back), for: .touchUpInside)
        let backNavBarButton = UIBarButtonItem(customView: backButton)
        
        navigationItem.leftBarButtonItem = backNavBarButton
    }
    
    func setupVersionLabel() {
        versionLabel.text = viewModel.version
    }
}


//MARK: Actions

fileprivate extension SettingsViewController {
    
    @objc func back() {
        eventSubject.onNext(.finished)
    }
}


//MARK: Coordinated

extension SettingsViewController: Coordinated {

    enum Event {
        case finished
    }

    var events: Observable<SettingsViewController.Event> {
        return eventSubject
    }
}
