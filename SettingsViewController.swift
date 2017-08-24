//
//  SettingsViewController.swift
//  Tipperwu
//
//  Created by Judy Wu on 8/23/17.
//  Copyright © 2017 Judy Wu. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    @IBOutlet weak var themeColorControl: UISegmentedControl!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        defaultTipControl.selectedSegmentIndex = defaults.integer(forKey: "default_tip_index")
        
        themeColorControl.selectedSegmentIndex = defaults.integer(forKey: "default_theme_color_index")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    @IBAction func setDefaultTip(_ sender: AnyObject) {
    
        defaults.set(defaultTipControl.selectedSegmentIndex, forKey: "default_tip_index")
        defaults.synchronize()
    }
    
    @IBAction func setSelectedThemeColor(_ sender: AnyObject) {
        defaults.set(themeColorControl.selectedSegmentIndex, forKey:"selected_theme_color_index")
        defaults.synchronize()

    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
