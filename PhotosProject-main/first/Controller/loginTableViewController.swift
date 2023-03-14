//
//  loginTableViewController.swift
//  first
//
//  Created by Sanjay, Vaishnavi on 16/02/23.
//

import UIKit

class loginTableViewController: UITableViewController {
    
    
    @IBOutlet weak var txtEmail: UITextField!
    
    
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dismissKeyboard()
        
    }
    
   
    
    @IBAction func btnLoginClicked(_ sender: UIButton) {
     

        
        
        ValidationCode()
    }
    
   
    @IBAction func home(_ sender: UIButton) {
        if let home = self.storyboard?.instantiateViewController(identifier: "ListViewController") as? ListViewController{
            self.navigationController?.pushViewController(home, animated: true)
        }
    }
    
    

}
extension loginTableViewController{
    fileprivate func ValidationCode() {
        if let email = txtEmail.text,
           let password = txtPassword.text{
            if email == "" {
                
            }else{
                
            }
            if !email.validateEmailId(){
                openAlert(title: "Alert", message: "Email address not found", alertStyle: .alert, actionTitles: ["Okay"], actionStyles:[.default] , actions: [{ _ in
                    print ("Okey clicked!")
                }])
            }else if !password.validatePassword(){
                
               
                
                openAlert(title: "Alert", message: "Please enter valid password", alertStyle: .alert, actionTitles: ["Okey"], actionStyles:[.default] , actions: [{ _ in
                    print ("Okey clicked!")
                }])
            }else{
            }
            
        }else{
            openAlert(title: "Alert", message: "Please add Detail.", alertStyle: .alert, actionTitles: ["Okay"], actionStyles:[.default] , actions: [{ _ in
                print ("Okay clicked!")
            }])
        }
    }
}























