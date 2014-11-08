//
//  ViewController.swift
//  Reading Raptr
//
//  Created by Kay Lab on 11/8/14.
//  Copyright (c) 2014 Kay Lab. All rights reserved.
//
import AVFoundation
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var text1: UITextView!
    @IBOutlet weak var button1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func textViewDidChange(textView: UITextView!) { //Handle the text changes here
        print(textView.text); //the textView parameter is the textView where text was changed
    }

    
    @IBAction func buttonSpeakClicked(sender:UIButton)
    {
        var mySpeechSynthesizer:AVSpeechSynthesizer = AVSpeechSynthesizer()
        var myString:String = "This is the phrase to say"
        var mySpeechUtterance:AVSpeechUtterance = AVSpeechUtterance(string:myString)
        
        println("\(mySpeechUtterance.speechString)")
        println("My string - \(myString)")
        
        mySpeechSynthesizer .speakUtterance(mySpeechUtterance)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

