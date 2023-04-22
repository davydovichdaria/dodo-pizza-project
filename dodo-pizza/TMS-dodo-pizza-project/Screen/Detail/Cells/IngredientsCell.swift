import UIKit

class IngredientsCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "IngredientsCollectionViewCell"
    
    var cellStackView: UIStackView = {
        var view = UIStackView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.alignment = .center
        view.axis = .vertical
        view.spacing = 5
        view.isLayoutMarginsRelativeArrangement = true
        view.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 20, trailing: 10)
        
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
        view.layer.shadowRadius = 11.0
        view.layer.shadowOpacity = 0.2
        view.layer.masksToBounds = false
        
        view.layer.borderWidth = 1
        view.layer.borderColor = CGColor.init(gray: 45, alpha: 0.3)
        return view
    }()
    
    var productImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "Cheese border")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    var titleLabel = Label(style: .ingredient, text: "ingredient")
    var priceLabel = Label(style: .titleBold, text: "price")

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateIngredients(_ ingredient: Ingredient) {
        titleLabel.text = ingredient.name
        priceLabel.text = ingredient.price
        productImageView.image = UIImage(named: "\(ingredient.imageView)")
    }
}

extension IngredientsCollectionViewCell {
    
    func setupViews() {
        contentView.addSubview(cellStackView)
        
        cellStackView.addArrangedSubview(productImageView)
        cellStackView.addArrangedSubview(titleLabel)
        cellStackView.addArrangedSubview(priceLabel)
    }
    
    func setupConstraints() {
        cellStackView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }
}
