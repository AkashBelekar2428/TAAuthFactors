//
//  EmailView.swift
//  Reusable
//
//  Created by Akash Belekar on 27/04/23.
//

import UIKit

//MARK: Protocol EmailAddressDelegate
public protocol EmailAddressDelegate{
    func sendPINBtnAction(email:String)
}

//MARK: Email_Address Class
public class Email_Address: UIView{
    
    //MARK: Outlets
    @IBOutlet weak public var viewContainerEmail:UIView!
    @IBOutlet weak public var imgLogo:UIImageView!
    @IBOutlet weak public var lblLogin:UILabel!
    @IBOutlet weak public var lblEmail:UILabel!
    @IBOutlet weak public var viewTfEmail:UIView!
    @IBOutlet weak public var lblEmailIcon:UILabel!
    @IBOutlet weak public var tfEmail:UITextField!
    @IBOutlet weak public var lblEnterValideEmail:UILabel!
    @IBOutlet weak public var btnValid:UIButton!
    @IBOutlet weak public var viewContainerHeight: NSLayoutConstraint!
    @IBOutlet weak public var lblEnterValidEmailHeight:NSLayoutConstraint!

    //MARK: Variables
    let nibName = "Email_Address"
    public var pinViewIns = PINView()
    public var delegate:EmailAddressDelegate?
    public var emailConfig = AuthenticationConfiguration()
    lazy var  alert = AlertManager()
    public weak var controller: UIViewController?
    
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
    func commonInit() {
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        tfEmail.delegate = self
        self.addSubview(view)
    }
    
    func loadViewFromNib() -> UIView?{
        let bundel = Bundle(for: Email_Address.self)
        let nib = bundel.loadNibNamed(nibName, owner: self)?.first as? UIView
        return nib
    }
        
    //MARK: SetDefaultThems
    public func setEmailDefaultThemes(){
        let configObj = themsConfiguration()
        self.setThemeWithEmailConfiguration(config: configObj)
    }
    
    //MARK: Configure DefaultThems
    func themsConfiguration() -> AuthenticationConfiguration{
        let config = AuthenticationConfiguration()
        let containerView = TAUIView()
        let imgLogo = TAImage()
        let lblLogin = TALable()
        let lblEmail = TALable()
        let tfView = TAUIView()
        let textField = TATextFiled()
        let lblEnterEmailValid = TALable()
        let btnValid = TAButton()
        let emailIcon = TALable()
       
   
        //MARK: ContainerView
        containerView.TAViewCornerRadius = 10
        containerView.TAViewShadowColor = TAColor.shadowColor
        containerView.TAViewShadowOpacity = 0.4
        containerView.TAViewShadowOffset = CGSize(width: 2.0, height: 2.0)
        containerView.TAViewShadowRadius = 6
        containerView.TAViewHeight = 350
        
        //MARK: Configuration for Image Logo
        if let image = UIImage(named: "logo",in: Bundle(for:TAAssetsImage.self ),compatibleWith: nil){
            imgLogo.TAImageLogo = image
        }

        //MARK: Configuration for Login
        setThemsForFontLabel(FontClass: TAFontIcon.self, Font: "Poppins-Bold")
        lblLogin.TAText = "Login"
        lblLogin.TATextColor = TAColor.textLblColor
        lblLogin.TATextAlignment = .left
        lblLogin.TATextFont = TAFontIcon.TAFontBold
        
        //MARK: Configuration for text
        setThemsForFontLabel(FontClass: TAFontIcon.self, Font: "Poppins-Medium")
        lblEmail.TAText = "Email"
        lblEmail.TATextColor = TAColor.textLblColor
        lblEmail.TATextAlignment = .left
        lblEmail.TATextFont = TAFontIcon.TAFontMedium
        
        //MARK: Configuration for Textfield View
        tfView.TAViewCornerRadius = 5
        tfView.TAViewborderWidth = 1
        tfView.TAViewBorderColor = TAColor.placeholderText_borderColor
        
        //MARK: Configuration for Email Icon
        emailIcon.TAText = TAFontIcon.Icon_mail
        emailIcon.TATextColor = TAFontIcon.TATextColor
        emailIcon.TATextFont = UIFont(name: "authentication_font_file", size: 20)!
        
        
        //MARK: Configuration for Textfiled
        setThemsForFontLabel(FontClass: TAFontIcon.self, Font: "Poppins-Medium")
        textField.TATextfiledPlaceHolderText = "abc@yourdomain.com"
        textField.TATextfiledPlaceHolderTextColor = TAColor.textLblColor
        textField.TATextfiledPlaceHolderTextFont = TAFontIcon.TAFontMedium
        
        //MARK: Configuration for Enter Valid Email
        setThemsForFontLabel(FontClass: TAFontIcon.self, Font: "Poppins-Regular")
        lblEnterEmailValid.TAText = ""
        lblEnterEmailValid.TATextColor = TAColor.validAuthColor
        lblEnterEmailValid.TATextAlignment = .left
        lblEnterEmailValid.TATextFont = TAFontIcon.TAFontRegularErrMsg
        
        //MARK: Configuration for valide Button
        setThemsForFontLabel(FontClass: TAFontIcon.self, Font: "Poppins-Medium")
        btnValid.TABtnTitleText = "Validate"
        btnValid.TABtnTitleTextColor = TAColor.buttonTextColor
        btnValid.TABtnBackgrounColor = TAColor.buttonBackgroundColor
        btnValid.TABtnTitleTextFont = TAFontIcon.TAFontMedium
        btnValid.TABtnCornerRadius = 5
        btnValid.TABtnMasksToBounds =  true
        
        //MARK: Assign Values
        config.containerViewShow = containerView
        config.logoImage = imgLogo
        config.loginLbl = lblLogin
        config.emailLbl = lblEmail
        config.tfView = tfView
        config.firstTextfiled = textField
        config.enterValidEmail = lblEnterEmailValid
        config.validBtn = btnValid
        config.emailIcon = emailIcon
    
        return config
    }
    
    //MARK: Set Configurations
    public func setThemeWithEmailConfiguration(config:AuthenticationConfiguration){
                
        setThemsForView(view: viewTfEmail, config: config.tfView)
        
        setThemsForHeaderViewImageORLogo(img: imgLogo, config: config.logoImage)
        
        setThemsForLabel(lbl: lblLogin, config: config.loginLbl)
        
        setThemsForLabel(lbl: lblEmail, config: config.emailLbl)
                
        setThemsForTextField(textfiled: tfEmail, config: config.firstTextfiled)
        
        setThemsForLabel(lbl: lblEnterValideEmail, config: config.enterValidEmail)
        
        setThemsForButton(btn: btnValid, config: config.validBtn)
        
        setThemsForLabel(lbl: lblEmailIcon, config: config.emailIcon)
    }
    
    //MARK: IBAction
    @IBAction func validBtnACtion(_ sender:UIButton){
 
        let emailValid = self.tfEmail.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let email = ValidationClass.shared.isEmailValid(email: emailValid)
        
        if email.1 == false{
            lblEnterValideEmail.text = email.0
        }else {
            lblEnterValideEmail.text = ""
            delegate?.sendPINBtnAction(email: tfEmail.text ?? "")
        }
    }
}

//MARK: UITextFieldDelegate Extension
extension Email_Address:UITextFieldDelegate{
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
}




