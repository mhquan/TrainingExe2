//
//  ViewController.swift
//  TrainingExe2
//
//  Created by Quan on 7/10/17.
//  Copyright © 2017 Quan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtBirthday: UITextField!
    @IBOutlet weak var btnOutletMale: UIButton!
    @IBOutlet weak var btnOutletFemale: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
       
    @IBAction func btnMale(_ sender: Any) {
        btnOutletMale.setImage( UIImage.init(named: "checkbox"), for: .normal)
        btnOutletFemale.setImage( UIImage.init(named: "checkbox 2"), for: .normal)
        let gender = "Nam"
        UserDefaults.standard.set(gender, forKey: "gender")
    }
    
    @IBAction func btnFemale(_ sender: Any) {
        btnOutletMale.setImage( UIImage.init(named: "checkbox 2"), for: .normal)
        btnOutletFemale.setImage( UIImage.init(named: "checkbox"), for: .normal)
        let gender = "Nữ"
        UserDefaults.standard.set(gender, forKey: "gender")
    }

    @IBAction func registerDidPush(_ sender: Any) {
        //MARK: check email
        let result = txtEmail.text?.checkEmail(email: txtEmail.text!)
        if !result! {
            let alert = UIAlertController(title: "Lỗi", message: "Email sai định dạng", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            
            //MARK: check empty string
            if (txtName.text?.isEmpty)! || (txtEmail.text?.isEmpty)! || (txtPhone.text?.isEmpty)! || (txtBirthday.text?.isEmpty)! || ((UserDefaults.standard.object(forKey: "gender") == nil)) {
                let alert = UIAlertController(title: "Lỗi", message: "Chưa nhập đủ đầu vào", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            } else {
                print("Đăng kí thành công")
                print("Tên: " + self.txtName.text!)
                print("Email: " + self.txtEmail.text!)
                print("Điện thoại: " + self.txtPhone.text!)
                print("Ngày sinh:" + self.txtBirthday.text!)
                print("Giới tính:" + (UserDefaults.standard.object(forKey: "gender") as? String ?? "Không xác định"))
                let alert = UIAlertController(title: "Đăng kí thành công", message: "Tên: " + self.txtName.text!  + "\nEmail: " + txtEmail.text! + "\nĐiện thoại: " + self.txtPhone.text! + "\nNgày sinh:" + self.txtBirthday.text! + "\nGiới tính:" + (UserDefaults.standard.object(forKey: "gender") as? String ?? "Không xác định"), preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
                //MARK: reset field
                UserDefaults.standard.removeObject(forKey: "gender")
                self.txtBirthday.text = ""
                self.txtPhone.text = ""
                self.txtEmail.text = ""
                self.txtName.text = ""
                self.btnOutletFemale.setImage( UIImage.init(named: "checkbox 2"), for: .normal)
                self.btnOutletMale.setImage( UIImage.init(named: "checkbox 2"), for: .normal)
            }
        }
    }
}

extension String{
    func checkEmail(email: String) -> Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: email)
        return result
    }
}
