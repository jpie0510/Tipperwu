//
//  ViewController.swift
//  Tipperwu
//
//  Created by Judy Wu on 8/23/17.
//  Copyright © 2017 Judy Wu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var billLabel: UILabel!
    @IBOutlet weak var billAmountField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("VIew loading...")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("View Appearing...")
        
        // update tipControl and recalculate tip based on defaults
        tipControl.selectedSegmentIndex = defaults.integer(forKey:"default_tip_index")
        calculateTip(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        
        let tipPercentages = [0.18,0.2,0.25]
        let bill = Double(billAmountField.text!) ?? 0
        let oldTipLabel = tipAmountLabel.text!
        let oldTotalLabel = totalAmountLabel.text!
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalAmountLabel.text = String(format: "$%.2f", total)
        
        
        // flash tip if different than prior tip
        
        if oldTipLabel != tipAmountLabel.text {
            self.tipLabel.alpha = 0.25
            self.tipAmountLabel.alpha = 0.25
            
            UIView.animate(withDuration: 1, delay: 0.25, animations: {
                self.tipLabel.alpha = 1
                self.tipAmountLabel.alpha = 1
            }
            )
        }
        
        // flash total if different than prior total
        
        if oldTotalLabel != totalAmountLabel.text {
            self.totalLabel.alpha = 0.25
            self.totalAmountLabel.alpha = 0.25
        
            UIView.animate(withDuration: 1, delay: 0.25, animations: {
                self.totalLabel.alpha = 1
                self.totalAmountLabel.alpha = 1
            }
            )
        }
        
        
    }

}

