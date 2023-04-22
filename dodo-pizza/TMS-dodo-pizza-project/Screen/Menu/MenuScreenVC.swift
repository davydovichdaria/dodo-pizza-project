import UIKit

final class MenuScreenVC: UIViewController {
    
    lazy var menuProducts: [ProductModel] = []  //Массив продуктов
    
    private var bannersService = BannersService() //Массив баннеров
    lazy var banners: [Banners] = []
    
    private var categoryService = CategoryService()
    lazy var categories: [Category] = [] // Массив категорий
    
    var jsonLoader = JsonLoader()
    
    private var menuView: MenuScreenView { //Переменная с сылкой на кастомную вью
        return self.view as! MenuScreenView
    }
    
    override func loadView() { //Подменили корневую вью на кастомную
        self.view = MenuScreenView(frame: Screen.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuProducts = fetchProducts()
        banners = bannersService.fetchBanners()
        categories = categoryService.fetchCategories()
        
        menuView.updateBanners(banners)
        menuView.updateCategories(categories)
        menuView.updateProducts(menuProducts)
        
        menuView.menuTableView.onProductCellSelected = { product in //Приняли
            self.showDetailProduct(product) //показываем выбранный
        }
    }
    
    func fetchProducts() -> [ProductModel] {
        jsonLoader.loadProducts(filename: "menu") ?? []
    }
    
    func showDetailProduct(_ product: ProductModel) {
        let controller = DetailScreenVC()
        controller.currentProduct = product
        self.present(controller, animated: true)
    }
}

