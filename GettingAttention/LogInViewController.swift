//
//  LogInViewController.swift
//  GettingAttention
//
//  Created by csit267-13 on 10/28/15.
//  Copyright © 2015 CSIT_267. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var logInField: UITextField!
    
    @IBAction func updateLabel(sender: AnyObject) {
        (presentingViewController as! ViewController).userOutput.text = logInField.text
    }
    
 
    
    @IBAction func hideKeyboard(sender: AnyObject) {
    }
    
    override func viewWillAppear(animated: Bool) {
      
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        preferredContentSize = CGSizeMake(340,380)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
