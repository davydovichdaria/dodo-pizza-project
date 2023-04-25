import UIKit

class CustomModalVC: UIViewController {
    
    let defaultHeight: CGFloat = 410 //Высота
    let dismissibleHeight: CGFloat = 200 //Высота, при которой убирается
    let maximumContainerHeight: CGFloat = UIScreen.main.bounds.height - 64
    let maxDimmedAlpha: CGFloat = 0.6
    var currentContainerHeight: CGFloat = 300
    
    var containerView: UIView = {
        var view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 30
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var dimmedView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = maxDimmedAlpha
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var promocodeTextField: UITextField = {
        var textField = UITextField()
        textField.textColor = .lightGray
        textField.placeholder = "Введите промокод"
        textField.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        textField.tintColor = .orange
        return textField
    }()
    
    var promocodeButton: UIButton = {
        var button = Button(style: .promocodeWithoutBackground, text: "Применить")
        return button
    }()
    
    var containerViewHeightConstraint: NSLayoutConstraint?
    var containerViewBottomConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        setupPanGesture()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        animateShowDimmedView()
        animatePresentContainer()
    }
    
    func animatePresentContainer() { //Показывает контейнер
        UIView.animate(withDuration: 0.3) {
            self.containerViewBottomConstraint?.constant = 0
            self.view.layoutIfNeeded()
        }
    }
    
    func animateShowDimmedView() {
        dimmedView.alpha = 0
        UIView.animate(withDuration: 0.3) {
            self.dimmedView.alpha = self.maxDimmedAlpha //Становится размытым задний фон
        }
    }
    
    func animateDismissView() { //Опускает контейнер вниз
        UIView.animate(withDuration: 0.3) {
            self.containerViewBottomConstraint?.constant = self.defaultHeight
            self.view.layoutIfNeeded()
        }
        
        dimmedView.alpha = maxDimmedAlpha
        UIView.animate(withDuration: 0.4) {
            self.dimmedView.alpha = 0 //Скрываем размытое
        } completion: { _ in
            self.dismiss(animated: false)
        }
    }
    
    func setupPanGesture() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.handlePanGesture(gesture:)))
        panGesture.delaysTouchesBegan = false
        panGesture.delaysTouchesEnded = false
        dimmedView.addGestureRecognizer(panGesture)
    }
    
    @objc func handlePanGesture(gesture: UIPanGestureRecognizer) {
        self.animateDismissView()
    }
}

extension CustomModalVC {
    func setupViews() {
        view.backgroundColor = .clear
        
        view.addSubview(dimmedView)
        view.addSubview(containerView)
        
        containerView.addSubview(promocodeTextField)
        containerView.addSubview(promocodeButton)
    }
    
    func setupConstraints() {
        
        dimmedView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        
        containerView.snp.makeConstraints { make in
            make.left.right.equalTo(view)
        }
        
        containerViewHeightConstraint = containerView.heightAnchor.constraint(equalToConstant: defaultHeight)
        containerViewBottomConstraint = containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: defaultHeight)
        containerViewHeightConstraint?.isActive = true
        containerViewBottomConstraint?.isActive = true
        
        promocodeTextField.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top).inset(20)
            make.left.equalTo(containerView.snp.left).inset(20)
        }
        
        promocodeButton.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top).inset(20)
            make.right.equalTo(containerView.snp.right).inset(20)
            make.centerY.equalTo(promocodeTextField.snp.centerY)
        }
    }
}
