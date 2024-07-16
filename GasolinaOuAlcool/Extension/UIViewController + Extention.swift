//
//  UIViewController + Extention.swift
//  GasolinaOuAlcool
//
//  Created by Lorenzo Janota on 23/11/23.
//

import Foundation
import UIKit

extension UIViewController {

    func hideKeyboard(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
}

