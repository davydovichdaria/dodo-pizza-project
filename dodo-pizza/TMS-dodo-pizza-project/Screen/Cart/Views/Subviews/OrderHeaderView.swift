import UIKit

final class OrderHeaderLabel: UILabel {
    
    lazy var headerLabel = Label(style: .header, text: "Товаров на сумму")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Обновить данные в Total count and price header view
    func updateHeaderLabel(_ count: Int, _ totalPrice: Int) {
        headerLabel.text = "\(count) товаров на сумму \(totalPrice) руб"
    }
}

extension OrderHeaderLabel {
    func setupViews() {
        addSubview(headerLabel)
    }
    
    func setupConstraints() {
        headerLabel.snp.makeConstraints { make in
            make.top.right.bottom.equalTo(self).inset(5)
            make.left.equalTo(self).inset(20)
        }
    }
}


