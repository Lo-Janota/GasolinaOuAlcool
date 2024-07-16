//
//  Alert.swift
//  GasolinaOuAlcool
//
//  Created by Lorenzo Janota on 17/11/23.
//

import UIKit

class Alert {
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func showAlertInformation(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default)
        alertController.addAction(okButton)
        //Apenas uma View Controler consegue "Acessar" o alert
        controller.present(alertController, animated: true)
    }
}
