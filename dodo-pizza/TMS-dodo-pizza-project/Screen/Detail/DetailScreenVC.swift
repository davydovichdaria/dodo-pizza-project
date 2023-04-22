import UIKit

final class DetailScreenVC: UIViewController {
    
    var currentProduct: ProductModel?
    var productsArchiver = ProductsArchiver()
    
    private var ingredientService = IngredientService()
    lazy var ingredients: [Ingredient] = []
    
    private var detailView: DetailScreenView {
        return self.view as! DetailScreenView
    }
    
    override func loadView() {
        self.view = DetailScreenView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailView.onDismissController = { //Step 3 close screen
            self.dismiss()
        }
        
        detailView.addProductToCartView.onDismissController = {
            self.dismiss()
        }
        
        if let product = currentProduct {
            detailView.update(product)
            ingredients = ingredientService.fetchIngredients()
            detailView.updateIngredients(ingredients)
        }
    }
    
    private func dismiss() {
        self.dismiss(animated: true, completion: nil)
    }
}

