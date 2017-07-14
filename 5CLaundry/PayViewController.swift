//
//  PayViewController.swift
//  5CLaundry
//
//  Created by Ethan Hardacre on 7/10/17.
//  Copyright © 2017 5CLaundry. All rights reserved.
//

import UIKit
import Stripe
import CreditCardForm
import Alamofire
import NVActivityIndicatorView

class PayViewController: UIViewController , STPPaymentCardTextFieldDelegate{
    
    var amountToPay = "0"
    var labelText = ""
    let paymentTextField = STPPaymentCardTextField()
    var showPayAsYouGo = true
    
    @IBOutlet weak var payAsYouGoLabel: UILabel!
    @IBOutlet weak var creditCardForm: CreditCardFormView!
    @IBOutlet weak var payLabel: UILabel!
    @IBOutlet weak var purchaseButton: UIButton!
    
    @IBAction func purchaseAction(_ sender: Any) {
        let card = paymentTextField.cardParams
        STPAPIClient.shared().createToken(withCard: card, completion: {(token, error) -> Void in
            if let error = error {
                print(error)
            }
            else if let token = token {
                print(token)
                self.chargeUsingToken(token: token)
            }
        })
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.]\
        
        payAsYouGoLabel.isHidden = !showPayAsYouGo
        
        purchaseButton.layer.cornerRadius = purchaseButton.frame.height / 2
        payLabel.text = labelText
        
        paymentTextField.frame = CGRect(x: 15, y: 199, width: self.view.frame.size.width - 30, height: 44)
        paymentTextField.translatesAutoresizingMaskIntoConstraints = false
        paymentTextField.borderWidth = 0
        
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.darkGray.cgColor
        border.frame = CGRect(x: 0, y: paymentTextField.frame.size.height - width, width:  paymentTextField.frame.size.width, height: paymentTextField.frame.size.height)
        border.borderWidth = width
        paymentTextField.layer.addSublayer(border)
        paymentTextField.layer.masksToBounds = true
        
        view.addSubview(paymentTextField)
        
        NSLayoutConstraint.activate([
            paymentTextField.topAnchor.constraint(equalTo: creditCardForm.bottomAnchor, constant: 20),
            paymentTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            paymentTextField.widthAnchor.constraint(equalToConstant: self.view.frame.size.width-20),
            paymentTextField.heightAnchor.constraint(equalToConstant: 44)
            ])
        
        paymentTextField.delegate = self
        self.purchaseButton.isHidden = true
    }
    
    func paymentCardTextFieldDidChange(_ textField: STPPaymentCardTextField) {
        creditCardForm.paymentCardTextFieldDidChange(cardNumber: textField.cardNumber, expirationYear: textField.expirationYear, expirationMonth: textField.expirationYear, cvc: textField.cvc)
        if textField.valid {
            purchaseButton.isHidden = false;
        }
    }
    
    func paymentCardTextFieldDidEndEditingExpiration(_ textField: STPPaymentCardTextField) {
        creditCardForm.paymentCardTextFieldDidEndEditingExpiration(expirationYear: textField.expirationYear)
    }
    
    func paymentCardTextFieldDidBeginEditingCVC(_ textField: STPPaymentCardTextField) {
        creditCardForm.paymentCardTextFieldDidBeginEditingCVC()
    }
    
    func paymentCardTextFieldDidEndEditingCVC(_ textField: STPPaymentCardTextField) {
        creditCardForm.paymentCardTextFieldDidEndEditingCVC()
    }
    
    func chargeUsingToken(token: STPToken){
        let requestString = "https://shrouded-waters-57874.herokuapp.com/charge.php"
        let params = ["stripeToken": token.tokenId, "amount": amountToPay, "currency": "usd", "description": "testRun"]
        
        let frame = CGRect(x: 149.0, y: 244.0, width: 75.0, height: 75.0)
        
        let loadingView = NVActivityIndicatorView(frame: frame, type: NVActivityIndicatorType.ballClipRotateMultiple, color: UIColor.white, padding: nil)
        
        loadingView.startAnimating()
        self.view.addSubview(loadingView)
        
        Alamofire.request(requestString , method: .post , parameters: params).responseJSON { response in
            print(response.request)
            print(response.response)
            print(response.data)
            print(response.result)
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
            self.dismiss(animated: true, completion: nil)
            self.view.willRemoveSubview(loadingView)
        }
        
        
    }
    
}
