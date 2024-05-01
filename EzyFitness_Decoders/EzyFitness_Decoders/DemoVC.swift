//
//  DemoVC.swift
//  EzyFitness_Decoders
//
//  Created by student on 01/05/24.
//

import UIKit

class DemoVC: UIViewController {
    
    @IBOutlet weak var Picker: UIPickerView!
    
    let choices = ["Everyday","Every Other Day","Weekly","Bi-Weekly"]
    override func viewDidLoad() {
        super.viewDidLoad()
        Picker.delegate = self
        Picker.dataSource = self

        // Do any additional setup after loading the view.
    }
    
}
extension DemoVC:UIPickerViewDelegate,UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return choices.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return choices[row]
    }
}
