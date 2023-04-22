import UIKit

enum CartSection: Int, CaseIterable {
    case product = 0
    case order = 1
}

enum OrderState {
    case loaded
    case noData
    case error
}

final class CartScreenVC: UIViewController {
    
    var productsArchiver = ProductsArchiver()
    
    private lazy var products: [ProductModel] = productsArchiver.retrieve()
    lazy var order = Order(products: [])
    
    private var cartTableView = CartTableView.init()
    
    private var cartView: CartScreenView {
        return self.view as! CartScreenView
    }
    
    override func loadView() {
        self.view = CartScreenView.init(frame: Screen.bounds)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        order = Order(products: productsArchiver.retrieve())
        update()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cartView.emptyView.onPriceButtonAction = {
            self.tabBarController?.selectedIndex = 0
        }
    }
    
    func update() {
        cartView.update(order)
    }
}

