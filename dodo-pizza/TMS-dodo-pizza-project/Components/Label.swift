import Foundation
import UIKit

enum LabelStyle: Int {
    case title
    case description
    case titleBold
    case emptyDescription
    case emptyTitle
    case header
    case count
    case detailTitle
    case sizeDescription
    case detailDescription
    case ingredient
}

class Label: UILabel {
    
    init(style: LabelStyle, text: String) {
        super.init(frame: .zero)
        
        switch style {
        case .title: createTitleLabel(text: text)
        case .description: createDescriptionLabel(text: text)
        case .titleBold: createTitleBoldLabel(text: text)
        case .emptyDescription: createEmptyDescriptionLabel(text: text)
        case .emptyTitle: createEmptyTitleLabel(text: text)
        case .header: createHeaderLabel(text: text)
        case .count: createCountLabel(text: text)
        case .detailTitle: createDetailTitleLabel(text: text)
        case .sizeDescription: createSizeDescriptionLabel(text: text)
        case .detailDescription: createDetailDescriptionLabel(text: text)
        case .ingredient: createIngredientLabel(text: text)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createTitleLabel(text: String) {
        self.text = text
        self.textColor = .black
        self.font = UIFont.systemFont(ofSize: 17, weight: .regular)
    }
    
    func createDescriptionLabel(text: String) {
        self.text = text
        self.numberOfLines = 0
        self.textColor = .gray
        self.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    }
    
    func createTitleBoldLabel(text: String) {
        self.text = text
        self.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
    }
    
    func createEmptyDescriptionLabel(text: String) {
        self.text = text
        self.numberOfLines = 0
        self.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        self.textAlignment = .center
    }
    
    func createEmptyTitleLabel(text: String) {
        self.text = text
        self.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        self.textAlignment = .center
        self.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func createHeaderLabel(text: String) {
        self.font = UIFont.boldSystemFont(ofSize: 20)
        self.text = text
        self.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func createCountLabel(text: String) {
        self.text = text
        self.font = UIFont.monospacedDigitSystemFont(ofSize: 15, weight: .regular)
    }
    
    func createDetailTitleLabel(text: String) {
        self.text = text
        self.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
    }
    
    func createSizeDescriptionLabel(text: String) {
        self.text = text
        self.numberOfLines = 0
        self.font = UIFont.systemFont(ofSize: 17)
        self.textColor = .gray
    }
    
    func createDetailDescriptionLabel(text: String) {
        self.text = text
        self.numberOfLines = 0
        self.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        self.textColor = .black
    }
    
    func createIngredientLabel(text: String) {
        self.text = text
        self.numberOfLines = 0
        self.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        self.textColor = .darkGray
        self.textAlignment = .center
    }
}
