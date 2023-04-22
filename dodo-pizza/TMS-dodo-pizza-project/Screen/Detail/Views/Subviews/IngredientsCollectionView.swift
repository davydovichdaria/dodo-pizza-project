import UIKit

final class IngredientsCollectionView: UICollectionView {
    var ingredients: [Ingredient] = []
    var collectionViewCellSize = CollectionViewCellSize()

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {

        let padding: CGFloat = collectionViewCellSize.padding
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = padding
        layout.minimumInteritemSpacing = padding //3
        layout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        layout.itemSize = CGSize(width: collectionViewCellSize.cellWidth, height: collectionViewCellSize.cellHeight)
        
        super.init(frame: .zero, collectionViewLayout: layout)
        self.register(IngredientsCollectionViewCell.self, forCellWithReuseIdentifier: IngredientsCollectionViewCell.reuseId)
        
        self.delegate = self
        self.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public update
    func updateIngredients(_ ingredients: [Ingredient]) {
        self.ingredients = ingredients
    }
}

extension IngredientsCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ingredients.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IngredientsCollectionViewCell.reuseId, for: indexPath) as! IngredientsCollectionViewCell
        let ingredient = ingredients[indexPath.row]
        cell.updateIngredients(ingredient)
        return cell
    }
}
