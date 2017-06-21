//
//  SettingsViewController.swift
//  shitOut
//
//  Created by Ramnarayan Chinavelaka on 6/21/17.
//  Copyright © 2017 Ramnarayan Chinavelaka. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var redValue: UILabel!
    @IBOutlet var greenValue: UILabel!
    @IBOutlet var blueValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func close(_ sender: Any) {
    }
    
    @IBAction func brushSliderChanged(_ sender: Any) {
    }

    @IBAction func opacitySliderChanged(_ sender: Any) {
    }
    
    @IBAction func colorSliderChanged(_ sender: Any) {
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
