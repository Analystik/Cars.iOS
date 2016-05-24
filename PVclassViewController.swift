//
//  PVclassViewController.swift
//  essentre contre électricité
//
//  Created by Maxime Trudel on 16-05-20.
//  Copyright © 2016 Analystik. All rights reserved.
//

import UIKit

class PVclassViewController: UIViewController, UIPickerViewDataSource,UIPickerViewDelegate, UITextFieldDelegate {

	//@IBOutlet var newdropdown: UIPickerView!
	var newUi:form_page = form_page()
	var arrayPicker:Array = ["Ford", "Mercedes", "Nissan", "GM"];
	var activeTextfield:Int = 1;

	
func setui(ui: form_page){
		
		newUi=ui
		
		newUi.dropdown.delegate = self;
		newUi.dropdown.dataSource = self;
		newUi.dropdown.hidden = true;
		newUi.resultMarque.delegate = self;
		newUi.resultModel.delegate = self;
		newUi.resultYear.delegate = self;
		newUi.resultProvince.delegate = self;
		newUi.resultMarque.text = arrayPicker[0];
	}
	
	
	
	
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		
	}



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	
	
	// donne le nombre de colonne du pickerview
	func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
		return 1
	}
	
	
	// donne le nombre de ranger du pickerview
	func pickerView(pickerView: UIPickerView,numberOfRowsInComponent: Int) -> Int{
		return arrayPicker.count
	}
	
	//associe les titre au pickerview
	func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
		return arrayPicker[row]
		
	}

	// associe le choix du pickerview au textfield
	// cache le pickerview
	func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
		let curtfield = newUi.view.viewWithTag(activeTextfield) as? UITextField
		curtfield!.text = arrayPicker[row]
		newUi.dropdown.hidden = true;
	}
	
	
	// lorsque l'on click sur un textefill
	// trouve le textfield cliqué selon le tag
	// selon le tag change l'array et reload le pickerview
	
	//tag 1 = marque
	//tag 2 = model
	//tag 3 = annee
	//tag 4 = province
	
	//ouvre le pickerView
	
	func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
		activeTextfield = textField.tag;
		
		if activeTextfield == 1{
			arrayPicker.removeAll();
			arrayPicker = []
			newUi.dropdown.reloadAllComponents();
		}
		else if activeTextfield == 2{
			arrayPicker.removeAll();
			arrayPicker = []
			newUi.dropdown.reloadAllComponents();
		}
		else if activeTextfield == 3{
			arrayPicker.removeAll();
			arrayPicker = []
			newUi.dropdown.reloadAllComponents();
		}
		else if activeTextfield == 4{
			arrayPicker.removeAll();
			arrayPicker = []
			newUi.dropdown.reloadAllComponents();
		}
		
		newUi.dropdown.hidden = false
		return false
		
	}
	
	

		
		
}



