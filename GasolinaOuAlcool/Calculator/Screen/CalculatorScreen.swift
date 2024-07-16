//
//  CalculatorScreen.swift
//  GasolinaOuAlcool
//
//  Created by Lorenzo Janota on 11/11/23.
//

import UIKit

protocol CalculatorScreenDelegate: AnyObject {
    func tappedCalculateButton()
    func tappedBackButton()
}

class CalculatorScreen: UIView {
    
    private weak var delegate: CalculatorScreenDelegate?
    
    public func delegate(delegate: CalculatorScreenDelegate?){
        self.delegate = delegate
    }
    
    //Imagem de fundo
    lazy var backgroundImage: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "BG BLUR DARK")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    //Logo
    lazy var logoAppImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "LOGO menor")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    //Espaço para calculo do etanol
    lazy var ethanolPriceTextFild: UITextField = {
        let tf = UITextField() //tf = TextField
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .decimalPad
        tf.placeholder = "Preço do Álcool"
        tf.textColor = .darkGray
        tf.addDoneButtonOnKeyboard()
        return tf
    }()
    
    //Espaço para calculo da gasolina
    lazy var gasPriceTextFild: UITextField = {
        let tf = UITextField() //tf = TextField
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .decimalPad
        tf.placeholder = "Preço da Gasolina"
        tf.textColor = .darkGray
        tf.addDoneButtonOnKeyboard()
        return tf
    }()
    
    lazy var calculateButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Calcular", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.backgroundColor = UIColor(red: 230/255, green: 0/255, blue: 127/255, alpha: 1.0)
        button.addTarget(self, action: #selector(tappedCalculateButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedCalculateButton() {
        delegate?.tappedCalculateButton()
    }
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Botão Back"), for: .normal)
        button.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedBackButton() {
        delegate?.tappedBackButton()
    }
    
    //Adicionando na Tela
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(backgroundImage)
        addSubview(logoAppImageView)
        addSubview(ethanolPriceTextFild)
        addSubview(gasPriceTextFild)
        addSubview(calculateButton)
        addSubview(backButton)
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            
            backgroundImage.topAnchor.constraint(equalTo: topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            logoAppImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 150),
            logoAppImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            logoAppImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            //Aqui eu referencio a logo, pois a caixa de texto ficará abaixo da Logo
            ethanolPriceTextFild.topAnchor.constraint(equalTo: logoAppImageView.bottomAnchor, constant: 134),
            ethanolPriceTextFild.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            ethanolPriceTextFild.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            ethanolPriceTextFild.heightAnchor.constraint(equalToConstant: 45),
      
            //Nesse caso eu referencio o Alcool, pois se eu quiser mudar, mudo apenas em um e reflete no outro
            gasPriceTextFild.topAnchor.constraint(equalTo: ethanolPriceTextFild.bottomAnchor, constant: 16),
            gasPriceTextFild.leadingAnchor.constraint(equalTo: ethanolPriceTextFild.leadingAnchor),
            gasPriceTextFild.trailingAnchor.constraint(equalTo: ethanolPriceTextFild.trailingAnchor),
            gasPriceTextFild.heightAnchor.constraint(equalTo: ethanolPriceTextFild.heightAnchor),
            
            calculateButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -135),
            calculateButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            calculateButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
            calculateButton.heightAnchor.constraint(equalToConstant: 44),
            
        ])
    }
}
