//
//  ViewController.swift
//  TrainingExe2
//
//  Created by Quan on 7/10/17.
//  Copyright © 2017 Quan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtname: UITextField!
    @IBOutlet weak var txtemail: UITextField!
    @IBOutlet weak var txtphone: UITextField!
    @IBOutlet weak var txtbirthday: UITextField!
    @IBOutlet weak var btnOutletMale: UIButton!
    @IBOutlet weak var btnOutletFemale: UIButton!
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

    @IBAction func Register(_ sender: Any) {
        
//MARK: check email
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: txtemail.text)
        if result == false {
            let alert = UIAlertController(title: "Lỗi", message: "Email sai định dạng", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
//MARK: check empty string
        if (txtname.text?.isEmpty)! || (txtemail.text?.isEmpty)! || (txtphone.text?.isEmpty)! || (txtbirthday.text?.isEmpty)! || ((UserDefaults.standard.object(forKey: "gender") == nil)) {
            let alert = UIAlertController(title: "Lỗi", message: "Chưa nhập đủ đầu vào", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else {
            print("Đăng kí thành công")
            print("Tên: " + txtname.text!)
            print("Email: " + txtemail.text!)
            print("Điện thoại: " + txtphone.text!)
            print("Ngày sinh:" + txtbirthday.text!)
            print("Giới tính:" + (UserDefaults.standard.object(forKey: "gender") as? String ?? "Không xác định"))
            let alert = UIAlertController(title: "Đăng kí thành công", message: "Tên: " + txtname.text!  + "\nEmail: " + txtemail.text! + "\nĐiện thoại: " + txtphone.text! + "\nNgày sinh:" + txtbirthday.text! + "\nGiới tính:" + (UserDefaults.standard.object(forKey: "gender") as? String ?? "Không xác định"), preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
//MARK: reset field
            UserDefaults.standard.removeObject(forKey: "gender")
            txtbirthday.text = ""
            txtphone.text = ""
            txtemail.text = ""
            txtname.text = ""
            btnOutletFemale.setImage( UIImage.init(named: "checkbox 2"), for: .normal)
            btnOutletMale.setImage( UIImage.init(named: "checkbox 2"), for: .normal)
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

