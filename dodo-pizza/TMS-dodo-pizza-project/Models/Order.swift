import Foundation

//Класс общего заказа
class Order {
    var products: [ProductModel] //В OrderService пропихиваем сюда массив продуктов
    
    var totalPrice: Int {
        var result: Int = 0
        for product in products {
            result += (product.count ?? 0) * product.price
        }
        return result
    }
    
    var count: Int {
        var result = 0
        for product in products {
            result += (product.count ?? 0)
        }
        return result
    }
    
    init(products: [ProductModel]) {
        self.products = products
    }
}
