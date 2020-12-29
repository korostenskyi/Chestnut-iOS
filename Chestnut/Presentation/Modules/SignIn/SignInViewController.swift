//
//  SignInViewController.swift
//  Chestnut
//
//  Created by Roman Korostenskyi on 29.12.2020.
//  Copyright © 2020 Roman Korostenskyi. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class SignInViewController: UIViewController {
    
    var viewModel: SignInViewModel!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    @IBAction func signInClick() {
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance().signIn()
    }
}
