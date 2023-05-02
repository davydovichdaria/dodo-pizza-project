import Foundation

class CategoryService {
    var categories: [Categories] = [
        Categories(name: "Пицца"),
        Categories(name: "Комбо"),
        Categories(name: "Закуски"),
        Categories(name: "Кофе"),
        Categories(name: "Коктейли"),
        Categories(name: "Десерты"),
        Categories(name: "Напитки"),
        Categories(name: "Соусы"),
        Categories(name: "Другие товары")
    ]
    
    func fetchCategories() -> [Categories] {
        return categories
    }
}
