import Foundation
import RxSwift

final class Repository: Singleton {
    
    static let instance: Repository = Repository()
    
    fileprivate init() { }
    
    internal let apiDataStore = ApiDataStore.instance
    internal let database = Database.instance
}
