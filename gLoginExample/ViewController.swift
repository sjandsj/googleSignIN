//
//  ViewController.swift
//  gLoginExample
//
//  Created by Rails on 15/07/19.
//  Copyright © 2019 gammastack. All rights reserved.
//

import UIKit
import GoogleSignIn
import Google

class ViewController: UIViewController {
    
    @IBOutlet var nameLAbel: UILabel!
    @IBOutlet var userIDLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var signOutButtonLabel: GIDSignInButton!
    @IBOutlet var signInButtonLabel: GIDSignInButton!
    
    var error: NSError?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailLabel.text = ""
        userIDLabel.text = ""
        nameLAbel.text = ""
        signOutButtonLabel.isHidden = true
        GIDSignIn.sharedInstance().clientID = "35813679887-2trg4vovvb4tfkqfgss69pf2djlpq147.apps.googleusercontent.com"
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
    }
    @IBAction func signInWithGoogleButton(_ sender: GIDSignInButton) {
        GIDSignIn.sharedInstance()?.signIn()
    }
    @IBAction func signOutGooleButton(_ sender: GIDSignInButton) {
        
        GIDSignIn.sharedInstance()?.signOut()
        emailLabel.text = "You Are Logged Out"
        userIDLabel.text = ""
        nameLAbel.text = ""
        signInButtonLabel.isHidden = false
    }
}

extension ViewController:  GIDSignInUIDelegate, GIDSignInDelegate {
    
    func sign(inWillDispatch signIn: GIDSignIn!, error: Error!) {
    }
    
    func sign(_ signIn: GIDSignIn!,
              present viewController: UIViewController!) {
        self.present(viewController, animated: true, completion: nil)
    }
    
    public func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
                     withError error: Error!) {
        if (error == nil) {
            emailLabel.text = user.profile.email
            nameLAbel.text = user.profile.name
            userIDLabel.text = user.userID
            signOutButtonLabel.isHidden = false
            signInButtonLabel.isHidden = true
        } else {
            print("\(String(describing: error))")
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!,
              withError error: Error!) {
    }
    
}
