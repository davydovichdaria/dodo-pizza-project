import UIKit

#warning("change to header section")
final class CategoriesTableViewCell: UITableViewCell{
    
    static let reuseId = "CategoriesTableViewCell"
    private var categories: [Categories] = []
    
    var containerView: UIView = {
        var view = UIView()
        view.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var collectionView: UICollectionView = {
        
        var layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumLineSpacing = 10
        
        var collection = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        collection.register(CategoriesCollectionViewCell.self, forCellWithReuseIdentifier: CategoriesCollectionViewCell.reuseId)
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()
    
    func setupViews() {
        contentView.addSubview(containerView)
        containerView.addSubview(collectionView)
    }
    
    func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.right.left.bottom.equalTo(containerView)
        }
    }
    
    //MARK: Public update
    func update(_ categories: [Categories]) {
        self.categories = categories
    }
}

extension CategoriesTableViewCell:   UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCollectionViewCell.reuseId, for: indexPath) as! CategoriesCollectionViewCell
        let category = categories[indexPath.row]
        cell.update(category)
        return cell
    }
}

