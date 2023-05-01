import Foundation

final class JsonLoader {
    
    //Файл menu.json который лежит в епсочнице -> [PrroductModel]
   func loadProducts(filename: String) -> [ProductModel]? {
        
        //Получаем путь файла из песочницы
        if let url = Bundle.main.url(forResource: filename, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url) //В бинарник
                
                let jsonData = try JSONDecoder().decode(ProductResponse.self, from: data) //Декодируем в модель
                
                return jsonData.products //Получаем продукты
            } catch {
                print(error)
            }
        }
        return nil
    }
}
