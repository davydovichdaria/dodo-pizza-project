import UIKit
import SnapKit

class MainTabVC: UITabBarController {
    
    private var menuVC: MenuScreenVC = {
        let controller = MenuScreenVC()
        let image = UIImage(systemName: "menucard")
        let selectedImage = UIImage(systemName: "menucard")
        let tabItem = UITabBarItem.init(title: "Меню", image: image, selectedImage: selectedImage)
        controller.tabBarItem = tabItem
        return controller
    }()
    
    private var cartVC: CartScreenVC = {
        let controller = CartScreenVC()
        let image = UIImage(systemName: "cart")
        let selectedImage = UIImage(systemName: "cart")
        let tabItem = UITabBarItem.init(title: "Корзина", image: image, selectedImage: selectedImage)
        controller.tabBarItem = tabItem
        return controller
    }()
    
    private var contactVC: ContactScreenVC = {
        let controller = ContactScreenVC()
        let image = UIImage(systemName: "location")
        let selectedImage = UIImage(systemName: "location")
        let tabItem = UITabBarItem(title: "Контакты", image: image, selectedImage: selectedImage)
        controller.tabBarItem = tabItem
        return controller
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
        viewControllers = [menuVC, contactVC, cartVC]
    }
    
    private func setup() {
        tabBar.tintColor = .orange
        tabBar.backgroundColor = .white
    }
}
