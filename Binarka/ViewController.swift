//
//  ViewController.swift
//  Binarka
//
//  Created by Nick on 06/06/2018.
//  Copyright © 2018 Yofa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var decToBinField: UITextField!
    @IBOutlet weak var binToDecField: UITextField!
    @IBOutlet weak var decToBinBtnView: UIButton!
    @IBOutlet weak var binToDecBtnView: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        decToBinBtnView.layer.shadowColor = UIColor.darkGray.cgColor
        decToBinBtnView.layer.shadowRadius = 10
        decToBinBtnView.layer.shadowOpacity = 0.3
        decToBinBtnView.layer.shadowOffset = CGSize(width: 0, height: 10)
        decToBinBtnView.layer.cornerRadius = 5
        
        binToDecBtnView.layer.shadowColor = UIColor.darkGray.cgColor
        binToDecBtnView.layer.shadowRadius = 10
        binToDecBtnView.layer.shadowOpacity = 0.3
        binToDecBtnView.layer.shadowOffset = CGSize(width: 0, height: 10)
        binToDecBtnView.layer.cornerRadius = 5
        
        // Lines below are for dismissing a keyboard after tapping outside
        decToBinField.delegate = self
        binToDecField.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // createAlert(title: "Hello", message: "How are you?")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func createAlert (title:String, message:String){
        let alert = UIAlertController (title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
//        alert.message = UIFont(name: "AmericanTypewriter", size: 14)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }

    @IBAction func decToBinConvert(_ sender: Any) {
        if decToBinField.text!.isEmpty {
            
        }
        else {
            let dec = Int(decToBinField.text!)
            let bin = String(dec!, radix: 2)
            createAlert(title: "\(dec!) in binary is", message: bin)
        }
        
    }
    
    @IBAction func binToDecConvert(_ sender: Any) {
        
        if binToDecField.text!.isEmpty {
            
        }
        else {
            let bin = String(binToDecField.text!)
            let dec = strtoul(bin, nil, 2)
            createAlert(title: "\(bin) in decimal is", message: String(dec))
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        decToBinField.resignFirstResponder()
        binToDecField.resignFirstResponder()
    }
    
}

extension ViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

