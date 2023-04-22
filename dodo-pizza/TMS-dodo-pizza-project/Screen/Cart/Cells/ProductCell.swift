import UIKit

class ProductCell: UITableViewCell {
    
    static let reuseId = "ProductCell"
    lazy var counterView = CounterView()
    
    var productContainerView: UIStackView = {
        var containerView = UIStackView()
        containerView.axis = .vertical
        return containerView
    }()
    
    var horizontalStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 15, trailing: 15)
        return stackView
    }()
    
    var verticalStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .equalCentering
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 15, trailing: 15)
        return stackView
    }()
    
    var priceStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 15, trailing: 15)
        return stackView
    }()
    
    var pizzaImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "image")
        return imageView
    }()
    
    var titleLabel = Label(style: .title, text: "title label")
    var descriptionLabel = Label(style: .description, text: "description label")
    var priceLabel = Label(style: .titleBold, text: "price label")
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(_ product: ProductModel, index: Int) {
        titleLabel.text = product.name
        descriptionLabel.text = product.description
        priceLabel.text = "\(product.price) руб."
        pizzaImageView.image = UIImage(named: "\(product.image)")
        
        counterView.currentValue = product.count ?? 0
        counterView.index = index
    }
}

//MARK: - Constraints
extension  ProductCell {
    func setupViews() {
        contentView.addSubview(productContainerView)
        
        productContainerView.addArrangedSubview(horizontalStackView)
        productContainerView.addArrangedSubview(priceStackView)
        
        horizontalStackView.addArrangedSubview(pizzaImageView)
        horizontalStackView.addArrangedSubview(verticalStackView)
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(descriptionLabel)
        
        priceStackView.addArrangedSubview(priceLabel)
        priceStackView.addArrangedSubview(counterView) //Our component
    }
    
    func setupConstraints() {
        productContainerView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        
        horizontalStackView.snp.makeConstraints { make in
            make.top.equalTo(productContainerView)
            make.left.right.equalTo(productContainerView).inset(20)
        }
        
        priceStackView.snp.makeConstraints { make in
            make.bottom.equalTo(productContainerView)
            make.left.right.equalTo(productContainerView).inset(20)
            make.top.equalTo(horizontalStackView.snp.bottom)
        }
        
        pizzaImageView.snp.makeConstraints { make in
            make.height.width.equalTo(100)
        }
    }
}
