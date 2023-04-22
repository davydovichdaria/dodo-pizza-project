import UIKit

final class BannersCollectionViewCell: UICollectionViewCell {
    static let reuseId = "BannersCollectionViewCell"
    
    private var containerView: UIView = {
        var view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 2
        view.layer.borderColor = CGColor(red: 237/255, green: 115/255, blue: 46/255, alpha: 1)
        view.layer.cornerRadius = 13
        return view
    }()
    
    private var bannerImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "banner1")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: Screen.width * 0.35).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: Screen.width * 0.3).isActive = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public update
    func update(_ banners: Banners) {
        bannerImageView.image = UIImage(named: "\(banners.image)")
    }
}

extension BannersCollectionViewCell {
    private func setupViews() {
        contentView.addSubview(containerView)
        containerView.addSubview(bannerImageView)
    }
    
    private func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        
        bannerImageView.snp.makeConstraints { make in
            make.edges.equalTo(containerView).inset(4)
        }
    }
}
