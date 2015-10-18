//
//  ViewController.swift
//  GettingAttention
//
//  Created by csit267-13 on 10/14/15.
//  Copyright (c) 2015 csit267-13. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {
    
    
    @IBOutlet weak var userOutput: UILabel!
    
    @IBAction func doAlert(sender: AnyObject) {
        AudioServicesPlaySystemSound(1016)
        let alertController = UIAlertController(title: "Alert Me Button Selected",
            message: "I need your attention NOW!",
            preferredStyle: UIAlertControllerStyle.Alert)
        
        let defaultAction = UIAlertAction(title: "Ok",
            style: UIAlertActionStyle.Cancel,
            handler: nil)
        
        alertController.addAction(defaultAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    @IBAction func doMultiButtonAlert(sender: AnyObject) {
        AudioServicesPlaySystemSound(1108)
        let alertController = UIAlertController(title: "Alert with Buttons Selected",
            message: "Options are good for people!",
            preferredStyle: UIAlertControllerStyle.Alert)
        
        let nowAction = UIAlertAction(title: "Do Something Now",
            style: UIAlertActionStyle.Default,
            handler: {(alertAction: UIAlertAction) in
                self.userOutput.text="Pressed Now"
        })
        
        let laterAction = UIAlertAction(title: "Do Something Later",
            style: UIAlertActionStyle.Default,
            handler: {(alertAction: UIAlertAction) in
                self.userOutput.text="Pressed Later"
        })
        
        let cancelAction = UIAlertAction(title: "Never Do It",
            style: UIAlertActionStyle.Cancel,
            handler: {(alertAction: UIAlertAction) in
                self.userOutput.text="Pressed Never"
        })
        
        alertController.addAction(nowAction)
        alertController.addAction(laterAction)
        alertController.addAction(cancelAction)
        
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    @IBAction func doAlertInput(sender: AnyObject) {
        AudioServicesPlaySystemSound(1057)
        let alertController = UIAlertController(title: "Email Address",
            message: "Please enter your email address below:",
            preferredStyle: UIAlertControllerStyle.Alert)
        
        alertController.addTextFieldWithConfigurationHandler({(textField: UITextField) in
            textField.placeholder="Email Address"
            textField.keyboardType=UIKeyboardType.EmailAddress
        })
        
        let defaultAction = UIAlertAction(title: "Ok",
            style: UIAlertActionStyle.Default,
            handler: {(alertAction: UIAlertAction) in
                let emailAddress = (alertController.textFields?[0])!.text!
                self.userOutput.text="Entered '\(emailAddress)'"
        })
        
        alertController.addAction(defaultAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    @IBAction func doActionSheet(sender: AnyObject) {
        AudioServicesPlaySystemSound(1105)
        let alertController = UIAlertController(title: "Available Actions",
            message: "Choose something from this list",
            preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        let negotiateAction = UIAlertAction(title: "Negotiate",
            style: UIAlertActionStyle.Default,
            handler: {(alertAction: UIAlertAction) in
                self.userOutput.text="Pressed Negotiate"
        })
        
        let compromiseAction = UIAlertAction(title: "Compromise",
            style: UIAlertActionStyle.Default,
            handler: {(alertAction: UIAlertAction) in
                self.userOutput.text="Pressed Compromise"
        })
        
        let destroyAction = UIAlertAction(title: "Destroy",
            style: UIAlertActionStyle.Destructive,
            handler: {(alertAction: UIAlertAction) in
                self.userOutput.text="Pressed Destroy"
        })
        
        let cancelAction = UIAlertAction(title: "Cancel",
            style: UIAlertActionStyle.Cancel,
            handler: {(alertAction: UIAlertAction) in
                self.userOutput.text="Pressed Cancel"
        })
        
        alertController.addAction(negotiateAction)
        alertController.addAction(compromiseAction)
        alertController.addAction(destroyAction)
        alertController.addAction(cancelAction)
        
        
        if (alertController.popoverPresentationController != nil) {
            alertController.popoverPresentationController!.sourceView = sender as! UIButton
            alertController.popoverPresentationController!.sourceRect = (sender as! UIButton).bounds
        }
        
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    
    @IBAction func doSound(sender: AnyObject) {
        var soundID: SystemSoundID = 0
        let soundFile: String = NSBundle.mainBundle().pathForResource("soundeffect", ofType: "wav")!
        let soundURL: NSURL = NSURL(fileURLWithPath: soundFile)
        AudioServicesCreateSystemSoundID(soundURL, &soundID)
        AudioServicesPlaySystemSound(soundID)
    }
    
    
    @IBAction func doAlertSound(sender: AnyObject) {
        var soundID: SystemSoundID = 0
        let soundFile: String = NSBundle.mainBundle().pathForResource("alertsound", ofType: "wav")!
        let soundURL: NSURL = NSURL(fileURLWithPath: soundFile)
        AudioServicesCreateSystemSoundID(soundURL, &soundID)
        AudioServicesPlayAlertSound(soundID)
    }

    
    @IBAction func doVibration(sender: AnyObject) {
        AudioServicesPlaySystemSound(UInt32(kSystemSoundID_Vibrate))
    }
    
    
    @IBAction func doLoginAlert(sender: AnyObject) {
        AudioServicesPlaySystemSound(1103)
        let alert = UIAlertController(title: "Please Log In", message: "Enter username and password", preferredStyle: UIAlertControllerStyle.Alert)
 
        alert.addTextFieldWithConfigurationHandler {
            (textFieldName: UITextField!) in
            textFieldName.placeholder = "Enter username"
            textFieldName.keyboardType=UIKeyboardType.Default
        }
        
        alert.addTextFieldWithConfigurationHandler {
            (textFieldPass: UITextField!) in
            textFieldPass.placeholder = "Enter Password"
            textFieldPass.keyboardType=UIKeyboardType.Default
            textFieldPass.secureTextEntry=true
            
        }
        
        let okAction = UIAlertAction(title: "Submit", style: UIAlertActionStyle.Default) { (action: UIAlertAction!) -> Void in
            let user = (alert.textFields?[0])!.text!
            self.userOutput.text="Username: '\(user)'"
            AudioServicesPlaySystemSound(1054)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: {(alertAction: UIAlertAction) in
            AudioServicesPlaySystemSound(1053)
        })
        
        okAction.enabled = false
        
        // Checks that text fields are not empty before allowing submit
        let textFieldValidationObserver: (NSNotification!) -> Void = { _ in
            let textFieldName = alert.textFields![0] 
            let textFieldpass = alert.textFields![1] 
            okAction.enabled = (textFieldpass.text?.isEmpty != true && textFieldName.text?.isEmpty != true)
        }
        
        // Notifications for username text changes
        NSNotificationCenter.defaultCenter().addObserverForName(UITextFieldTextDidChangeNotification,
            object: alert.textFields![0],  // textFieldName
            queue: NSOperationQueue.mainQueue(), usingBlock: textFieldValidationObserver)
        
        // Notifications for password text changes
        NSNotificationCenter.defaultCenter().addObserverForName(UITextFieldTextDidChangeNotification,
            object: alert.textFields![1],  // textFieldEmail
            queue: NSOperationQueue.mainQueue(), usingBlock: textFieldValidationObserver)
        
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        
        presentViewController(alert, animated: true, completion: nil)
        
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

