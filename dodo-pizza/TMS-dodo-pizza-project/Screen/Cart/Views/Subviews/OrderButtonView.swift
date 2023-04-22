import UIKit

final class OrderButtonView: UIView {
    
    var orderView: UIView = {
        var view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 75).isActive = true
        return view
    }()
    
    lazy var orderButton = Button(style: .order, text: "Оформить заказ")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    ///Передача цены в orderButton
    func update(_ price: Int) {
        orderButton.setTitle("Оформить заказ на \(price) руб", for: .normal)
    }
}

extension OrderButtonView {
    func setupViews() {
        addSubview(orderButton)
    }
    
    func setupConstraints() {
        orderButton.snp.makeConstraints { make in
            make.top.bottom.equalTo(self).inset(15)
            make.left.right.equalTo(self).inset(50)
            make.height.equalTo(45)
        }
    }
}
