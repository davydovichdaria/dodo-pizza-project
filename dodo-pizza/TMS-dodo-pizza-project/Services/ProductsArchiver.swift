import UIKit

protocol ProductsArchiverInput {
    func save(_ products: [ProductModel]) //сохраняем продукты
    func retrieve() -> [ProductModel] //возвращаем массив продуктов
}

final class ProductsArchiver: ProductsArchiverInput {
    
    private let encoder = JSONEncoder() //модель в бинарник
    private let decoder = JSONDecoder() //бинарник в модель
    
    private let key = "OrderProducts"
    
    //MARK: - Public methods
    func save(_ products: [ProductModel]) { //метод сохранить
        
        //Array<Product> -> Data
        //массив кладем в бинарник и кодируем, бинарник кладем в UserDefaults
        do {
            let data = try encoder.encode(products)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    //retrieve - получить данные
    func retrieve() -> [ProductModel] {  //метод получить
        
        //Data -> Array<Product>
        //вытаскиваем из UserDefaults бинарник
        guard let data = UserDefaults.standard.data(forKey: key) else { return [] }
        do {
            //раскодировали бинарник в массив
            let array = try decoder.decode(Array<ProductModel>.self, from: data)
            return array
        } catch {
            print(error)
        }
        return []
    }
}
