import Foundation

struct Configuration {

    fileprivate let configuration: ApplicationConfiguration

    init(configuration: ApplicationConfiguration = Configuration.currentConfiguration) {
        self.configuration = configuration
    }
}


//MARK: ApplicationConfiguration

extension Configuration: ApplicationConfiguration {

    public var domain: String {
        return configuration.domain
    }
}


//MARK: Properties

extension Configuration {

    static var current: ConfigurationType {
        guard
                let infoDictionary = Bundle.main.infoDictionary,
                let configurationName = infoDictionary["Configuration"] as? String,
                let buildConfiguration = ConfigurationType(rawValue: configurationName)
                else {
            return .Production
        }

        return buildConfiguration
    }

    static var isDevelopment: Bool {
        return current == .Development
    }

    static var isStaging: Bool {
        return current == .Staging
    }

    static var isRelease: Bool {
        return current == .Production
    }
}


//MARK: Runtime Configuration Determination

fileprivate extension Configuration {

    static var currentConfiguration: ApplicationConfiguration {
        switch current {
        case .Development:
            return DevelopmentConfiguration()
        case .Staging:
            return StagingConfiguration()
        case .Production:
            return ProductionConfiguration()
        }
    }
}
