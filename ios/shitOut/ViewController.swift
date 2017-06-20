//
//  ViewController.swift
//  shitOut
//
//  Created by Ramnarayan Chinavelaka on 6/15/17.
//  Copyright © 2017 Ramnarayan Chinavelaka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    var lastPoint = CGPoint.zero
    var red: CGFloat = 0.0
    var green: CGFloat = 0.0
    var blue: CGFloat = 0.0
    var brushWidth: CGFloat = 10.0
    //    var opacity: CGFloat = 1.0
    var swiped = false
    
    enum Colors : String {
        case Black
        case Brown
        case DarkGreen
        case DarkOrange
        case Grey
        case Blue
        case LightBlue
        case LightGreen
        case Red
        case Yellow
        case Eraser
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = false
        if let touch = touches.first {
            lastPoint = touch.location(in: self.view)
        }
    }
    
    func drawLineFrom(fromPoint: CGPoint, toPoint: CGPoint) {
        // 1
        UIGraphicsBeginImageContext(self.view.frame.size)
        imageView.image?.draw(in: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        let context = UIGraphicsGetCurrentContext()
        
        // 2
        context?.move(to: CGPoint(x: fromPoint.x, y: fromPoint.y))
        context?.addLine(to: CGPoint(x: toPoint.x, y: toPoint.y))
        
        // 3
        context?.setBlendMode(CGBlendMode.normal)
        context?.setLineCap(CGLineCap.round)
        context?.setLineWidth(brushWidth)
        context?.setStrokeColor(red: red, green: green, blue: blue, alpha : 1.0)
        // 4
        context?.strokePath()
        
        // 5
        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 6
        swiped = true
        if let touch = touches.first {
            let currentPoint = touch.location(in: self.view)
            drawLineFrom(fromPoint: lastPoint, toPoint: currentPoint)
            
            // 7
            lastPoint = currentPoint
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !swiped {
            // draw a single point
            drawLineFrom(fromPoint: lastPoint, toPoint: lastPoint)
        }
    }
    
    @IBAction func colorPicked(_ sender: Any) {
        let colorButton: UIButton = sender as! UIButton
        if let colorPicked = colorButton.titleLabel?.text {
            if colorPicked == Colors.Black.rawValue {
                (red,green,blue) = (0,0,0)
            }else if colorPicked == Colors.Brown.rawValue {
                (red,green,blue) = (160.0 / 255.0, 82.0 / 255.0, 45.0 / 255.0)
            }else if colorPicked == Colors.DarkGreen.rawValue {
                (red,green,blue) = (102.0 / 255.0, 204.0 / 255.0, 0)
            }else if colorPicked == Colors.DarkOrange.rawValue {
                (red,green,blue) = (1.0, 102.0 / 255.0, 0)
            }else if colorPicked == Colors.Grey.rawValue {
                (red,green,blue) =  (105.0 / 255.0, 105.0 / 255.0, 105.0 / 255.0)
            }else if colorPicked == Colors.Blue.rawValue {
                (red,green,blue) = (0, 0, 1.0)
            }else if colorPicked == Colors.LightBlue.rawValue {
                (red,green,blue) = (51.0 / 255.0, 204.0 / 255.0, 1.0)
            }else if colorPicked == Colors.LightGreen.rawValue {
                (red,green,blue) =  (102.0 / 255.0, 1.0, 0)
            }else if colorPicked == Colors.Red.rawValue {
                (red,green,blue) = (1.0, 0, 0)
            }else if colorPicked == Colors.Yellow.rawValue {
                (red,green,blue) = (1.0, 1.0, 0)
            }else if colorPicked == Colors.Eraser.rawValue {
                (red,green,blue) = (1.0, 1.0, 1.0)
            }
        }
    }
    
    @IBAction func reset(_ sender: Any) {
        self.imageView.image = nil
    }
    
    @IBAction func save(_ sender: Any) {
        if let image = self.imageView.image {
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        }
    }
    
    @IBAction func publish(_ sender: Any) {
    }
    
    @IBAction func settings(_ sender: Any) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

