//
//  PVclassViewController.swift
//  essentre contre électricité
//
//  Created by Maxime Trudel on 16-05-20.
//  Copyright © 2016 Analystik. All rights reserved.
//

import UIKit

class PVclassViewController: UIViewController {
	

	


	
	
	
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
	
	
	
	
/*	func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
		
		
		
		switch textField.tag {
			case 1:
				PVControl.modifyContaint(textField, containt: dictMarque)
				newUi.resultYear.text = "Choisissez une année";
				newUi.resultModel.text = "Choisissez un modèle";
			break
			case 2:
				marqueID = PVControl.getKeyByValue(newUi.resultMarque.text!)
				dictModel = Api.getModels(marqueID)
				PVControl.modifyContaint(textField, containt: dictModel)
				newUi.resultYear.text = "Choisissez une année";
				break
			case 3:
				modelID = PVControl.getKeyByValue(newUi.resultModel.text!)
				dictYear = Api.getCars(marqueID, modelid: modelID)
				PVControl.modifyContaint(textField, containt: dictYear)
				
			break
			case 4:
				PVControl.modifyContaint(textField, containt: dictPro)
			break
			default:
				PVControl.modifyContaint(textField, containt: [:])
			break
		}

		newUi.dropdown.reloadAllComponents();

		newUi.dropdown.hidden = false
		return false
		
	}
	*/
	

		
		
}



