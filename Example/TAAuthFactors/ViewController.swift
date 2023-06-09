//
//  ViewController.swift
//  TAAuthFactors
//
//  Created by akashbelekar2428 on 06/07/2023.
//  Copyright (c) 2023 akashbelekar2428. All rights reserved.
//

import UIKit
import TAAuthFactors

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let authAuth = AuthenticationLogIn()
        authAuth.controller = self
        authAuth.setDefaultThems()
        authAuth.frame = self.view.bounds
        self.view.addSubview(authAuth)
        
        let authEmail = Email_Address()
        authEmail.controller = self
        authEmail.setEmailDefaultThemes()
        authEmail.frame = self.view.bounds
       // self.view.addSubview(authEmail)
        //
     
        let authmob = Mobile_Number()
        authmob.controller = self
        authmob.setMobileDefaultThemes()
        authmob.frame = self.view.bounds
        // self.view.addSubview(authmob)

        
        let authPin = PINView()
        authPin.controller = self
        authPin.setPINDefaultThemes()
        authPin.frame = self.view.bounds
        //self.view.addSubview(authPin)    }
    }
    
}
