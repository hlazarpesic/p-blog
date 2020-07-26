import Foundation

enum PBlogAPI {

    case fetchAllData
}


//MARK: Method

extension PBlogAPI {

    var method: HTTPMethod {
        switch self {
        case .fetchAllData:
            return .get
        }
    }
}


//MARK: Path

extension PBlogAPI {

    var path: String {
        switch self {
        case .fetchAllData:
            return ""
        }
    }
}


//MARK: Parameters

extension PBlogAPI {

    var parameters: Parameters {
        switch self {
        case .fetchAllData:
            return [:]
        }
    }
}


//MARK: Header

extension PBlogAPI {

    static let newsApiKey = "d55c424a60964bdcb3f0873442b2a766"

    struct Keys {
        static let authorizationKey = "Authorization"
    }

    static var defaultHeader: [String: String] {
        return [
            Keys.authorizationKey: "Bearer " + newsApiKey
        ]
    }

    var header: [String: String] {
        switch self {
        case .fetchAllData:
            return PBlogAPI.defaultHeader
        }
    }
}