import UIKit

final class CounterView: UIControl {
    
    var index: Int = 0
    
    private lazy var countComponentView: UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.backgroundColor = .lightGray.withAlphaComponent(0.4)
        stackView.layer.cornerRadius = 17
        stackView.clipsToBounds = true
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var plusButton: UIButton = {
        var button = UIButton()
        button.setTitle("+", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var countLabel = Label(style: .count, text: "\(currentValue)")
    
    private lazy var minusButton: UIButton = {
        var button = UIButton()
        button.setTitle("-", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    ///Устанавливается значение счетчика
    var currentValue: Int = 0 {
        didSet {
            currentValue = currentValue > 0 ? currentValue : 0
            countLabel.text = "\(currentValue)"
        }
    }
    
    //MARK: - Actions with buttons
    @objc func buttonAction(_ sender: UIButton) {
        switch sender {
        case minusButton:
            currentValue -= 1
        case plusButton:
            currentValue += 1
        default: break
        }
        
        sendActions(for: .valueChanged)
    }
}

//MARK: - Constraints
extension CounterView {
    private func setupViews() {
        
        self.addSubview(countComponentView)
        
        countComponentView.addArrangedSubview(minusButton)
        countComponentView.addArrangedSubview(countLabel)
        countComponentView.addArrangedSubview(plusButton)
    }
    
    private func setupConstraints() {
        countComponentView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
}
