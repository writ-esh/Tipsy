//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Writ on 07/08/26.
//  Copyright © 2026 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var result: String?
    var peopleCount: Int?
    var tipPercentage: Int?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        totalLabel.text = result
        settingsLabel.text = "Split between \(peopleCount!) people, with \(tipPercentage!)% tip"
    }//end of viewDidLoad
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    */
    
    @IBAction func recalculatePressed(_ sender: UIButton)
    {
        self.dismiss(animated: true, completion: nil)
    }//end of UIButton
    
    
}//end of class
