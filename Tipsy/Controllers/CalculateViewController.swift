//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit


class CalculateViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    var tipPercent: Double = 0.0
    var peopleCount: Int = 2
    var calc:Double = 0.0
    var tipNumber:Int?
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        splitNumberLabel.text = "2"
        stepper.stepValue = 1.0
    }//end of viewDidLoad
    
    func getBillValue() -> Double
    {
        return Double(billTextField.text!)!
    }//end of func
    
    @IBAction func tipChanged(_ sender: UIButton)
    {
       // let userInput = sender.currentTitle
        
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        let tipClicked = sender.currentTitle!
        let tipValue = String(tipClicked.dropLast())
        tipPercent = Double(tipValue)! / 100
        tipNumber = Int(tipValue)
        print(tipValue)
        
        
        billTextField.endEditing(true) //dismisses the keyboard when user taps on any tip
      
    }//end of UIButton
    
    @IBAction func stepperValueChanged(_ sender: UIStepper)
    {
        
        splitNumberLabel.text = Int(sender.value).description
        peopleCount = Int(sender.value)
        
        
    }//end of UIStepper
    
    func calcAmount() -> Double
    {
        calc = (getBillValue() + (getBillValue() * tipPercent)) / Double(peopleCount)
        return calc
    }//end of func
    
    
    @IBAction func calculatePressed(_ sender: UIButton)
    {
        print("tip Percentage: \(tipPercent)")
        print("Bill value: \(getBillValue())")
        print("Final ammount: \(calcAmount())")
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }//end of UIButton
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "goToResult"
        {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = String(format: "%.2f", calcAmount())
            destinationVC.peopleCount = peopleCount
            destinationVC.tipPercentage = tipNumber
        }//end of condition
        
    }//end of segue
        
}

