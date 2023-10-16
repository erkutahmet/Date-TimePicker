//
//  ViewController.swift
//  Date&TimePicker
//
//  Created by Ahmet Erkut on 16.10.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var hourTextField: UITextField!
    
    var datePicker: UIDatePicker?
    var hourPicker: UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        dateTextField.inputView = datePicker
        
        hourPicker = UIDatePicker()
        hourPicker?.datePickerMode = .time
        hourTextField.inputView = hourPicker
        
        if #available(iOS 13.4, *) {
            datePicker?.preferredDatePickerStyle = .wheels
            hourPicker?.preferredDatePickerStyle = .wheels
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureMethod))
        view.addGestureRecognizer(tapGesture)
        
        datePicker?.addTarget(self, action: #selector(showDate(datePicker:)), for: .valueChanged)
        hourPicker?.addTarget(self, action: #selector(showHour(hourPicker:)), for: .valueChanged)
    }
    
    @objc func tapGestureMethod() {
        print("Touched screen.")
        view.endEditing(true)
    }
    
    @objc func showDate(datePicker: UIDatePicker) {
        let format = DateFormatter()
        format.dateFormat = "MM/dd/yyyy"
        let gotDate = format.string(from: datePicker.date)
        dateTextField.text = gotDate
    }
    
    @objc func showHour(hourPicker: UIDatePicker) {
        let format = DateFormatter()
        format.dateFormat = "HH:mm"
        let gotDate = format.string(from: hourPicker.date)
        hourTextField.text = gotDate
    }
}

