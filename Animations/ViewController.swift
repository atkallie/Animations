//
//  ViewController.swift
//  Animations
//
//  Created by Ahmed T Khalil on 1/8/17.
//  Copyright © 2017 kalikans. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imageDisplay: UIImageView!
    @IBOutlet var buttonName: UIButton!
    var counter: Int = 0
    var timer = Timer()
    var isPaused: Bool = true
    
    @IBAction func fadeIn(_ sender: Any) {
        imageDisplay.alpha = 0
        
        //UIView animate basically creates a smooth transition from the current state (defined above) to the end state state (code in the closure) over the course of the set duration
        UIView.animate(withDuration: 1) { 
            self.imageDisplay.alpha = 1
        }
    }
    
    //NOTE: if you are ever confused of what comes after the '=' sign, just check what type the thing you are manipulating is; i.e. imageDisplay.frame is a 'CGRect' & imageDisplay.center is a 'CGPoint'
    
    @IBAction func grow(_ sender: Any) {
        let width_initial = imageDisplay.frame.width
        let height_initial = imageDisplay.frame.height
        
        //sets the position and size of the image frame
        imageDisplay.frame = CGRect(x: imageDisplay.center.x, y: imageDisplay.center.y, width: 0, height: 0)
        
        UIView.animate(withDuration: 1) {
            //Note that the center is repositioned based on the original height/width in the code below (0.5 factor) since the computer first sets the center of the frame (which is initially set to size 0) and then grows outward from top-left corner
            self.imageDisplay.frame = CGRect(x: self.imageDisplay.center.x - 0.5*width_initial, y: self.imageDisplay.center.y - 0.5*height_initial, width: width_initial, height: height_initial)
        }
    }
    
    @IBAction func slideIn(_ sender: Any) {
        //sets the core graphics point position of center of the image
        imageDisplay.center = CGPoint(x: imageDisplay.center.x-500, y: imageDisplay.center.y)
        
        UIView.animate(withDuration: 2) {
            self.imageDisplay.center = CGPoint(x: self.imageDisplay.center.x+500, y: self.imageDisplay.center.y)
        }
    }
    
    
    @IBAction func next(_ sender: Any) {
        
        //This code was used to loop through images one by one
        //Notice how connecting it to a timer lets you loop through it automatically
        /*
         
         if counter<21{
            counter += 1
        }else{
            counter=0
        }
        imageDisplay.image = UIImage(named: "frame_\(counter)_delay-0.07s.gif")
         
        */
        
        if isPaused{
            timer = Timer.scheduledTimer(timeInterval: 0.07, target: self, selector: #selector(ViewController.changeImage), userInfo: nil, repeats: true)
            isPaused = false
            //'[]' for UIControlState simply means 'for the default state'
            buttonName.setTitle("Stop", for: [])
        }else{
            timer.invalidate()
            isPaused = true
            //'[]' for UIControlState simply means 'for the default state'
            buttonName.setTitle("Start", for: [])
        }
    }
        
    func changeImage()->(){
        if counter<21{
            counter += 1
        }else{
            counter=0
        }
        imageDisplay.image = UIImage(named: "frame_\(counter)_delay-0.07s.gif")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

