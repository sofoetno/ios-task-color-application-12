

import UIKit

class ColorPaletteVC: UIViewController {
    
    private let colorButtons1 = UIStackView()
    private let colorButtons2 = UIStackView()
    var delegate: ColorButtonsViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        for _ in 1...6 {
            let button = UIButton()
            let randomColor = randomColor()
            button.backgroundColor = randomColor
            button.addAction(UIAction(handler: { [weak self] action in
                self?.delegate?.changeBackgroundColor(color: randomColor)
                self?.navigationController?.popViewController(animated: true)
            }), for: .touchUpInside)
            
            colorButtons1.addArrangedSubview(button)
        }
        
        for _ in 1...6 {
            let button = UIButton()
            let randomColor = randomColor()
            button.backgroundColor = randomColor
            button.addAction(UIAction(handler: { [weak self] action in
                self?.delegate?.changeBackgroundColor(color: randomColor)
                self?.dismiss(animated: true)
            }), for: .touchUpInside)
            colorButtons2.addArrangedSubview(button)
        }
        
        colorButtons1.axis = .vertical
        colorButtons2.axis = .vertical
        
        view.addSubview(colorButtons1)
        view.addSubview(colorButtons2)
        
        colorButtons1.translatesAutoresizingMaskIntoConstraints = false
        colorButtons1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32).isActive = true
        colorButtons1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32).isActive = true
        colorButtons1.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32).isActive = true
        
        colorButtons2.translatesAutoresizingMaskIntoConstraints = false
        colorButtons2.topAnchor.constraint(equalTo: colorButtons1.bottomAnchor, constant: 100).isActive = true
        colorButtons2.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32).isActive = true
        colorButtons2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32).isActive = true
    }
    
    func randomColor() -> UIColor {
        let randomColor = UIColor(
            red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
        return randomColor
    }
}
