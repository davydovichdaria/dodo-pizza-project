import UIKit

struct CollectionViewCellSize {
    let itemsCount: CGFloat = 3
    let padding: CGFloat = 10
    var paddingCount:CGFloat { itemsCount + 1 }
    var paddingSize: CGFloat { padding * paddingCount }
    var cellWidth: CGFloat { (UIScreen.main.bounds.width - paddingSize) / itemsCount }
    var cellHeight: CGFloat { cellWidth * 1.4 }
}
