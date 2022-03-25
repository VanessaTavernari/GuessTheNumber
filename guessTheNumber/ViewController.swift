//
//  ViewController.swift
//  guessTheNumber
//
//  Created by Vanessa Tavares Tavernari on 15/12/2021.
//

import UIKit

class ViewController: UIViewController {
    
    let chooseTheNumber = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    var pickerView = UIPickerView()
    lazy var guessTheNumber = chooseTheNumber.randomElement()!
   
    @IBOutlet weak var number: UITextField!
    @IBOutlet weak var guess: UIButton!
    @IBAction func buttonClicked(_ sender: Any) {
        if guessTheNumber == number.text {
            guessTheNumber = chooseTheNumber.randomElement()!
            let alert = UIAlertController(title: "🏆", message: "", preferredStyle: UIAlertController.Style.alert)
            
            alert.addAction(UIAlertAction(title: "Start New Game", style: UIAlertAction.Style.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            
            number.text = ""
        } else {
            let alert = UIAlertController(title: "😢", message: "", preferredStyle: UIAlertController.Style.alert)
            
            alert.addAction(UIAlertAction(title: "Play Again", style: UIAlertAction.Style.default, handler: nil))

            self.present(alert, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        number.inputView = pickerView
        guess.isHidden = false
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return chooseTheNumber.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return chooseTheNumber[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        number.text = chooseTheNumber[row]
        number.resignFirstResponder()
    }
}
