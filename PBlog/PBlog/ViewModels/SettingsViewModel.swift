import Foundation

class SettingsViewModel {

    var version: String {
        return R.string.localizedStrings.appVersion() + (Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String)
    }
}
