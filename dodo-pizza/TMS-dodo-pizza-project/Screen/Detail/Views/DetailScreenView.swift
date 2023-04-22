import UIKit

final class DetailScreenView: UIView {
    
    var detailTableView = DetailTableView()
    var addProductToCartView = AddProductToCartView()
    
    private var ingredients: [Ingredient] = []
    
    var onDismissController: (()->())? //Step 1 close screen
    
    let closeButton: UIButton = {
        let button = Button(style: .close, text: "chevron.down")
        button.addTarget(self, action: #selector(dismiss), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public
    func update(_ product: ProductModel) {
        detailTableView.update(product)
        addProductToCartView.update(product)
    }
    
    func updateIngredients(_ ingredients: [Ingredient]) {
        self.ingredients = ingredients
        detailTableView.updateIngredients(ingredients)
    }
    
    @objc func dismiss() {
        onDismissController?() //Step 2 close screen
    }
}

extension DetailScreenView {
    private func setupViews() {
        self.backgroundColor = .white
        
        self.addSubview(detailTableView)
        self.addSubview(addProductToCartView)
        self.addSubview(closeButton)
    }
    
    private func setupConstraints() {
        detailTableView.snp.makeConstraints { make in
            make.top.equalTo(self).inset(30)
            make.left.right.equalTo(self)
            make.bottom.equalTo(addProductToCartView.snp.top)
        }
        
        addProductToCartView.snp.makeConstraints { make in
            make.left.right.equalTo(self)
            make.bottom.equalTo(self.snp.bottom)
        }
        
        closeButton.snp.makeConstraints { make in
            make.top.left.equalTo(self).inset(16)
        }
    }
}
