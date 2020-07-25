import Foundation

final class Database: Singleton {
    
    static let instance: Database = Database()
    
    fileprivate init() { }
    
    let mainListDAO = MainListDAO()
    let favoritesDAO = FavoritesDAO()
}
