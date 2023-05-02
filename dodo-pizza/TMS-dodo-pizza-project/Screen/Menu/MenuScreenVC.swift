import UIKit

final class MenuScreenVC: UIViewController {
    
    var productsAPI = ProductAPIImpl.init()
    var products: [ProductModel] = []
    
    private var categoriesService = CategoryService()
    private var bannersService = BannersService() //Массив баннеров
    
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
                let productsResponse = try await productsAPI.fetchMenu()
                products = productsResponse.products
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
        let categories = categoriesService.fetchCategories()
        menuView.updateCategories(categories)
    }
    
    func showDetailProduct(_ product: ProductModel) {
        let controller = DetailScreenVC()
        controller.currentProduct = product
        self.present(controller, animated: true)
    }
}

