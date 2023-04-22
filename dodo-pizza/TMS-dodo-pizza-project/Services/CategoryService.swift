import Foundation

class CategoryService {
    var categories: [Category] = [
        Category(name: "Пицца"),
        Category(name: "Комбо"),
        Category(name: "Закуски"),
        Category(name: "Кофе"),
        Category(name: "Коктейли"),
        Category(name: "Десерты"),
        Category(name: "Напитки"),
        Category(name: "Соусы"),
        Category(name: "Другие товары")
    ]
    
    func fetchCategories() -> [Category] {
        return categories
    }
}
