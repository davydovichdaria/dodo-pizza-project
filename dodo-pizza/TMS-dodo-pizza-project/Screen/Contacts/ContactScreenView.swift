import UIKit

class ContactScreenView: UIView {
    
    var scrollView: UIScrollView = {
        var scrollView = UIScrollView()
        return scrollView
    }()
    
    var contactStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var mapView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant:UIScreen.main.bounds.width).isActive = true
        return view
    }()
    
    var mapImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "map")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 250).isActive = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 125
        imageView.clipsToBounds = true
        return imageView
    }()
    
    var mapButton = Button(style: .map, text: "Пиццерии на карте")
    
    var supportView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 140).isActive = true
        view.widthAnchor.constraint(equalToConstant:UIScreen.main.bounds.width).isActive = true
        return view
    }()

    var supportLabel = Label(style: .titleBold, text: "Cвязаться с поддержкой")
    var callButton = Button(style: .contact, text: "Позвонить")
    var mailButton = Button(style: .contact, text: "Написать в чат")
    
    var socialView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 0.3
        view.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.6).cgColor
        view.heightAnchor.constraint(equalToConstant: 80).isActive = true
        view.widthAnchor.constraint(equalToConstant:UIScreen.main.bounds.width).isActive = true
        return view
    }()
    
    var vkButton = Button(style: .social, text: "vk")
    var youtubeButton = Button(style: .social, text: "youtube")
    
    var docsView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 0.3
        view.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.6).cgColor
        view.heightAnchor.constraint(equalToConstant: 60).isActive = true
        view.widthAnchor.constraint(equalToConstant:UIScreen.main.bounds.width).isActive = true
        return view
    }()
    
    var docsLabel = Label(style: .title, text: "Правовые документы")
    var docsButton = Button(style: .chevron, text: "chevron.right")
    
    var aboutView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 0.3
        view.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.6).cgColor
        view.heightAnchor.constraint(equalToConstant: 60).isActive = true
        view.widthAnchor.constraint(equalToConstant:UIScreen.main.bounds.width).isActive = true
        return view
    }()
    
    var aboutLabel = Label(style: .title, text: "О приложении")
    var aboutButton = Button(style: .chevron, text: "chevron.right")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupViews()
        setupConstraints()
  
        contactStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ContactScreenView {
    
    func setupViews() {
        
        self.addSubview(scrollView)
        scrollView.addSubview(contactStackView)
        
        contactStackView.addArrangedSubview(mapView)
        
        mapView.addSubview(mapImageView)
        mapView.addSubview(mapButton)
        
        contactStackView.addArrangedSubview(supportView)
        
        supportView.addSubview(supportLabel)
        supportView.addSubview(callButton)
        supportView.addSubview(mailButton)
        
        contactStackView.addArrangedSubview(socialView)
        
        socialView.addSubview(vkButton)
        socialView.addSubview(youtubeButton)
        
        contactStackView.addArrangedSubview(docsView)
        contactStackView.addArrangedSubview(aboutView)
        
        docsView.addSubview(docsLabel)
        docsView.addSubview(docsButton)
        
        aboutView.addSubview(aboutLabel)
        aboutView.addSubview(aboutButton)
    }
    
    func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(self.safeAreaLayoutGuide)
        }
        
        contactStackView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
        }
        
        mapView.snp.makeConstraints { make in
            make.top.equalTo(contactStackView.snp.top)
            make.bottom.equalTo(supportView.snp.top)
        }
        
        mapImageView.snp.makeConstraints { make in
            make.top.equalTo(mapView.snp.top).inset(30)
            make.centerX.equalTo(mapView.snp.centerX)
            make.bottom.equalTo(mapView).inset(20)
        }
        
        mapButton.snp.makeConstraints { make in
            make.top.equalTo(mapImageView.snp.top).inset(185)
            make.centerX.equalTo(mapView.snp.centerX)
        }
        
        supportView.snp.makeConstraints { make in
            make.top.equalTo(mapView.snp.bottom)
            make.bottom.equalTo(socialView.snp.top)
        }
        
        supportLabel.snp.makeConstraints { make in
            make.top.left.equalTo(supportView).inset(20)
        }
        
        callButton.snp.makeConstraints { make in
            make.top.equalTo(supportLabel.snp.bottom).inset(-15)
            make.left.equalTo(supportView).inset(20)
            make.bottom.equalTo(supportView).inset(40)
        }
        
        mailButton.snp.makeConstraints { make in
            make.top.equalTo(supportLabel.snp.bottom).inset(-15)
            make.right.equalTo(supportView).inset(20)
            make.bottom.equalTo(supportView).inset(40)
        }
        
        socialView.snp.makeConstraints { make in
            make.top.equalTo(supportView.snp.bottom)
            make.bottom.equalTo(docsView.snp.top)
        }
        
        vkButton.snp.makeConstraints { make in
            make.top.equalTo(socialView).inset(20)
            make.left.equalTo(socialView).inset(85)
        }
        
        youtubeButton.snp.makeConstraints { make in
            make.top.equalTo(socialView).inset(20)
            make.right.equalTo(socialView).inset(85)
        }
        
        docsView.snp.makeConstraints { make in
            make.top.equalTo(socialView.snp.bottom)
        }
        
        aboutView.snp.makeConstraints { make in
            make.top.equalTo(docsView.snp.bottom)
        }
        
        docsLabel.snp.makeConstraints { make in
            make.top.right.bottom.equalTo(docsView)
            make.left.equalTo(docsView).inset(20)
        }
        
        docsButton.snp.makeConstraints { make in
            make.centerY.equalTo(docsView.snp.centerY)
            make.right.equalTo(docsView).inset(30)
        }
        
        aboutLabel.snp.makeConstraints { make in
            make.top.right.bottom.equalTo(aboutView)
            make.left.equalTo(aboutView).inset(20)
        }
        
        aboutButton.snp.makeConstraints { make in
            make.centerY.equalTo(aboutView.snp.centerY)
            make.right.equalTo(aboutView).inset(30)
        }
    }
}

