//
//  ViewController.swift
//  UserInformation
//
//  Created by Puja Kumari on 5/19/17.
//  Copyright © 2017 nineleaps. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate,UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var dobTextField: UITextField!
    @IBOutlet weak var sexTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var containerView: UIView!
    
    var dobPickerView:UIDatePicker = UIDatePicker()
    var sexPickerView:UIPickerView!
    var heightPickerView:UIPickerView!
    var weightPickerView:UIPickerView!
    var toolBar: UIToolbar!
    
    var sex :[String]  = ["Male","Female","Other"]
    var height:[String] = ["165Cm","166Cm","167Cm","168Cm","169Cm","170Cm"]
    var weight:[String] = ["57Kg","58Kg","59Kg","60Kg","61Kg","65Kg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.isScrollEnabled = true
        scrollView.isUserInteractionEnabled = true
        sexPickerView = UIPickerView(frame: CGRect(x: 0, y:667-216, width: 375, height: 216))
        sexPickerView.backgroundColor = UIColor.clear
        heightPickerView = UIPickerView(frame: CGRect(x: 0, y:667-216, width: 375, height: 216))
        heightPickerView.backgroundColor = UIColor.clear
        weightPickerView = UIPickerView(frame: CGRect(x: 0, y:667-216, width: 375, height: 216))
        weightPickerView.backgroundColor = UIColor.clear
//        toolBar = UIToolbar()
//        toolBar = UIToolbar(frame: CGRect(x: 0, y: 667-246, width: 375, height:30))
//        toolBar.barStyle = UIBarStyle.default
//        toolBar.backgroundColor = UIColor.clear
//        toolBar.tintColor = UIColor.white
//        toolBar.sizeToFit()
//        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
//        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action:#selector(ViewController.donePicker(sender:)))
//        let nextButton = UIBarButtonItem(title: ">", style: UIBarButtonItemStyle.plain, target: self, action:#selector(ViewController.nextPicker(sender:)))
//        let previousButton = UIBarButtonItem(title: "<", style: UIBarButtonItemStyle.plain, target: self, action:#selector(ViewController.previousPicker(sender:)))
//        toolBar.setItems([spaceButton, doneButton,nextButton,previousButton], animated: false)
//        toolBar.isUserInteractionEnabled = true
      
        sexPickerView.dataSource = self
        sexPickerView.delegate = self
        heightPickerView.delegate = self
        heightPickerView.dataSource = self
        weightPickerView.delegate = self
        weightPickerView.dataSource = self
        setInputFields()
        self.sexTextField.inputView = sexPickerView
        self.heightTextField.inputView = heightPickerView
        self.weightTextField.inputView = weightPickerView
        
      
        
      
        
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        userImageView.layer.cornerRadius = userImageView.frame.size.width / 2
        userImageView.layer.masksToBounds = true
    }
    
    func setInputFields() {
        self.dobTextField.delegate = self
        dobPickerView.datePickerMode = UIDatePickerMode.date
        self.dobTextField.inputView = dobPickerView
        dobPickerView.addTarget(self, action: #selector(ViewController.datePickerValueChanged), for: UIControlEvents.valueChanged)
        self.sexTextField.delegate = self
        self.firstNameTextField.delegate = self
        self.lastNameTextField.delegate = self
        self.firstNameTextField.returnKeyType = UIReturnKeyType.next
        firstNameTextField.tag = 0
        lastNameTextField.tag = 1
        self.heightTextField.delegate = self
        self.weightTextField.delegate = self
        
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if (textField == sexTextField || textField == dobTextField || textField == weightTextField || textField == heightTextField) {
        //self.containerView.addSubview(toolBar)
        }
            
     
    }
    //Picker view delegate & dataSource methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == sexPickerView {
       return sex.count
        } else {
        return height.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       
        if pickerView == sexPickerView {
            return sex[row]
        } else if pickerView == heightPickerView {
            return height[row]
        } else {
            return weight[row]
        }
    
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       
        if pickerView == sexPickerView {
            self.sexTextField.text =  sex[row]
        } else if pickerView == heightPickerView {
        self.heightTextField.text = height[row]
        } else {
           self.weightTextField.text = weight[row]
        }
        
    }
 
    func donePicker(sender:UIBarButtonItem) {
    
        self.sexPickerView.removeFromSuperview()
        self.dobPickerView.removeFromSuperview()
        self.heightPickerView.removeFromSuperview()
        self.weightPickerView.removeFromSuperview()
        //self.toolBar.removeFromSuperview()
    }
    func nextPicker(sender:UIBarButtonItem) {
        if (firstNameTextField.superview?.viewWithTag(firstNameTextField.tag + 1) as? UITextField) != nil {
            
            lastNameTextField.becomeFirstResponder()
            
        } else {
            
            firstNameTextField.resignFirstResponder()
            
        }
        

        //self.toolBar.removeFromSuperview()
    }
    func previousPicker(sender:UIBarButtonItem) {
        if (firstNameTextField.superview?.viewWithTag(firstNameTextField.tag + 1) as? UITextField) != nil {
            
           lastNameTextField.becomeFirstResponder()
            
        } else {
            
            firstNameTextField.resignFirstResponder()
           
            
        }
     
    }
    
    
    
    func datePickerValueChanged(sender:UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.timeStyle = DateFormatter.Style.none
        dobTextField.text = dateFormatter.string(from: sender.date)
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            
            nextField.becomeFirstResponder()
            
        } else {
            
            textField.resignFirstResponder()
            return true
            
        }
        if (textField == firstNameTextField) {
            lastNameTextField.becomeFirstResponder()
            return true
        }
            return false
        
    }
   
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

