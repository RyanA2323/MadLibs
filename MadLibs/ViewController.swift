//
//  ViewController.swift
//  MadLibs
//
//  Created by Tiger Coder on 11/9/20.
//  Copyright © 2020 clc.Atkinson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var typeSegOutlet: UISegmentedControl!
    
    @IBOutlet weak var verbTextFieldOutlet: UITextField!
    @IBOutlet weak var adjTextFieldOutlet: UITextField!
    @IBOutlet weak var nounTextfieldOutlet: UITextField!
    @IBOutlet weak var seeMadButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
    }
    
    
    
    var userMadLib = MadLibLines.init(inChoice: 0, inNoun: "", inAdj: "", inVerb: "", inPrompt: "")
    
    var madLibPrompt: [String] = []
    
   
    
    @IBAction func MadLibChoiceAction(_ sender: UISegmentedControl) {
        var changeTheme = sender.selectedSegmentIndex
        switch changeTheme {
        case 0:
            userMadLib.choice = 0
        case 1: userMadLib.choice = 1
        case 2: userMadLib.choice = 2
        case 3: userMadLib.choice = 3
        default:
            userMadLib.choice = 0
        }
    }
    
    @IBAction func NounAction(_ sender: UITextField) {
        var nounText = nounTextfieldOutlet.text
        userMadLib.noun = nounText!
    }
    @IBAction func adjAction(_ sender: UITextField) {
        var adjText = adjTextFieldOutlet.text
        userMadLib.adj = adjText!
        
    }
    @IBAction func verbAction(_ sender: UITextField) {
        var verbText = verbTextFieldOutlet.text
        userMadLib.verb = verbText!
        
    }
    
    
    
    
    
    @IBAction func seeMadLibButton(_ sender: UIButton) {
        if verbTextFieldOutlet.text == "" || adjTextFieldOutlet.text == "" || nounTextfieldOutlet.text == "" {
        let alert = UIAlertController(title: "ERROR!", message: "You must fill all the textfields", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
       
        }
         madLibPrompt = ["I was so excited to go on vacation! Unfortunately I left my \(userMadLib.noun) at home. It was a very \(userMadLib.adj) ride down. Luckily I got to go \(userMadLib.verb) at the beach.","HELP! I AM IN THE BATHROOM AND I AM NEED OF ASSISTANCE OF SOME \(userMadLib.noun). I was minding my business when a man came in and began (to) \(userMadLib.verb). He was very \(userMadLib.adj). ","My teacher told me I was a \(userMadLib.noun). She said my work was always \(userMadLib.adj). Because of this my mom didn't let me go \(userMadLib.verb) with my friends this weekend."]
        switch userMadLib.choice {
        case 0:
            userMadLib.prompt = madLibPrompt[Int.random(in: 0...2)]
        case 1: userMadLib.prompt = madLibPrompt[0]
        case 2: userMadLib.prompt = madLibPrompt[1]
        case 3: userMadLib.prompt = madLibPrompt[2]
        default:
            userMadLib.prompt = madLibPrompt[Int.random(in: 0...2)]
            
        }
       
        performSegue(withIdentifier: "toScreen2", sender: nil)
       
      }
    override func prepare(for segue:  UIStoryboardSegue, sender: Any?){
                       let nvc = segue.destination as! SecondViewController
                       nvc.theMadLib = userMadLib.prompt
        }
    
}


