import UIKit

final class ProductsTableViewCell: UITableViewCell {
    
    static var reuseId = "ProductsTableViewCell"
    
    private var containerStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.widthAnchor.constraint(equalToConstant: Screen.width).isActive = true
        stackView.backgroundColor = .lightGray.withAlphaComponent(0.03)
        return stackView
    }()
    
    private var verticalStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.distribution = .equalCentering
        stackView.alignment = .leading
        return stackView
    }()
    
    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "image")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: Screen.width * 0.35).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: Screen.width * 0.35).isActive = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleLabel = Label(style: .titleBold, text: "title")
    private let descriptionLabel = Label(style: .description, text: "description")
    private let priceButton = Button(style: .price, text: "price")
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(_ product: ProductModel) {
        productImageView.image = UIImage(named: product.image)
        titleLabel.text = product.name
        descriptionLabel.text = product.description
        priceButton.setTitle("от \(product.price) руб.", for: .normal)
    }
}

extension ProductsTableViewCell {
    private func setupViews() {
        contentView.backgroundColor = .white
        contentView.addSubview(containerStackView)
        
        containerStackView.addArrangedSubview(productImageView)
        containerStackView.addArrangedSubview(verticalStackView)
        
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(descriptionLabel)
        verticalStackView.addArrangedSubview(priceButton)
    }
    
    private func setupConstraints() {
        containerStackView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        
        productImageView.snp.makeConstraints { make in
            make.left.top.bottom.equalTo(containerStackView).inset(10)
            make.right.equalTo(verticalStackView.snp.left).offset(-10)
            make.centerX.equalTo(verticalStackView.snp.centerX)
        }
        
        verticalStackView.snp.makeConstraints { make in
            make.top.bottom.right.equalTo(containerStackView).inset(10)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(verticalStackView).offset(10)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
        }
        
        priceButton.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(5)
        }
    }
}
