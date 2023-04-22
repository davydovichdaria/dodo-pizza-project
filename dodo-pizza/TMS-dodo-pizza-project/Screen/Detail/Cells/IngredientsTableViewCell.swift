import UIKit

final class IngredientsTableViewCell: UITableViewCell {
    static var reuseId = "IngredientsTableViewCell"
    private var ingredients: [Ingredient] = []
    
    let ingredientsCollectionView = IngredientsCollectionView()
    
    private let titleLabel = Label(style: .titleBold, text: "Добавить по вкусу")

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension IngredientsTableViewCell {
    private func setupViews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(ingredientsCollectionView)
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(20)
            make.left.right.equalTo(contentView).inset(20)
        }
        
        ingredientsCollectionView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.left.right.bottom.equalTo(contentView)
        }
    }
}
