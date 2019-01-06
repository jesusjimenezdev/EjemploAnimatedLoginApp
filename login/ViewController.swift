//
//  ViewController.swift
//  login
//
/*
 MIT License
 
 Copyright (c) 2018 Gwinyai Nyatsoka
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

import UIKit

class ViewController: UIViewController {
    
    lazy var logoImage: UIImageView = {
        
        let image = UIImageView(image: UIImage(named: "cat")!)
        
        image.layer.masksToBounds = true
        
        return image
        
    }()
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var loginView: UIView!
    
    var moveLogoAnimator: UIViewPropertyAnimator!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        loginView.backgroundColor = UIColor(red:0.29, green:0.29, blue:0.29, alpha:1.0)
        
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        
        loginView.addSubview(logoImage)
        
        NSLayoutConstraint.activate([
            
            logoImage.centerXAnchor.constraint(equalTo: loginView.centerXAnchor),
            
            logoImage.centerYAnchor.constraint(equalTo: loginView.centerYAnchor),
            
            logoImage.heightAnchor.constraint(equalToConstant: CGFloat(100.0)),
            
            logoImage.widthAnchor.constraint(equalToConstant: CGFloat(100.0))
            
        ])
        
        loginView.transform = CGAffineTransform(scaleX: 0, y: 0)
        
        usernameTextField.alpha = CGFloat(0)
        
        passwordTextField.alpha = CGFloat(0)
        
        loginButton.alpha = CGFloat(0)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        logoImage.layer.cornerRadius = CGFloat(50.0)
        
        loginView.layer.cornerRadius = CGFloat(7)
        
        loginButton.layer.cornerRadius = CGFloat(5)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.8, delay: 1, usingSpringWithDamping: 0.5, initialSpringVelocity: 2, options: .curveEaseOut, animations: {
            
            self.loginView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            
        }) { (success) in
            
            self.setupMoveLogoAnimation()
            
            self.moveLogoAnimator.startAnimation()
            
        }
        
    }
    
    func setupMoveLogoAnimation() {
        
        moveLogoAnimator = UIViewPropertyAnimator(duration: 2.0, curve: .easeIn, animations: nil)
        
        moveLogoAnimator.addAnimations({
            
            self.logoImage.frame.origin.y = CGFloat(20.0)
            
            self.loginView.backgroundColor = UIColor.white
            
        }, delayFactor: 0.2)
        
        moveLogoAnimator.addAnimations({
            
            self.usernameTextField.alpha = 1.0
            
        }, delayFactor: 0.6)
        
        moveLogoAnimator.addAnimations({
            
            self.passwordTextField.alpha = 1.0
            
        }, delayFactor: 0.7)
        
        moveLogoAnimator.addAnimations({
            
            self.loginButton.alpha = 1.0
            
        }, delayFactor: 0.8)
        
    }


}

