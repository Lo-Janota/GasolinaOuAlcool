//
//  HomeVc.swift
//  GasolinaOuAlcool
//
//  Created by Lorenzo Janota on 08/11/23.
//

import UIKit

class HomeVc: UIViewController {
    
    var screen: HomeScreen?
    
    override func loadView() {
        screen = HomeScreen ()
        view = screen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
    }


}

extension HomeVc: HomeScreenDelegate{
    func tappedStartButton() {
        let vc = CalculatorVc()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
}

