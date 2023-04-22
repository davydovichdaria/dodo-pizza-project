import UIKit

class EmptyScreenView: UIView {
    
    var onPriceButtonAction: (()->())?
    
    var emptyImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "empty view")
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 130).isActive = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    var emptyTitleLabel = Label(style: .emptyTitle, text: "Ой, пусто!")
    var emptyDescriptionLabel = Label(style: .emptyDescription, text: "Ваша корзина пуста, откройте «Меню» и выберите понравившийся товар.")
    var emptyShippingLabel = Label(style: .emptyDescription, text: "Мы доставим ваш заказ от 14,90 руб.")
    var goToMenuButton: UIButton = {
        var button = Button(style: .map, text: "Перейти в меню")
        button.addTarget(self, action: #selector(priceButtonTapped), for: .touchUpInside)
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
    
    @objc func priceButtonTapped() {
        onPriceButtonAction?()
    }
}

extension EmptyScreenView {
    func setupViews() {
        
        addSubview(emptyImageView)
        addSubview(emptyTitleLabel)
        addSubview(emptyDescriptionLabel)
        addSubview(emptyShippingLabel)
        addSubview(goToMenuButton)
    }
    
    func setupConstraints() {
        
        emptyImageView.snp.makeConstraints { make in
            make.top.equalTo(self).inset(110)
            make.left.right.equalTo(self).inset(10)
        }
        
        emptyTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(emptyImageView.snp.bottom).offset(65)
            make.centerX.equalTo(self)
        }
        
        emptyDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(emptyTitleLabel.snp.bottom).offset(10)
            make.left.right.equalTo(self).inset(50)
            make.centerX.equalTo(self)
        }
        
        emptyShippingLabel.snp.makeConstraints { make in
            make.top.equalTo(emptyDescriptionLabel.snp.bottom).offset(10)
            make.left.right.equalTo(self).inset(50)
            make.centerX.equalTo(self)
        }
        
        goToMenuButton.snp.makeConstraints { make in
            make.top.equalTo(emptyShippingLabel.snp.bottom).offset(20)
            make.left.right.equalTo(self).inset(50)
            make.centerX.equalTo(self)
        }
    }
}
