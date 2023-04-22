import Foundation

class IngredientService {
    var ingredients: [Ingredient] = [
        Ingredient(name: "Сырный бортик", price: "4,40 руб.", imageView: "Cheese border"),
        Ingredient(name: "Сливочная моцарелла", price: "3,10 руб.", imageView: "Mosarella"),
        Ingredient(name: "Чеддер и пармезан", price: "2,80 руб.", imageView: "Chedder and parmezan"),
        Ingredient(name: "Острый халапеньо", price: "2,00 руб.", imageView: "Hot halapenio"),
        Ingredient(name: "Нежный цыпленок", price: "2,80 руб.", imageView: "Chicken"),
        Ingredient(name: "Пикантная пепперони", price: "2,80 руб.", imageView: "Pepperoni"),
        Ingredient(name: "Ветчина", price: "2,80 руб.", imageView: "Vetchina"),
        Ingredient(name: "Шампиньоны", price: "2,00 руб.", imageView: "Mashrooms"),
        Ingredient(name: "Маринованные огурчики", price: "2,00 руб.", imageView: "Cucumbers"),
        Ingredient(name: "Хрустящий бекон", price: "2,80 руб.", imageView: "Bacon"),
        Ingredient(name: "Свежие томаты", price: "2,00 руб.", imageView: "Tomato"),
        Ingredient(name: "Острая чоризо", price: "2,80 руб.", imageView: "Hot chorizo"),
        Ingredient(name: "Брынза", price: "2,80 руб.", imageView: "Brynza"),
        Ingredient(name: "Сыр блю чиз", price: "3,10 руб.", imageView: "Blue cheese"),
        Ingredient(name: "Красный лук", price: "2,00 руб.", imageView: "Red onion"),
        Ingredient(name: "Итальянские травы", price: "2,00 руб.", imageView: "Italian grass"),
        Ingredient(name: "Ананасы", price: "2,00 руб.", imageView: "Pine apple"),
        Ingredient(name: "Сладкий перец", price: "2,00 руб.", imageView: "Sweet paper"),
        Ingredient(name: "Маслины", price: "2,00 руб.", imageView: "Masliny"),
        Ingredient(name: "Митболы", price: "3,10 руб.", imageView: "Meatball")
    ]
    
    func fetchIngredients() -> [Ingredient] {
        return ingredients
    }
}
