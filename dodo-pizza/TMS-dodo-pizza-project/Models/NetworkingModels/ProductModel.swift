import Foundation

struct MenuModel: Codable {
    
    let products: [ProductModel]
}

class ProductModel: Codable, Hashable {
    static func == (lhs: ProductModel, rhs: ProductModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    
    var id: Int?
    var name: String
    var description: String
    var size: Int?
    var weight: Int?
    var price: Int
    var count: Int?
    var image: String
    var category: String?
//    var ingredients: [Ingredient]?
}
