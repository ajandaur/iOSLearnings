//
//  ViewController.swift
//  ErasureFun
//
//  Created by Anmol  Jandaur on 2/14/24.
//

import UIKit
import CustomUI
import PresenterKit

class ViewController: UIViewController {
    
    let presenter = Presenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            self.presentSecondVC()
            self.presenter.present(SecondViewController(), from: self)
        })
    }
    
    func presentSecondVC() {
        let vc = SecondViewController()
        present(vc, animated: true)
    }
}

extension SecondViewController: MyPresentableColorChangingController {
    
}
