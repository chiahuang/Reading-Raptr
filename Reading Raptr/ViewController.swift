//
//  ViewController.swift
//  Reading Raptr
//
//  Created by Kay Lab on 11/8/14.
//  Copyright (c) 2014 Kay Lab. All rights reserved.
//
import AVFoundation
import Foundation
import UIKit

class ViewController: UIViewController, NSXMLParserDelegate {

    @IBOutlet weak var text1: UITextView!
    @IBOutlet weak var button1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // MARK: NSXMLParserDelegate
    
    func parser(parser: NSXMLParser, foundElementDeclarationWithName elementName: String, model: String) {

    }
    
    func textViewDidChange(textView: UITextView!) { //Handle the text changes here
        print(textView.text); //the textView parameter is the textView where text was changed
    }

    
    @IBAction func buttonSpeakClicked(sender:UIButton)
    {
        
        var text : String = text1.text
        var mySpeechSynthesizer:AVSpeechSynthesizer = AVSpeechSynthesizer()
        var myString:String = "\(text)"
        var mySpeechUtterance:AVSpeechUtterance = AVSpeechUtterance(string:myString)
        
        
        if let url = NSURL(string: "http://rss.cnn.com/rss/cnn_topstories.rss"){
            let request = NSURLRequest(URL: url)
            
            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {
                (response, data, error) in
                
                // let myString = NSString(data: data, encoding: NSUTF8StringEncoding)
                
                // println (myString)
                
                let parser = NSXMLParser(data: data)
                
                parser.delegate = self
                
                parser.parse()
            }
        }
        //Commented out for test
        //println("\(mySpeechUtterance.speechString)")
        //println("My string - \(myString)")
        
        mySpeechSynthesizer.speakUtterance(mySpeechUtterance)
    }
}

