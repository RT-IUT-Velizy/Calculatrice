//
//  ViewController.swift
//  Application002
//
//  Created by Théo on 28/10/2019.
//  Copyright © 2019 Théo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelResult: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var buttonEqual: UIButton!
    @IBOutlet weak var buttonAC: UIButton!
    @IBOutlet weak var buttonPlus: UIButton!
    @IBOutlet weak var buttonMinus: UIButton!
    @IBOutlet weak var buttonMulti: UIButton!
    @IBOutlet weak var buttonDivide: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    var affichage = "0"
    var operation = ""
    var firstNum = 0
    var reserve = ""
    var SecondNum = 0
    var resultat = 0
    
    @IBAction func buttonClick(_ sender: UIButton) {
        if sender == button0 {
            if affichage == "0" {
                affichage = "0";
            }
            else {
                affichage += "0";
            }
            if firstNum != 0 {
                reserve += "0";
            }
        }
        else if sender == button1 {
            if affichage == "0" {
                affichage = "1";
            }
            else {
                affichage += "1";
            }
            if firstNum != 0 {
                reserve += "1";
            }
        }
        else if sender == button2 {
            if affichage == "0" {
                affichage = "2";
            }
            else {
                affichage += "2";
            }
            if firstNum != 0 {
                reserve += "2";
            }
        }
        else if sender == button3 {
            if affichage == "0" {
                affichage = "3";
            }
            else {
                affichage += "3";
            }
            if firstNum != 0 {
                reserve += "3";
            }
        }
        else if sender == button4 {
            if affichage == "0" {
                affichage = "4";
            }
            else {
                affichage += "4";
            }
            if firstNum != 0 {
                reserve += "4";
            }
        }
        else if sender == button5 {
            if affichage == "0" {
                affichage = "5";
            }
            else {
                affichage += "5";
            }
            if firstNum != 0 {
                reserve += "5";
            }
        }
        else if sender == button6 {
            if affichage == "0" {
                affichage = "6";
            }
            else {
                affichage += "6";
            }
            if firstNum != 0 {
                reserve += "6";
            }
        }
        else if sender == button7 {
            if affichage == "0" {
                affichage = "7";
            }
            else {
                affichage += "7";
            }
            if firstNum != 0 {
                reserve += "7";
            }
        }
        else if sender == button8 {
            if affichage == "0" {
                affichage = "8";
            }
            else {
                affichage += "8";
            }
            if firstNum != 0 {
                reserve += "8";
            }
        }
        else if sender == button9 {
            if affichage == "0" {
                affichage = "9";
            }
            else {
                affichage += "9";
            }
            if firstNum != 0 {
                reserve += "9";
            }
        }
        else if sender == buttonAC {
            affichage = "0";
            firstNum = 0
            SecondNum = 0
            operation = ""
            reserve = ""
        }
        else if sender == buttonPlus {
            operation = "+"
            firstNum = Int(affichage)!
            
            if affichage == "0" {
                affichage = "+ ";
            }
            else {
                affichage += " + ";
            }
        }
        else if sender == buttonMinus {
            operation = "-"
            firstNum = Int(affichage)!
            
            if affichage == "0" {
                affichage = "- ";
            }
            else {
                affichage += " - ";
            }
        }
        else if sender == buttonMulti {
            operation = "*"
            firstNum = Int(affichage)!
            
            if affichage == "0" {
                affichage = "x ";
            }
            else {
                affichage += " x ";
            }
        }
        else if sender == buttonDivide {
            operation = "/"
            firstNum = Int(affichage)!
            
            if affichage == "0" {
                affichage = "÷ ";
            }
            else {
                affichage += " ÷ ";
            }
        }
        else if sender == buttonEqual {
            affichage += " = ";
            SecondNum = Int(reserve)!
            if operation == "+" {
                resultat = firstNum+SecondNum
            }
            if operation == "-" {
                resultat = firstNum-SecondNum
            }
            if operation == "*" {
                resultat = firstNum*SecondNum
            }
            if operation == "/" {
                resultat = firstNum/SecondNum
            }
            affichage += "\(resultat)"
            
        }
        
        labelResult.text = "\(affichage)"
        
    }
    /*@IBAction func add1(_ sender: Any) {
        result?.text = "Bump!"
    }*/
    
}

