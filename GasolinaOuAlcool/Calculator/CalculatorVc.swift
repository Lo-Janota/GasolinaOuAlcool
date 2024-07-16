//
//  CalculatorVc.swift
//  GasolinaOuAlcool
//
//  Created by Lorenzo Janota on 10/11/23.
//

import UIKit

class CalculatorVc: UIViewController {
    
    var screen: CalculatorScreen?   
    var alert: Alert?
    
    override func loadView() {
        screen = CalculatorScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboard()
        alert = Alert(controller: self)
        screen?.delegate(delegate: self)
    }
    
    //Validação de valores
    func validateTextFields() -> Bool {
        
        guard let ethanolPrice = screen?.ethanolPriceTextFild.text else {return false}
        guard let gasPrice = screen?.gasPriceTextFild.text else {return false}
        
        if ethanolPrice.isEmpty && gasPrice.isEmpty {
            alert?.showAlertInformation(title: "Atenção!", message: "Informe os valores do álcool e da gasolina.")
            return false
        } else if ethanolPrice.isEmpty {
            alert?.showAlertInformation(title: "Atenção!", message: "Informe o valor do álcool.")
            return false
        } else if gasPrice.isEmpty {
            alert?.showAlertInformation(title: "Atenção!", message: "Informe o valor da gasolina.")
            return false
        }
        
        return true
    }
}

extension CalculatorVc: CalculatorScreenDelegate {
    func tappedCalculateButton() {
        
        if validateTextFields() {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            
            let ethanolPrice: Double = (formatter.number(from: screen?.ethanolPriceTextFild.text ?? "0.0") as? Double) ?? 0.0
            let gasPrice: Double = (formatter.number(from: screen?.gasPriceTextFild.text ?? "0.0") as? Double) ?? 0.0
            
            var vc: ResultVc?
            if ethanolPrice / gasPrice > 0.7 {
                print("Melhor urilizar Gasolina!")
                vc = ResultVc(bestFuel: .gas)
                
            } else {
                print("Melhor utilizar Álcool!")
                vc = ResultVc(bestFuel: .ethanol)
            }
            navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
        }
    }
    
    func tappedBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
}
