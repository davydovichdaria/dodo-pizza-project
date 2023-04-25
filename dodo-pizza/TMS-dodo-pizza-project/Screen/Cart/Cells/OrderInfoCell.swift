import UIKit

class OrderInfoCell: UITableViewCell {
    
    static let reuseId = "OrderInfoCell"
    var productsCount: Int = 1
    var orderPrice: Int = 1
    lazy var countProductsLabel = createTextLabel("\(productsCount) товаров")
    lazy var totalPriceLabel = createPriceLabel("\(orderPrice) руб")
    
    var onPromocodeTapped: (()->())?
    
    private var verticalStackView: UIStackView = {
        var tableView = UIStackView()
        tableView.axis = .vertical
        tableView.isLayoutMarginsRelativeArrangement = true
        tableView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
        tableView.spacing = 20
        return tableView
    }()
    
    private var horizontalStackView: UIStackView = {
        var tableView = UIStackView()
        tableView.axis = .horizontal
        return tableView
    }()
    
    private var descriptionTitlesStackView: UIStackView = {
        let tableView = UIStackView()
        tableView.axis = .vertical
        tableView.spacing = 10
        tableView.alignment = .leading
        return tableView
    }()
    
    private var descriptionResultsStackView: UIStackView = {
        let tableView = UIStackView()
        tableView.axis = .vertical
        tableView.spacing = 10
        tableView.alignment = .trailing
        return tableView
    }()
    
    func createTextLabel(_ text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        return label
    }
    
    func createPriceLabel(_ text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        return label
    }
    
    private var dodocoinsLabel = Label(style: .title, text: "Начислим додокоинов")
    private var dodocoinsCountLabel = Label(style: .title, text: "+ 103 D")
    private var shippingLabel = Label(style: .title, text: "Доставка")
    private var shippingResultLabel = Label(style: .title, text: "Бесплатно")
    
    private var promocodeButton: UIButton = {
        var button = Button(style: .promocode, text: "Ввести промокод")
        button.addTarget(self, action: #selector(showPromocodeModal), for: .touchUpInside)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(_ count: Int, _ price: Int) {
        totalPriceLabel.text = "\(price) руб"
        switch count {
        case 1, 21: countProductsLabel.text = "\(count) товар"
        case 2...4, 22...24: countProductsLabel.text = "\(count) товара"
        case 5...20, 25...30: countProductsLabel.text = "\(count) товаров"
        default: countProductsLabel.text = "\(count) товаров"
        }
    }

    @objc private func showPromocodeModal() {
            self.onPromocodeTapped?()
    }
    

}

//MARK: - Constraints
extension OrderInfoCell {
    private func setupViews() {
        contentView.addSubview(verticalStackView)
        
        verticalStackView.addArrangedSubview(promocodeButton)
        verticalStackView.addArrangedSubview(horizontalStackView)
        
        horizontalStackView.addArrangedSubview(descriptionTitlesStackView)
        horizontalStackView.addArrangedSubview(descriptionResultsStackView)
        
        descriptionTitlesStackView.addArrangedSubview(countProductsLabel)
        descriptionTitlesStackView.addArrangedSubview(dodocoinsLabel)
        descriptionTitlesStackView.addArrangedSubview(shippingLabel)
        
        descriptionResultsStackView.addArrangedSubview(totalPriceLabel)
        descriptionResultsStackView.addArrangedSubview(dodocoinsCountLabel)
        descriptionResultsStackView.addArrangedSubview(shippingResultLabel)
    }
    
    private func setupConstraints() {
        verticalStackView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        
        promocodeButton.snp.makeConstraints { make in
            make.height.equalTo(35)
        }
    }
}
