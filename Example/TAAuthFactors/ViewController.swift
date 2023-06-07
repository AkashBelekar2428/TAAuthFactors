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
        var authAuth = AuthenticationLogIn()
        authAuth.controller = self
        authAuth.setDefaultThems()
        authAuth.frame = self.view.bounds
      //  self.view.addSubview(authAuth)
        
        //        authAuth.lblEmailIcon.text = "\u{e908}" //\u{f00d}
        //        authAuth.lblEmailIcon.textColor = .black
        //        authAuth.lblEmailIcon.font = UIFont(name: "authentication_font_file", size: 21)!
        //
        //        authAuth.lblPasswordIcon.text = "\u{e907}"
        //        authAuth.lblPasswordIcon.textColor = .black
        //        authAuth.lblPasswordIcon.font = UIFont(name: "authentication_font_file", size: 21)!
        //
        //        authAuth.btnEyeIcon.setTitle("\u{e905}", for: .normal)
        //        authAuth.btnEyeIcon.setTitleColor(.black, for: .normal)
        //        authAuth.btnEyeIcon.titleLabel?.font = UIFont(name: "authentication_font_file", size: 21)!
        //
        //
        var authEmail = Email_Address()
        authEmail.controller = self
        authEmail.setEmailDefaultThemes()
        authEmail.frame = self.view.bounds
       // self.view.addSubview(authEmail)
        //
        //        authEmail.lblEmailIcon.text = "\u{e908}" //\u{f00d}
        //        authEmail.lblEmailIcon.textColor = .black
        //        authEmail.lblEmailIcon.font = UIFont(name: "authentication_font_file", size: 21)!
        //
        var authmob = Mobile_Number()
        authmob.controller = self
        authmob.setMobileDefaultThemes()
        authmob.frame = self.view.bounds
         self.view.addSubview(authmob)
        //
        //        authmob.lblIconCountryCode.text = "\u{e901}" //\u{f00d}
        //        authmob.lblIconCountryCode.textColor = .black
        //        authmob.lblIconCountryCode.font = UIFont(name: "authentication_font_file", size: 21)!
        
        var authPin = PINView()
        authPin.controller = self
        authPin.setPINDefaultThemes()
        authPin.frame = self.view.bounds
        //self.view.addSubview(authPin)    }
    }
    
}
