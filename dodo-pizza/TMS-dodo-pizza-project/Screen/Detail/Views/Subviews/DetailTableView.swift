import UIKit

private enum DetailSection: Int, CaseIterable {
    case productInfo = 0
    case ingredient = 1
}

final class DetailTableView: UITableView {
    
    private var selectedProduct: ProductModel?
    private var ingredients: [Ingredient] = []
    private var collectionViewCellSize = CollectionViewCellSize()
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: .zero, style: style)
        
        self.allowsSelection = false
        self.separatorStyle = .none
        
        self.delegate = self
        self.dataSource = self
        
        self.register(ProductTableViewCell.self, forCellReuseIdentifier: ProductTableViewCell.reuseId)
        self.register(IngredientsTableViewCell.self, forCellReuseIdentifier: IngredientsTableViewCell.reuseId)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public update
    func update(_ product: ProductModel) {
        selectedProduct = product
    }
    
    func updateIngredients(_ ingredient: [Ingredient]) {
        ingredients = ingredient
    }
    
    func findCollectionViewHeight() -> CGFloat {
        if ingredients.count % 3 == 0 {
            return CGFloat((ingredients.count / 3)) * collectionViewCellSize.cellHeight
        } else {
            return CGFloat((ingredients.count / 3) + 1) * collectionViewCellSize.cellHeight
        }
    }
}

extension DetailTableView: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return DetailSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = DetailSection(rawValue: section)
        
        switch section {
        case .productInfo:
            return 1
        case .ingredient:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = DetailSection(rawValue: indexPath.section)
        
        switch section {
        case .productInfo:
            let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.reuseId, for: indexPath) as! ProductTableViewCell
            
            if let product = selectedProduct {
                cell.update(product)
            }
            return cell
        case .ingredient:
            let cell = tableView.dequeueReusableCell(withIdentifier: IngredientsTableViewCell.reuseId, for: indexPath) as! IngredientsTableViewCell
            cell.ingredientsCollectionView.updateIngredients(ingredients)
            cell.ingredientsCollectionView.heightAnchor.constraint(equalToConstant: findCollectionViewHeight()).isActive = true
            cell.ingredientsCollectionView.updateIngredients(ingredients)
            return cell
            
        default:
            return UITableViewCell()
        }
    }
}
