import UIKit

final class ProductTableViewCell: UITableViewCell {
    static var reuseId = "ProductTableViewCell"
    
    private let containerStackView: UIStackView = {
        let stackView = UIStackView()

        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 3

        return stackView
    }()
    
    private let productImageView: UIImageView = {
        let imageView = UIImageView()

        imageView.image = UIImage(named: "")
        imageView.contentMode = .scaleAspectFit
        imageView.heightAnchor.constraint(equalToConstant: 240).isActive = true

        return imageView
    }()

    private let productTitleLabel = Label(style: .detailTitle, text: "product title")
    private let productDetailLabel = Label(style: .sizeDescription, text: "size description")


    private let productDescriptionLabel = Label(style: .detailDescription, text: "description")
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public
    func update(_ product: ProductModel) {
        productTitleLabel.text = product.name
        productDetailLabel.text = "Средняя \(product.size ?? 30) см, традиционное тесто, \(product.weight ?? 670) г"
        productDescriptionLabel.text = product.description
        productImageView.image = UIImage(named: product.image)
    }
}

extension ProductTableViewCell {
    private func setupViews() {
        contentView.addSubview(containerStackView)

        containerStackView.addArrangedSubview(productImageView)
        containerStackView.addArrangedSubview(productTitleLabel)
        containerStackView.addArrangedSubview(productDetailLabel)
        containerStackView.addArrangedSubview(productDescriptionLabel)
    }
    
    private func setupConstraints() {
        containerStackView.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView)
            make.right.left.equalTo(contentView).inset(20)
        }
    }
}
