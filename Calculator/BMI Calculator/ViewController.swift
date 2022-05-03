//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Rahul Shukla on 5/3/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var lblBMIOutput: UILabel!
    @IBOutlet weak var txtWeight: UITextField!
    @IBOutlet weak var txtInches: UITextField!
    
    @IBOutlet weak var txtHeight: UITextField!
    
    var toggle : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func actionToggle(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0{
            txtHeight.placeholder = "feet"
            txtWeight.placeholder = "lbs"
            txtInches.isHidden = false
            toggle = 0
            }
        
        if sender.selectedSegmentIndex == 1{
            txtHeight.placeholder = "cm"
            txtWeight.placeholder = "kg"
            txtInches.isHidden = true
            toggle = 1
        }
        
        
    }
    
    @IBAction func actionCalculate(_ sender: Any) {
        
        let h = (txtHeight.text! as NSString) .doubleValue
        let w = (txtWeight.text! as NSString) .doubleValue
        var bmi : Double = 0.0
        if toggle == 0 {
            let i = (txtInches.text! as NSString) .doubleValue
            let newHeight = (h * 12) + i
            bmi = (w / pow(newHeight, 2)) * 703
            
        }else if toggle == 1 {
            bmi = (w / pow(h, 2)) * 10000
            
        }
        if bmi < 18.5 {
            lblBMIOutput.text = "Your BMI is:  \(String(format: "%.2f", bmi)) and you are Underweight"
        }else  if bmi < 24.9 {
            lblBMIOutput.text = "Your BMI is: \(String(format: "%.2f", bmi)) and you are Healthy weight"
        }else  if bmi < 29.9 {
            lblBMIOutput.text = "Your BMI is: \(String(format: "%.2f", bmi)) and you are Overweight"
        }else {
            lblBMIOutput.text = "Your BMI is:  \(String(format: "%.2f", bmi)) and you are Obese"
        }
       
    }
}

