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
//	var activeTextfield:Int = 1;
	let PVControl:PVController = PVController(containt: [:])
	
	


	
	func setui(ui: form_page){
	
		newUi=ui
		
		newUi.dropdown.delegate = PVControl;
		newUi.dropdown.dataSource = PVControl
		newUi.dropdown.hidden = true;
		newUi.resultMarque.delegate = self;
		newUi.resultModel.delegate = self;
		newUi.resultYear.delegate = self;
		newUi.resultProvince.delegate = self;
	}
	
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	
	
	
	// si un textfield est cliqué
	// l'api est loadé
	//le bon texte field est identifié grâce au tag
	// selon le cas -> modify le textfield cliqué
	//change le text si nécessaire
	// va modifié le texte du picker view selon l'api
	//va reloader le picker view
	//va afficher le picker view
	// retourn faux pour pas ouvrir le keyboard
	
	var x:String = "";
	var y:String = "";
	
	func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
	
		let Api:ApiResult = ApiResult()
		
		
		
		switch textField.tag {
			case 1:
				PVControl.modifyContaint(textField, containt: Api.getMakers())
				newUi.resultYear.text = "Choisissez une année";
				newUi.resultModel.text = "Choisissez un modèle";
			break
			case 2:
				x = PVControl.getKeybyValue(newUi.resultMarque.text!)
				PVControl.modifyContaint(textField, containt: Api.getModels(x))
				newUi.resultYear.text = "Choisissez une année";
				break
			case 3:
				print(x)
				y = PVControl.getKeybyValue(newUi.resultModel.text!)
				PVControl.modifyContaint(textField, containt: Api.getCars(x, modelid: y))
				
			break
			case 4:
				PVControl.modifyContaint(textField, containt: Api.getProvinces())
			break
			default:
				PVControl.modifyContaint(textField, containt: [:])
			break
		}
		
		
		newUi.dropdown.reloadAllComponents();

		newUi.dropdown.hidden = false
		return false
		
	}
	
	

		
		
}



