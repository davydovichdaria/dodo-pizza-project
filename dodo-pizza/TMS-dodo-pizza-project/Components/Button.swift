import Foundation
import UIKit

enum ButtonStyle: Int {
    case map
    case contact
    case social
    case chevron
    case order
    case close
    case category
    case price
    case addToCart
    case promocode
    case promocodeWithoutBackground
}

class Button: UIButton {
    init(style: ButtonStyle, text: String) {
        super.init(frame: .zero)
        
        switch style {
        case .map: createMapButton(text: text)
        case .contact: createContactButton(text: text)
        case .social: createSocialButton(text: text)
        case .chevron: createChevronButton(text: text)
        case .order: createOrderButton(text: text)
        case .close: createCloseButton(text: text)
        case .category: createCategoryButton(text: text)
        case .price: createPriceButton(text: text)
        case .addToCart: createAddToCartButton(text: text)
        case .promocode: createPromocodeButton(text: text)
        case .promocodeWithoutBackground: createPromocodeWithoutBackgroundButton(text: text)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createMapButton(text: String) {
        self.setTitle(text, for: .normal)
        self.setTitleColor(.white, for: .normal)
        self.backgroundColor = UIColor(red: 237/255, green: 115/255, blue: 46/255, alpha: 1)
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.contentEdgeInsets = UIEdgeInsets(top: 10, left: 60, bottom: 10, right: 60)
        self.layer.cornerRadius = 23
        self.clipsToBounds = true
        self.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    func createContactButton(text: String) {
        self.setTitle(text, for: .normal)
        self.setTitleColor(UIColor(red: 178/255, green: 85/255, blue: 21/255, alpha: 1), for: .normal)
        self.backgroundColor = UIColor(red: 237/255, green: 115/255, blue: 46/255, alpha: 1).withAlphaComponent(0.1)
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.contentEdgeInsets = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        self.layer.cornerRadius = 23
        self.clipsToBounds = true
        self.heightAnchor.constraint(equalToConstant: 45).isActive = true
        self.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.43).isActive = true
    }
    
    func createSocialButton(text: String) {
        self.setImage(UIImage(named: text), for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.widthAnchor.constraint(equalToConstant: 54).isActive = true
        self.contentMode = .scaleAspectFill
    }
    
    func createChevronButton(text: String) {
        self.setImage(UIImage(systemName: text), for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.tintColor = UIColor.lightGray.withAlphaComponent(0.6)
    }
    
    func createOrderButton(text: String) {
        self.setTitle(text, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        self.backgroundColor = .orange
        self.layer.cornerRadius = 20
        self.clipsToBounds = true
        self.setTitleColor(.white, for: .normal)
    }
    
    func createCloseButton(text: String) { 
        self.setImage(UIImage(systemName: text), for: .normal)
        self.backgroundColor = .white
        self.tintColor = .black.withAlphaComponent(0.7)
        self.contentMode = .center
        self.widthAnchor.constraint(equalToConstant: 46).isActive = true
        self.heightAnchor.constraint(equalToConstant: 46).isActive = true
        self.layer.cornerRadius = 23
        self.layer.shadowOpacity = 1.9
        self.layer.shadowRadius = 8
        self.layer.shadowOffset = CGSize(width: 2, height: 5)
        self.layer.shadowColor = UIColor.lightGray.cgColor
    }
    
    func createCategoryButton(text: String) {
        self.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.contentEdgeInsets = UIEdgeInsets(top: 4, left: 15, bottom: 4, right: 15)
        self.setTitleColor(.darkGray.withAlphaComponent(0.9), for: .normal)
        self.setTitle(text, for: .normal)
    }
    
    func createPriceButton(text: String) {
        self.setTitle(text, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        self.setTitleColor(UIColor(red: 237/255, green: 115/255, blue: 46/255, alpha: 1), for: .normal)
        
        self.backgroundColor = UIColor(red: 237/255, green: 115/255, blue: 46/255, alpha: 1).withAlphaComponent(0.1)
        self.layer.cornerRadius = 14
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: 30).isActive = true
        self.contentEdgeInsets = UIEdgeInsets(top: 9, left: 18, bottom: 9, right: 18)
    }
    
    func createAddToCartButton(text: String) {
        self.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        self.setTitleColor(.white, for: .normal)
        self.layer.cornerRadius = 24
        self.heightAnchor.constraint(equalToConstant: 45).isActive = true
        self.backgroundColor = .orange
        self.setTitle(text, for: .normal)
    }
    
    func createPromocodeButton(text: String) {
        self.setTitle(text, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        self.setTitleColor(.white, for: .normal)
        self.backgroundColor = .orange
        self.layer.cornerRadius = 17
        self.heightAnchor.constraint(equalToConstant: 35).isActive = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func createPromocodeWithoutBackgroundButton(text: String) {
        self.setTitle(text, for: .normal)
        self.setTitleColor(UIColor(red: 237/255, green: 115/255, blue: 46/255, alpha: 1), for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
