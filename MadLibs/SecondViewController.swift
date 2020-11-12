//
//  SecondViewController.swift
//  MadLibs
//
//  Created by Tiger Coder on 11/11/20.
//  Copyright © 2020 clc.Atkinson. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var theMadLib: String!

    @IBOutlet weak var madLibTextOutlet: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        madLibTextOutlet.text = theMadLib
        // Do any additional setup after loading the view.
    }


    

}
