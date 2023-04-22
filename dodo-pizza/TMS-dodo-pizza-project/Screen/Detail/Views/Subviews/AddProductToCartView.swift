import UIKit

final class AddProductToCartView: UIView {
    
    private var currentProduct: ProductModel?
    private var productsArchiever = ProductsArchiver()
    var onDismissController: (()->())?
    
    lazy var cartButton: UIButton = {
        var button = Button(style: .addToCart, text: "add")
        button.addTarget(self, action: #selector(addProductToCart), for: .touchUpInside)
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
        currentProduct = product
        cartButton.setTitle("В корзину за \(product.price) BYN", for: .normal)
    }
    
    @objc func addProductToCart() {
        updateCart()
        onDismissController?() //Вызвали
    }
    
    private func updateCart() {
        var productsInCart = productsArchiever.retrieve() //Получили массив из хранилища
        
        let isRepeatProduct = productsInCart.contains { $0.id == currentProduct?.id } // Проверка на повтор, возращаем true - false
        
        defer {
            productsArchiever.save(productsInCart)
        }
        
        if productsInCart.isEmpty || !isRepeatProduct { //Пустой либо новый продукт
            productsInCart.append(currentProduct!)
            currentProduct?.count = 1
            return //Возвращаемся к defer и выходим из функции
        }
        
        for item in productsInCart {
            var count = item.count ?? 1 //Сколько у каждого продукта item
            
            if item.id == currentProduct?.id { //Итерации по массиву, если нашли совпадение, то +1
                count += 1
                item.count = count
            }
        }
    }
}

extension AddProductToCartView {
    private func setupViews() {
        self.backgroundColor = .white.withAlphaComponent(0.7)
        addSubview(cartButton)
    }
    
    private func setupConstraints() {
        cartButton.snp.makeConstraints { make in
            make.top.left.right.equalTo(self).inset(20)
            make.bottom.equalTo(self).inset(40)
        }
    }
}
