//
//  ViewController.swift
//  RetroCalc
//
//  Created by ROHAN DAVE on 27/02/16.
//  Copyright © 2016 ROHAN DAVE. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    @IBOutlet weak var outputLabel: UILabel!
    
    
    var buttonSound : AVAudioPlayer!
    var runningNumber = ""
    var runningNumber2 = ""
    var result = ""
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = NSBundle.mainBundle().pathForResource("btn", ofType: "wav")
        let soundUrl = NSURL(fileURLWithPath: path!)
        
        do {
            try buttonSound = AVAudioPlayer(contentsOfURL: soundUrl)
            buttonSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
    }
    
    @IBAction func buttonPressed(sender: UIButton) {
        
        buttonSound.play()
        
        runningNumber += "\(sender.tag)"
        outputLabel.text = runningNumber
        
    }
    
    @IBAction func subtractPressed(sender: UIButton) {
        
        outputLabel.text = "-"
        runningNumber2 = runningNumber
        runningNumber = ""
        
    }
    
    @IBAction func equalPressed(sender: UIButton) {
        
        result = "\(Double(runningNumber2)! - Double(runningNumber)!)"
        
        outputLabel.text = result
        result = ""
        runningNumber = ""
        runningNumber2 = ""
        
    }
    


}

