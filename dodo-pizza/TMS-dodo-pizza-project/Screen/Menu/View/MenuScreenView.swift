import UIKit

final class MenuScreenView: UIView {
    
    private var banners: [Banners] = []
    private var categories: [Category] = []
    private var menuProducts: [ProductModel] = []
    
    var menuTableView = MenuTableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public update
    func updateBanners(_ banners: [Banners]) {
        self.banners = banners
        menuTableView.updateBanner(banners: banners)
    }
    
    func updateCategories(_ categories: [Category]) {
        self.categories = categories
        menuTableView.updateCategory(categories: categories)
    }
    
    func updateProducts(_ products: [ProductModel]) {
        self.menuProducts = products
        menuTableView.updateProducts(menuProducts: menuProducts)
    }
}

extension MenuScreenView {
    private func setupViews() {
        self.backgroundColor = .white
        self.addSubview(menuTableView)
    }
    
    private func setupConstraints() {
        menuTableView.snp.makeConstraints { make in
            make.edges.equalTo(self.safeAreaLayoutGuide)
        }
    }
}
