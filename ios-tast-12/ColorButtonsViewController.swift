import UIKit

protocol ColorButtonsViewControllerDelegate {
    func changeBackgroundColor(color: UIColor)
}

class ColorButtonsViewController: UIViewController, ColorButtonsViewControllerDelegate {
    private var homePage = UIStackView()
    private var buttonPresentColor = ButtonWithPadding()
    private var buttonPashCollor = ButtonWithPadding()

    func changeBackgroundColor(color: UIColor) {
        self.view.backgroundColor = color
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        homePage.axis = .vertical
        homePage.spacing = 300
        homePage.alignment = .center
        homePage.distribution = .equalSpacing

        buttonPresentColor.setTitle("Present Color Palette Page", for: .normal)
        buttonPashCollor.setTitle("Pash Color Palette Page", for: .normal)
        buttonPresentColor.titleLabel?.textColor = .white
        buttonPashCollor.titleLabel?.textColor = .white
        buttonPashCollor.setPadding(top: 20, left: 30, bottom: 20, right: 30)
        buttonPresentColor.setPadding(top: 20, left: 30, bottom: 20, right: 30)
        
        buttonPashCollor.addAction(UIAction(handler: { [weak self] action in
            let colorPalett = ColorPaletteVC()
            colorPalett.delegate = self
            self?.navigationController?.pushViewController(colorPalett, animated: true)
        } ), for: .touchUpInside)
        
        buttonPresentColor.addAction(UIAction(handler: {action in
            let colorPalett = ColorPaletteVC()
            colorPalett.delegate = self
            self.present(colorPalett, animated: true)
        }), for: .touchUpInside)
        
        buttonPresentColor.backgroundColor = .systemBlue
        buttonPashCollor.backgroundColor = .systemPink
        
        homePage.addArrangedSubview(buttonPashCollor)
        homePage.addArrangedSubview(buttonPresentColor)
        
        view.addSubview(homePage)
        
        homePage.translatesAutoresizingMaskIntoConstraints = false
        homePage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32).isActive = true
        homePage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32).isActive = true
        homePage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32).isActive = true
    }
}
