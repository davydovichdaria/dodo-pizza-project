import UIKit

class CartScreenView: UIView {
    private var products: [ProductModel] = []
    private var order: Order = Order(products: [])
    
    var cartTableView = CartTableView.init()
    var emptyView = EmptyScreenView.init()
    
    var onPromocodeTapped: (()->())?
    
    private lazy var orderHeaderLabel = OrderHeaderLabel.init(frame: CGRect(x: 0, y: 0, width: Screen.width, height: 50))
    private var orderButtonView = OrderButtonView()
    
    private var state: OrderState = .noData {
        didSet {
            switch state {
            case .noData:
                cartTableView.isHidden = true
                orderButtonView.isHidden = true
                emptyView.isHidden = false
            case .loaded:
                cartTableView.isHidden = false
                orderButtonView.isHidden = false
                emptyView.isHidden = true
            case .error:
                cartTableView.isHidden = true
                orderButtonView.isHidden = true
                emptyView.isHidden = true
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
        
        cartTableView.onProductsIsEmpty = {
            self.hiddenViews()
        }
        
        cartTableView.onPromocodeTapped = {
            self.onPromocodeTapped?()
        }
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Public
    func updateProducts(_ products: [ProductModel]) {
        self.products = products
        cartTableView.update(products)
    }
    
    func update(_ order: Order) {
        self.order = order
        cartTableView.update(order)
        orderHeaderLabel.updateHeaderLabel(order.count, order.totalPrice)
        orderButtonView.update(order.totalPrice)
        cartTableView.reloadData()
        hiddenViews()
    }
    
    private func hiddenViews() {
        if cartTableView.order.products.isEmpty {
            state = .noData
        } else {
            state = .loaded
        }
    }
}

extension CartScreenView {
    
    private func setupViews() {
        self.backgroundColor = .white
        
        self.addSubview(emptyView)
        self.addSubview(cartTableView)
        self.addSubview(orderButtonView)

        emptyView.isHidden = true
    }
    
    private func setupConstraints() {
        
        emptyView.snp.makeConstraints { make in
            make.edges.equalTo(self.safeAreaLayoutGuide)
        }
        cartTableView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(self.safeAreaLayoutGuide)
        }
        
        orderButtonView.snp.makeConstraints { make in
            make.top.equalTo(cartTableView.snp.bottom)
            make.leading.bottom.trailing.equalTo(self.safeAreaLayoutGuide)
        }
    }
}
