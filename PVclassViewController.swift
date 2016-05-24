//
//  PVclassViewController.swift
//  essentre contre électricité
//
//  Created by Maxime Trudel on 16-05-20.
//  Copyright © 2016 Analystik. All rights reserved.
//

import UIKit





class PVclassViewController: UIViewController, UITextFieldDelegate {

	//@IBOutlet var newdropdown: UIPickerView!
	var newUi:form_page = form_page()
	var activeTextfield:Int = 1;
	let PVControl:PVController = PVController(containt: [])


	
	func setui(ui: form_page){
	
		
		newUi=ui
		
		newUi.dropdown.delegate = PVControl;
		newUi.dropdown.dataSource = PVControl
		newUi.dropdown.hidden = true;
		newUi.resultMarque.delegate = self;
		newUi.resultModel.delegate = self;
		newUi.resultYear.delegate = self;
		newUi.resultProvince.delegate = self;
//		newUi.resultMarque.text = arrayPicker[0];
	}
	
	
	
	
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		
	}



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	
	
	//newUi.view.viewWithTag(activeTextfield) as? UITextField


	
	// lorsque l'on click sur un textefill
	// trouve le textfield cliqué selon le tag
	// selon le tag change l'array et reload le pickerview
	
	//tag 1 = marque
	//tag 2 = model
	//tag 3 = annee
	//tag 4 = province
	
	//ouvre le pickerView
	
	func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
	
		let Api:ApiResult = ApiResult()
		
		switch textField.tag {
			case 1:
				PVControl.modifyContaint(textField, containt: Api.getMakers())
			case 2:
				PVControl.modifyContaint(textField, containt: Api.getModels())
			case 3:
				PVControl.modifyContaint(textField, containt: Api.getCars())
			case 4:
				PVControl.modifyContaint(textField, containt: Api.getProvinces())
			default:
				PVControl.modifyContaint(textField, containt: [])
		}
		
		
		newUi.dropdown.reloadAllComponents();
		newUi.dropdown.hidden = false
		return false
		
	}
	
	

		
		
}



