import UIKit

enum MenuSection: Int, CaseIterable {
    case banners
    case categories
    case products
}

final class MenuTableView: UITableView {
    private var banners: [Banners] = []
    private var products: [ProductModel] = []
    private var categories: [Category] = []
    
    var onProductCellSelected: ((ProductModel)->())?
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: .zero, style: style)
        
        self.delegate = self
        self.dataSource = self
        
        self.separatorStyle = .none
        self.register(BannersTableViewCell.self, forCellReuseIdentifier: BannersTableViewCell.reuseId)
        self.register(CategoryTableViewCell.self, forCellReuseIdentifier: CategoryTableViewCell.reuseId)
        self.register(ProductsTableViewCell.self, forCellReuseIdentifier: ProductsTableViewCell.reuseId)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateBanner(banners: [Banners]) {
        self.banners = banners
    }
    
    func updateCategory(categories: [Category]) {
        self.categories = categories
    }
    
    func updateProducts(_ products: [ProductModel]) {
        self.products = products
    }
}

extension MenuTableView: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return MenuSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = MenuSection.init(rawValue: section)
        switch section {
        case .banners: return 1
        case .categories: return 1
        case .products: return products.count
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = MenuSection.init(rawValue: indexPath.section)
        switch section {
        case .banners:
            let cell = tableView.dequeueReusableCell(withIdentifier: BannersTableViewCell.reuseId, for: indexPath) as! BannersTableViewCell
            cell.update(banners)
            return cell
            
        case .categories:
            let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.reuseId, for: indexPath) as! CategoryTableViewCell
            cell.update(categories)
            return cell
        case .products:
            let cell = tableView.dequeueReusableCell(withIdentifier: ProductsTableViewCell.reuseId, for: indexPath) as! ProductsTableViewCell
            
            let product = products[indexPath.row]
            cell.update(product)
            return cell
        default: return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = products[indexPath.row]
        onProductCellSelected?(product)
    }
}

