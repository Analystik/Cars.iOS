//
//  PVController.swift 
//  essentre contre électricité
//
//  Created by Maxime Trudel on 16-05-24.
//  Copyright © 2016 Analystik. All rights reserved.
//

import Foundation
import UIKit

class mydropdownControl: NSObject, UIPickerViewDelegate, UIPickerViewDataSource{
	
	var arrtMarque:Array<Make> = []
	var arrtModel:Array<Model> = []
	var arrtYear:Array<Car> = []
	var arrtProvince:Array<Province> = []
	
	var currentMarque = 0
	var currentModel = 0
	var currentProvince = 0
	var currentkm = 0
	var currentCar = 0
	

	let Api:ApiResult = ApiResult()
	

	
	func setui(ui: form_page){
		
		let newUi = ui
		
		newUi.dropdown.delegate = self;
		newUi.dropdown.dataSource = self;
		newUi.dropdown.hidden = true;
		currentkm = newUi.currentKM
		
		arrtMarque = Api.getMakers()
		arrtProvince = Api.getProvinces()
	}

	
	var containt:Array<AnyObject>
	var button:UIButton
	var titleBtn:String = ""
	
	init(containt: Array<Make>){
		self.containt = containt
		self.button = UIButton()
	}

	init(containt: Array<Model>){
		self.containt = containt
		self.button = UIButton()
	}

	
	func modifyContaint(button: UIButton, containt: Array<Make>){
		self.containt = containt
		self.button = button
	}
	
	func modifyContaintModel(button: UIButton,containt: Array<Model>){
		self.containt = containt
		self.button = button

	}
	
	func modifyContaintCars(button: UIButton,containt: Array<Car>){
		self.containt = containt
		self.button = button

	}
	
	func modifyContaintProvince(button: UIButton,containt: Array<Province>){
		self.containt = containt
		self.button = button
		

	}
	
	
	
	// donne le nombre de colonne du pickerview
	func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
		return 1
	}
	
	// donne le nombre de ranger du pickerview
	func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return containt.count
	}
	
	//associe les titre au pickerview
	func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
		let x = containt[row] as! HasTitle
		return x.title()
	}
	
	// associe le choix du pickerview au textfield
	// cache le pickerview
	func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
		let x = containt[row] as! HasTitle
		if button.currentTitle == "Choisir une marque"{
		currentMarque = x.Id
		arrtModel = Api.getModels(currentMarque)
		}else if button.currentTitle == "Choisir un modèle"{
		currentModel = x.Id
		arrtYear = Api.getCars(currentMarque, modelid: currentModel)
		}
		else if button.currentTitle == "Choisir une province"{
		currentProvince = x.Id
		}
		else if button.currentTitle == "Choisir une année"{
			currentCar = x.Id
		}
		
		button.setTitle(x.title(), forState: UIControlState.Normal)
		pickerView.hidden = true
	}
	
	func showPickerview(pickerView:UIPickerView){
		pickerView.reloadAllComponents();
		pickerView.hidden = false;
	}
	
	
	
	
}
