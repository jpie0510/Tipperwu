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
    @IBOutlet weak var roundTipButton: UIButton!
    @IBOutlet weak var roundTotalButton: UIButton!
    
    
    let defaults = UserDefaults.standard
    let currencyFormatter = NumberFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View Did loading...")
        // Do any additional setup after loading the view, typically from a nib.
        
        NotificationCenter.default.addObserver(self, selector: #selector(populateRecentBillAmount), name: NSNotification.Name.UIApplicationDidBecomeActive, object: nil)
        
        billAmountField.becomeFirstResponder()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func populateRecentBillAmount() {
        
        print("populating recent bill...")
        
        var bill = 0.00
        currencyFormatter.numberStyle = .currency
        billAmountField.becomeFirstResponder()
        
        
       // check if more than 10 minutes have elapsed
       
        if defaults.object(forKey: "bill_last_updated") != nil {
            let timeLastUpdated : NSDate
            timeLastUpdated = defaults.object(forKey:"bill_last_updated") as! NSDate
            if timeLastUpdated.timeIntervalSinceNow < (-60*0.1) {
                print("Less than time elapsed")
                bill = Double(defaults.integer(forKey:"bill_amount"))
                
            }
            billAmountField.text = currencyFormatter.string(for:bill)
            calculateTip(self)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("View Appearing...")
        
        // update tipControl and recalculate tip based on defaults
        tipControl.selectedSegmentIndex = defaults.integer(forKey:"default_tip_index")
        calculateTip(self)
        
        currencyFormatter.numberStyle = .currency
        
        // update theme color
        switch defaults.integer(forKey:"selected_theme_color_index") {
        case 1:
            print("Case 1")
            self.view.backgroundColor = UIColor.blue
            self.tipControl.tintColor = UIColor.white
            self.billLabel.textColor = UIColor.white
            self.tipLabel.textColor = UIColor.white
            self.tipAmountLabel.textColor = UIColor.white
            self.totalLabel.textColor = UIColor.white
            self.totalAmountLabel.textColor = UIColor.white
            self.roundTipButton.backgroundColor = UIColor.white
            self.roundTipButton.setTitleColor(UIColor.blue, for: .normal)
            self.roundTotalButton.backgroundColor = UIColor.white
            self.roundTotalButton.setTitleColor(UIColor.blue, for: .normal)
        case 2:
            print("Case 2")
            self.view.backgroundColor = UIColor.red
            self.tipControl.tintColor = UIColor.white
            self.billLabel.textColor = UIColor.white
            self.tipLabel.textColor = UIColor.white
            self.tipAmountLabel.textColor = UIColor.white
            self.totalLabel.textColor = UIColor.white
            self.totalAmountLabel.textColor = UIColor.white
            self.roundTipButton.backgroundColor = UIColor.white
            self.roundTipButton.setTitleColor(UIColor.red, for: .normal)
            self.roundTotalButton.backgroundColor = UIColor.white
            self.roundTotalButton.setTitleColor(UIColor.red, for: .normal)
        case 3:
            print("Case 3")
            self.view.backgroundColor = UIColor.orange
            self.tipControl.tintColor = UIColor.white
            self.billLabel.textColor = UIColor.white
            self.tipLabel.textColor = UIColor.white
            self.tipAmountLabel.textColor = UIColor.white
            self.totalLabel.textColor = UIColor.white
            self.totalAmountLabel.textColor = UIColor.white
            self.roundTipButton.backgroundColor = UIColor.white
            self.roundTipButton.setTitleColor(UIColor.orange, for: .normal)
            self.roundTotalButton.backgroundColor = UIColor.white
            self.roundTotalButton.setTitleColor(UIColor.orange, for: .normal)
        default:
            print("default case")
            self.view.backgroundColor = UIColor.white
            self.tipControl.tintColor = self.view.tintColor
            self.roundTipButton.backgroundColor =
                self.view.tintColor
            self.billLabel.textColor = UIColor.black
            self.tipLabel.textColor = UIColor.black
            self.tipAmountLabel.textColor = UIColor.black
            self.totalLabel.textColor = UIColor.black
            self.totalAmountLabel.textColor = UIColor.black
    
            self.roundTipButton.setTitleColor(UIColor.white, for: .normal)
            self.roundTotalButton.backgroundColor = self.view.tintColor
            self.roundTotalButton.setTitleColor(UIColor.white, for: .normal)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    
    @IBAction func roundTipButtonAction(_ sender: AnyObject) {
        
        print("roundTipAction called")
        
        let bill = Double(billAmountField.text!) ?? 0
        var tip = Double(currencyFormatter.number(from:tipAmountLabel.text!)!)
        
        if roundTipButton.isSelected {
            calculateTip(self)
            self.roundTipButton.isSelected = false
            self.roundTipButton.setTitle("Round Tip", for: .normal)
            
        }
        else {
            
            tip = ceil(tip)
            let total = bill + tip
            tipAmountLabel.text = currencyFormatter.string(for:tip)
            totalAmountLabel.text = currencyFormatter.string(for:total)
            self.roundTipButton.isSelected = true
            self.roundTipButton.setTitle("Undo Round Tip", for: .normal)
        }
    }
    
    
    @IBAction func roundTotalButtonAction(_ sender: AnyObject) {
        
        print("roundTotalAction called")
        
        let bill = Double(billAmountField.text!) ?? 0
        var total = Double(currencyFormatter.number(from:totalAmountLabel.text!)!)
        
        if roundTotalButton.isSelected {
            calculateTip(self)
            self.roundTotalButton.isSelected = false
            self.roundTotalButton.setTitle("Round Total", for: .normal)
            
        }
        else {
            total = ceil(total)
            let tip = total - bill
            tipAmountLabel.text = currencyFormatter.string(for:tip)
            totalAmountLabel.text = currencyFormatter.string(for:total)
            self.roundTotalButton.isSelected = true
            self.roundTotalButton.setTitle("Undo Round Total", for: .normal)
        }
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        
        let tipPercentages = [0.18,0.2,0.25]
        let bill = Double(billAmountField.text!) ?? 0
        let oldTipLabel = tipAmountLabel.text!
        let oldTotalLabel = totalAmountLabel.text!
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // set last updated time
        defaults.set(bill, forKey:"bill_amount")
        defaults.set(NSDate(), forKey: "bill_last_updated")
        defaults.synchronize()
        
        tipAmountLabel.text = currencyFormatter.string(for:tip)
        totalAmountLabel.text = currencyFormatter.string(for:total)
        
        
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
        
        self.roundTipButton.isSelected = false
        self.roundTipButton.setTitle("Round Tip", for: .normal)
        self.roundTotalButton.isSelected = false
        self.roundTotalButton.setTitle("Round Total", for: .normal)
        
        
    }

}
