import UIKit

final class MenuScreenVC: UIViewController {
    
    let menuAPI = MenuAPI()
    
    private var bannersService = BannersService() //Массив баннеров
//    lazy var banners: [Banners] = []
    
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
        
        fetchProducts()
        fetchBanners()
        fetchCategories()

        menuView.menuTableView.onProductCellSelected = { product in //Приняли
            self.showDetailProduct(product) //показываем выбранный
        }
    }
    
    func fetchProducts() {
        Task {
            do {
                let products = try await menuAPI.fetchMenu()
                menuView.updateProducts(products)
                menuView.menuTableView.reloadData()
            } catch {
                print(error)
            }
        }
    }
    
    func fetchBanners() {
        let banners = bannersService.fetchBanners()
        menuView.updateBanners(banners)
    }
    
    func fetchCategories() {
        let categories = categoryService.fetchCategories()
        menuView.updateCategories(categories)
    }
    
    func showDetailProduct(_ product: ProductModel) {
        let controller = DetailScreenVC()
        controller.currentProduct = product
        self.present(controller, animated: true)
    }
}

