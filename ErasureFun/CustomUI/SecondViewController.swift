//
//  SecondViewController.swift
//  CustomUI
//
//  Created by Anmol  Jandaur on 2/14/24.
//

import UIKit

public class SecondViewController: UIViewController {

    override public func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        // Do any additional setup after loading the view.
    }
    
    public func beginColorChange() {
        view.backgroundColor = .systemYellow
    }
}
