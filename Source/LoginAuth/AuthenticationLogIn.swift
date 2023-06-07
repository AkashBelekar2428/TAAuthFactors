//
//  AuthView.swift
//  Reusable
//
//  Created by Akash Belekar on 26/04/23.
//

import UIKit

//MARK: Protocol AuthenticationLogInDelegate
public protocol AuthenticationLogInDelegate{
    func sendPinBtnAction(email: String, password: String)
}

//MARK: AuthenticationLogIn Class
public class AuthenticationLogIn: UIView{
    
    //MARK: @IBOutlets
    @IBOutlet weak public var viewContainerAuth:UIView!
    @IBOutlet weak public var imgLogo:UIImageView!
    @IBOutlet weak public var lblLogin:UILabel!
    @IBOutlet weak public var lblAuthType:UILabel!
    @IBOutlet weak public var viewAuthType:UIView!
    @IBOutlet weak public var lblEmailIcon:UILabel!
    @IBOutlet weak public var tfEmail:UITextField!
    @IBOutlet weak public var lblEnterValidAuth:UILabel!
    @IBOutlet weak public var lblPassword:UILabel!
    @IBOutlet weak public var viewPassword:UIView!
    @IBOutlet weak public var lblPasswordIcon:UILabel!
    @IBOutlet weak public var tfPassword:UITextField!
    @IBOutlet weak public var btnEyeIcon:UIButton!
    @IBOutlet weak public var lblEnterValidePassword:UILabel!
    @IBOutlet weak public var btnForgotPassword:UIButton!
    @IBOutlet weak public var btnValidate:UIButton!
    @IBOutlet weak public var viewContainerHeight: NSLayoutConstraint!
   
    
    //MARK: Variables
    let nibName = "AuthenticationLogIn"
    public var delegate:AuthenticationLogInDelegate?
    public var authConfig = AuthenticationConfiguration()
    
    public weak var controller: UIViewController?
    var authType : TAAuthFactorType = .NONE
    var didTap = false
    
    
    //MARK: System methods
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        commonInit()
    }
    
    //MARK: Custom methods
    func commonInit(){
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        tfEmail.delegate = self
        tfPassword.delegate = self
        self.addSubview(view)
        self.viewContainerAuth.isHidden = true
    }
    
    func loadViewFromNib() -> UIView?{
        let bundel = Bundle(for: AuthenticationLogIn.self)
        let nib = bundel.loadNibNamed(nibName, owner: self)?.first as? UIView
        return nib
    }

    //MARK: SetDefaultThems
    public func setDefaultThems(){
        let config = self.themsConfiguration()
        setThemWithAuthConfiguration(config: config)
    }
    
    //MARK: Configure DefaultThems
    func themsConfiguration() -> AuthenticationConfiguration{
        let authConfigObj = AuthenticationConfiguration()
        let imgLogo = TAImage()
        let lblLogin = TALable()
        let lblAuthType = TALable()
        let lblPassword = TALable()
        let lblEnterValidEmail = TALable()
        let lblEnterValidPassword = TALable()
        let viewTestfiled = TAUIView()
        let tfFirst = TATextFiled()
        let tfSecond = TATextFiled()
        let btnForgotPassword = TAButton()
        let btnValid = TAButton()
        let containerView = TAUIView()
        let emailIcon = TALable()
        let passwordIcon = TALable()
        let eyeIcon = TAButton()
        
        
  
        
        setThemsForFont(FontClass: TAFontIcon.self)
        emailIcon.TAText = authType == .USERNAME_PASSWORD ? TAFontIcon.Icon_user  : TAFontIcon.Icon_mail
        emailIcon.TATextColor = TAFontIcon.TATextColor
        emailIcon.TATextFont = UIFont(name: "authentication_font_file", size: 20)!
        
        setThemsForFont(FontClass: TAFontIcon.self)
        passwordIcon.TAText = TAFontIcon.Icon_lock
        passwordIcon.TATextColor = TAFontIcon.TATextColor
        passwordIcon.TATextFont =  UIFont(name: "authentication_font_file", size: 20)!
        
        setThemsForFont(FontClass: TAFontIcon.self)
        eyeIcon.TABtnTitleText = TAFontIcon.Icon_eye_off
        eyeIcon.TABtnTitleTextColor = TAFontIcon.TAEyeIconColor
        eyeIcon.TABtnTitleTextFont =  UIFont(name: "authentication_font_file", size: 20)!
        eyeIcon.TABtnBackgrounColor = .white
        
        
        //MARK: Header Img Logo
        if let image = UIImage(named: "logo",in: Bundle(for:TAAssetsImage.self ),compatibleWith: nil){
            imgLogo.TAImageLogo = image
        }
        
        //MARK: Config Login Label
        lblLogin.TAText = "Login"
        lblLogin.TATextColor = TAColor.textLblColor
        lblLogin.TATextFont = .boldSystemFont(ofSize: 28)
        lblLogin.TATextAlignment = .left
        lblLogin.TATextNumberOfLines = 0
        
        //MARK: Config Email Label
        lblAuthType.TAText = "Email"
        lblAuthType.TATextColor = TAColor.textLblColor
        lblAuthType.TATextFont = .systemFont(ofSize: 14, weight: .medium)
        lblAuthType.TATextAlignment = .left
        lblAuthType.TATextNumberOfLines = 0
        
        //MARK: Config Password Label
        lblPassword.TAText = "Password"
        lblPassword.TATextColor = TAColor.textLblColor
        lblPassword.TATextFont = .systemFont(ofSize: 14, weight: .medium)
        lblPassword.TATextAlignment = .left
        lblPassword.TATextNumberOfLines = 0
        
        //MARK: Config Enter Valid Email Label
        lblEnterValidEmail.TAText = "Please enter valid Email"
        lblEnterValidEmail.TATextColor = TAColor.validAuthColor
        lblEnterValidEmail.TATextFont = .systemFont(ofSize: 13)
        lblEnterValidEmail.TATextAlignment = .left
        lblEnterValidEmail.TATextNumberOfLines = 0
        
        //MARK: Config Enter Valid Password Lebel
        lblEnterValidPassword.TAText = "Please enter valid Password"
        lblEnterValidPassword.TATextColor = TAColor.validAuthColor
        lblEnterValidPassword.TATextFont = .systemFont(ofSize: 13)
        lblEnterValidPassword.TATextAlignment = .left
        lblEnterValidPassword.TATextNumberOfLines = 0
        

        //MARK: Config tfView
        viewTestfiled.TAViewCornerRadius = 5
        viewTestfiled.TAViewborderWidth = 1
        viewTestfiled.TAViewBorderColor = TAColor.placeholderText_borderColor
  
        
        //MARK: Email Textfiled#colorLiteral(red: 0.8417297006, green: 0.8417295814, blue: 0.841729641, alpha: 1)
        tfFirst.TATextfiledPlaceHolderText = "abc@yourdomain.com"
        tfFirst.TATextfiledPlaceHolderTextColor = TAColor.textLblColor
        tfFirst.TATextfiledPlaceHolderTextFont = .systemFont(ofSize: 14, weight: .medium)
        
        //MARK: Password Textfiled
        tfSecond.TATextfiledPlaceHolderText = "********"
        tfSecond.TATextfiledPlaceHolderTextColor = TAColor.textLblColor
        tfSecond.TATextfiledPlaceHolderTextFont = .systemFont(ofSize: 14, weight: .medium)
        
      
        //MARK: ForgotPassword Button
        btnForgotPassword.TABtnTitleText = "Forgot Password?"
        btnForgotPassword.TABtnTitleTextColor = TAColor.forgotButtonTitleColor
        btnForgotPassword.TABtnTitleTextFont = .systemFont(ofSize: 14, weight: .medium)
        btnForgotPassword.TABtnBackgrounColor = .white
        
        
        //MARK: Validate Buttun
        btnValid.TABtnTitleText = "Validate"
        btnValid.TABtnTitleTextColor = TAColor.buttonTextColor
        btnValid.TABtnTitleTextFont = .systemFont(ofSize: 14, weight: .medium)
        btnValid.TABtnBackgrounColor = TAColor.buttonBackgroundColor
        btnValid.TABtnCornerRadius = 5
        
        
        //MARK: ContainerView
        containerView.TAViewCornerRadius = 20
        containerView.TAViewShadowColor = TAColor.shadowColor
        containerView.TAViewShadowOpacity = 0.4
        containerView.TAViewShadowOffset = CGSize(width: 2.0, height: 2.0)
        containerView.TAViewShadowRadius = 6
        containerView.TAViewHeight = 500
        
        
        //MARK: Assign Values
        authConfigObj.logoImage = imgLogo
        authConfigObj.loginLbl = lblLogin
        authConfigObj.authLbl = lblAuthType
        authConfigObj.passwordLbl = lblPassword
        authConfigObj.enterValidAuthLbl = lblEnterValidEmail
        authConfigObj.enterValidPasswordLBl = lblEnterValidPassword
        authConfigObj.tfView = viewTestfiled
        authConfigObj.firstTextfiled = tfFirst
        authConfigObj.secondTextfiled = tfSecond
        authConfigObj.validBtn = btnValid
        authConfigObj.forgotPasswordBtn = btnForgotPassword
        authConfigObj.emailIcon = emailIcon
        authConfigObj.passwordIcon = passwordIcon
        authConfigObj.eyeIcon = eyeIcon
       // authConfigObj.containerViewShow = containerView
        
        return authConfigObj
    }
    
    //MARK: Set Configurations
    public func setThemWithAuthConfiguration(config:AuthenticationConfiguration){
        
        setThemsForHeaderViewImageORLogo(img: imgLogo, config: config.logoImage)
        
        setThemsForLabel(lbl: lblEmailIcon, config: config.emailIcon)
        
        setThemsForLabel(lbl: lblLogin, config: config.loginLbl)
        
        setThemsForLabel(lbl: lblAuthType, config: config.authLbl)
        
        setThemsForLabel(lbl: lblEnterValidAuth, config: config.enterValidAuthLbl)
        
        setThemsForLabel(lbl: lblPassword, config: config.passwordLbl)
        
        setThemsForLabel(lbl: lblEnterValidePassword, config: config.enterValidPasswordLBl)
        
        setThemsForView(view: viewPassword, config: config.tfView)
        
        setThemsForView(view: viewAuthType, config: config.tfView)
        
        setThemsForTextField(textfiled: tfEmail, config: config.firstTextfiled)
        
        setThemsForTextField(textfiled: tfPassword, config: config.secondTextfiled)
        
        setThemsForButton(btn: btnForgotPassword, config: config.forgotPasswordBtn)
        
        setThemsForButton(btn: btnValidate, config: config.validBtn)
        
        setThemsForLabel(lbl: lblPasswordIcon, config: config.passwordIcon)
        
        setThemsForButton(btn: btnEyeIcon, config: config.eyeIcon)
        
        viewContainerAuth.isHidden = false
    }
    
    //MARK: IBAction
    @IBAction func validateBtnAction(_ sender:UIButton){
        
        if authType == .USERNAME_PASSWORD {
            
            let username = ValidationClass.shared.isUsernameValid(username: tfEmail.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? "")
            let password = ValidationClass.shared.isPasswordValid(password: tfPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? "")
            
            if username.1 == true {
                if password.1 == true {
                    delegate?.sendPinBtnAction(email: tfEmail.text ?? "", password: tfPassword.text ?? "")
                } else {
                    
                    lblEnterValidePassword.isHidden = false
                }
            } else {
                lblEnterValidAuth.isHidden = false
            }
            
        } else {
            // email and password
            
            let email = ValidationClass.shared.isEmailValid(email: tfEmail.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? "")
            let password = ValidationClass.shared.isPasswordValid(password: tfPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? "")
            
            if email.1 == true {
                if password.1 == true {
                    delegate?.sendPinBtnAction(email: tfEmail.text ?? "", password: tfPassword.text ?? "")
                } else {
                    lblEnterValidePassword.isHidden = false
                }
            } else {
                lblEnterValidAuth.isHidden = false
            }
        }
        
        
        
    }
    
    @IBAction func eyeBtnAction(){
        
        if tfPassword.isSecureTextEntry {
            setThemsForFont(FontClass: TAFontIcon.self)
            AddFontIconToButton(btn: btnEyeIcon, titles: TAFontIcon.Icon_eye, color: TAColor.iconColor, size: 20)

        }else{
            setThemsForFont(FontClass: TAFontIcon.self)
            AddFontIconToButton(btn: btnEyeIcon, titles: TAFontIcon.Icon_eye_off, color: TAColor.iconColor, size: 20)

        }
        tfPassword.isSecureTextEntry = !tfPassword.isSecureTextEntry
        
       // let btneyeImg = tfPassword.isSecureTextEntry ? UIImage(named: "\u{e905}") : UIImage(named: "\u{e906}")
          //       btnEyeIcon.setImage(btneyeImg, for: .normal)
          
    }

    @IBAction func forgotPasswordBtnAction(){
        
    }
}

//MARK: UITextFieldDelegate Extension
extension AuthenticationLogIn:UITextFieldDelegate{
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        lblEnterValidAuth.isHidden = true
        lblEnterValidePassword.isHidden = true
        return true
    }
}


