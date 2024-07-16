//
//  ResultVc.swift
//  GasolinaOuAlcool
//
//  Created by Lorenzo Janota on 17/11/23.
//

import UIKit

enum BestFuel: String {
    case gas = "Gasolina"
    case ethanol = "Álcool"
}

class ResultVc: UIViewController {
    
    var screen: ResultScreen?
    let bestFuel: BestFuel
    
    init(bestFuel: BestFuel) {
        self.bestFuel = bestFuel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        screen = ResultScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.dalegate(delegate: self)
        screen?.resultadoLabel.text = bestFuel.rawValue
    }
    
    func popViewController() {
        navigationController?.popViewController(animated: true)
    }
}

extension ResultVc: ResultScreenDelegate {
    func tappedbackButton() {
        popViewController()
    }
    
    func tappedCalculateButton() {
        popViewController()
    }
    
}

