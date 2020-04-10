import SwiftUI
import CoreLocation

struct MyOptions: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var tag: String
    var data: String
    var isFavorite: Bool
    
    static let `default` = Self(id:9999, name: "", tag: "", data: "", isFavorite: false)
}


