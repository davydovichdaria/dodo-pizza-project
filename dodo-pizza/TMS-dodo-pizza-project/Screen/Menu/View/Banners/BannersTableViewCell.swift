import UIKit

final class BannersTableViewCell: UITableViewCell{
    
    static let reuseId = "BannersTableViewCell"
    private var banners: [Banners] = []
    
    var containerView: UIView = {
        var view = UIView()
        view.heightAnchor.constraint(equalToConstant: Screen.width * 0.35).isActive = true
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
        layout.itemSize = CGSize(width: Screen.width * 0.23, height: Screen.width * 0.3)
        layout.minimumLineSpacing = 10
        
        var collection = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        collection.register(BannersCollectionViewCell.self, forCellWithReuseIdentifier: BannersCollectionViewCell.reuseId)
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
    func update(_ banners: [Banners]) {
        self.banners = banners
    }
}

extension BannersTableViewCell:   UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return banners.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannersCollectionViewCell.reuseId, for: indexPath) as! BannersCollectionViewCell
        let banner = banners[indexPath.row]
        cell.update(banner)
        return cell
    }
}

