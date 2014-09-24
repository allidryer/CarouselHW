//
//  SignInViewController.swift
//  CarouselHW
//
//  Created by Alli Dryer on 9/19/14.
//  Copyright (c) 2014 Alli Dryer. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UIAlertViewDelegate {

    @IBOutlet weak var dismissSignInButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var signInButtonsImageView: UIImageView!
    @IBOutlet weak var loginTextImageView: UIImageView!
    @IBOutlet weak var loginFormImageView: UIImageView!
   
    
    @IBAction func signInButtonDidPress(sender: UIButton) {
        if (self.emailTextField.text == "alli@Twitter.com") && (self.passwordTextField.text == "password") || (self.emailTextField.text == "alli@Twitter.com") && (self.passwordTextField.text == "wrong") {
            var alertView = UIAlertView(title: "Signing in...", message: nil, delegate: self, cancelButtonTitle: nil)
            alertView.show()
            self.view.endEditing(true)
            // Delay for 2 seconds, then run the code between the braces.
            delay(2, closure: { () -> () in
                alertView.dismissWithClickedButtonIndex(0, animated: true)
                if (self.emailTextField.text == "alli@Twitter.com") && (self.passwordTextField.text == "password") {
                        self.performSegueWithIdentifier("signInToTutorial", sender: self)
                    }
                if (self.emailTextField.text == "alli@Twitter.com") && (self.passwordTextField.text == "wrong") {
                    var alertView = UIAlertView(title: "Sign In Failed", message: "Incorrect email or password", delegate: self, cancelButtonTitle: "OK")
                    alertView.show()
                    }
            })
        } else {
            var alertView = UIAlertView(title: "Email Required", message: "Please enter your email address.", delegate: self, cancelButtonTitle: "OK")
                alertView.show()
            }
    }

    
    @IBAction func dismissSignInView(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)

        // Do any additional setup after loading the view.
    }
    
    func alertView(alertView: UIAlertView!, clickedButtonAtIndex buttonIndex: Int) {
        // buttonIndex is 0 for Cancel
        // buttonIndex ranges from 1-n for the other buttons.
    }
   
    func keyboardWillShow(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions.fromRaw(UInt(animationCurve << 16))!, animations: {
            
            self.signInButtonsImageView.transform = CGAffineTransformMakeTranslation(0, -260)
            self.signInButton.transform = CGAffineTransformMakeTranslation(0, -260)
            self.loginFormImageView.transform = CGAffineTransformMakeTranslation(0, -110)
            self.emailTextField.transform = CGAffineTransformMakeTranslation(0, -110)
            self.passwordTextField.transform = CGAffineTransformMakeTranslation(0, -110)
            self.loginTextImageView.transform = CGAffineTransformMakeTranslation(0, -260)
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            }, completion: nil)
        
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions.fromRaw(UInt(animationCurve << 16))!, animations: {
            
            self.signInButtonsImageView.transform = CGAffineTransformMakeTranslation(0, 0)
            self.signInButton.transform = CGAffineTransformMakeTranslation(0, 0)
            self.loginFormImageView.transform = CGAffineTransformMakeTranslation(0, 0)
            self.emailTextField.transform = CGAffineTransformMakeTranslation(0, 0)
            self.passwordTextField.transform = CGAffineTransformMakeTranslation(0, 0)
            self.loginTextImageView.transform = CGAffineTransformMakeTranslation(0, 0)
            }, completion: nil)
    }
    
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
  
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
