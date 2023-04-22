import UIKit

class CartTableView: UITableView {
    
    private var products: [ProductModel] = []
//     var orderService = OrderSevice()
    
    var order: Order = Order(products: [])
    
    var onProductsIsEmpty: (()->())?
    
    var productsArchiver = ProductsArchiver()

    private lazy var orderHeaderLabel = OrderHeaderLabel.init(frame: CGRect(x: 0, y: 0, width: Screen.width, height: 50))
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: .zero, style: style)
        
        self.tableHeaderView = orderHeaderLabel
        self.allowsSelection = false
            
        self.register(ProductCell.self, forCellReuseIdentifier: ProductCell.reuseId)
        self.register(OrderInfoCell.self, forCellReuseIdentifier: OrderInfoCell.reuseId)
            
        self.delegate = self
        self.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(_ products: [ProductModel]) {
        self.products = products
    }
    
    func update(_ order: Order) {
        self.order = order
        orderHeaderLabel.updateHeaderLabel(order.count, order.totalPrice)
    }
    
    private func updateDataTableView() {
        orderHeaderLabel.updateHeaderLabel(order.count, order.totalPrice)
        self.reloadData()
    }
    


}

extension CartTableView: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return CartSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let section = CartSection.init(rawValue: section)
        switch section {
        case .product: return order.products.count
        case .order: return 1
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = CartSection.init(rawValue: indexPath.section)
        switch section {
        case .product:
            let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.reuseId, for: indexPath) as! ProductCell
            
            let product = order.products[indexPath.row]
            cell.update(product, index: indexPath.row)
            
            cell.counterView.addTarget(self, action: #selector(productCountChanged), for: .valueChanged)
            
            return cell
        case .order:
            let cell = tableView.dequeueReusableCell(withIdentifier: OrderInfoCell.reuseId, for: indexPath) as! OrderInfoCell
            cell.update(order.count, order.totalPrice)
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    @objc func productCountChanged(counter: CounterView) {
        order.products[counter.index].count = counter.currentValue
        
        if counter.currentValue == 0 {
            order.products.remove(at: counter.index)
            
            print(order.products.count)
            onProductsIsEmpty?()
        }
        updateDataTableView()
        productsArchiver.save(order.products)
    }
}

