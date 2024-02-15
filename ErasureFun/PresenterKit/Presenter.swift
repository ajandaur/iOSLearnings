//
//  Presenter.swift
//  PresenterKit
//
//  Created by Anmol  Jandaur on 2/14/24.
//

import Foundation
import UIKit

public protocol MyPresentableColorChangingController {
    func beginColorChange()
}

public class Presenter {
    public init() {
        
    }
    
    public func present(_ myVC: UIViewController & MyPresentableColorChangingController, from presentVC: UIViewController) {
        myVC.beginColorChange()
        presentVC.present(myVC, animated: true)
    }
}
