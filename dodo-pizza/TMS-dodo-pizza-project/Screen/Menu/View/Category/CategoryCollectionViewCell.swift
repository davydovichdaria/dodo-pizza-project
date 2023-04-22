import UIKit

final class CategoryCollectionViewCell: UICollectionViewCell {
    static let reuseId = "CategoryCell"
    
    private var containerView: UIView = {
        var view = UIView()
        view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        view.layer.cornerRadius = 13
        return view
    }()
    
    private var categoryButton = Button(style: .category, text: "category")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public update
    func update(_ category: Category) {
        categoryButton.setTitle("\(category.name)", for: .normal)
    }
}

extension CategoryCollectionViewCell {
    private func setupViews() {
        contentView.addSubview(containerView)
        containerView.addSubview(categoryButton)
    }
    
    private func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        
        categoryButton.snp.makeConstraints { make in
            make.edges.equalTo(containerView)
        }
    }
}
