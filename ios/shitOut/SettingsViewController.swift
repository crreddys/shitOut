//
//  SettingsViewController.swift
//  shitOut
//
//  Created by Ramnarayan Chinavelaka on 6/21/17.
//  Copyright © 2017 Ramnarayan Chinavelaka. All rights reserved.
//

import UIKit

protocol SettingsViewControllerDelegate: class {
    func settingsViewControllerFinished(settingsViewController: SettingsViewController)
}

class SettingsViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var redValue: UILabel!
    @IBOutlet var greenValue: UILabel!
    @IBOutlet var blueValue: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    @IBOutlet var brushSlider: UISlider!
    @IBOutlet var opacitySlider: UISlider!
    
    var red: CGFloat = 0.0
    var green: CGFloat = 0.0
    var blue: CGFloat = 0.0
    var brushWidth: CGFloat = 5.0
    var opacity: CGFloat = 1.0
    
    var delegate: SettingsViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        drawPreview()
        
        redSlider.value = Float(red)
        redValue.text = String(Int(redSlider.value * 255))
        
        greenSlider.value = Float(green)
        greenValue.text = String(Int(greenSlider.value * 255))
        
        blueSlider.value = Float(blue)
        blueValue.text = String(Int(blueSlider.value * 255))
        
        brushSlider.value = Float(brushWidth)
        opacitySlider.value = Float(opacity)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func close(_ sender: Any) {
        if delegate != nil {
            delegate?.settingsViewControllerFinished(settingsViewController: self)
        }
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func brushSliderChanged(_ sender: Any) {
        let slider = sender as! UISlider
        brushWidth = CGFloat(slider.value)
        drawPreview()
    }

    @IBAction func opacitySliderChanged(_ sender: Any) {
        let slider = sender as! UISlider
        opacity = CGFloat(slider.value)
        drawPreview()
    }
    
    @IBAction func colorSliderChanged(_ sender: Any) {
        red = CGFloat(redSlider.value)
        redValue.text = NSString(format: "%d", Int(redSlider.value * 255)) as String
        green = CGFloat(greenSlider.value)
        greenValue.text = NSString(format: "%d", Int(greenSlider.value * 255 )) as String
        blue = CGFloat(blueSlider.value)
        blueValue.text = NSString(format: "%d", Int(blueSlider.value * 255)) as String
        
        drawPreview()
    }
    
    func drawPreview() {
        UIGraphicsBeginImageContext(imageView.frame.size)
        let context = UIGraphicsGetCurrentContext()
        
        context?.setStrokeColor(UIColor(red: red, green: green, blue: blue, alpha: opacity).cgColor)
        context?.setLineWidth(brushWidth)
        context?.setLineCap(CGLineCap.round)
        
        context?.move(to: CGPoint(x: 50, y: 50))
        context?.addLine(to: CGPoint(x: 50, y: 50))
        context?.strokePath()
        
        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
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
