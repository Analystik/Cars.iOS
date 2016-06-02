//  PVController.swift
//  Copyright © 2016 Analystik. All rights reserved.

import Foundation
import UIKit

struct CurrentValue {
	static var marque = 0
	static var model = 0
	static var province = 0
	static var car = 0
}

class mydropdownControl: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {
	let api: ApiResult = ApiResult()
	
	var makes: Array<Make> = []
	var models: Array<Model> = []
	var cars: Array<Car> = []
	var provinces: Array<Province> = []
	
	var containt: Array<AnyObject> = []
	var selectedbutton: UIButton = UIButton()

	func setui(ui: form_page){
		ui.dropdown.delegate = self;
		ui.dropdown.dataSource = self;
		ui.dropdown.hidden = true;

		
		makes = api.getMakes()
		provinces = api.getProvinces()
	}
	
	func modifyContaintMakes(button: UIButton, containt: Array<Make>) {
		self.containt = containt
		self.selectedbutton = button
	}
	
	func modifyContaintModels(button: UIButton,containt: Array<Model>) {
		self.containt = containt
		self.selectedbutton = button
	}
	
	func modifyContaintCars(button: UIButton,containt: Array<Car>) {
		self.containt = containt
		self.selectedbutton = button
	}
	
	func modifyContaintProvinces(button: UIButton,containt: Array<Province>) {
		self.containt = containt
		self.selectedbutton = button
	}
	
	// Reload les valeurs et affiche le pickerview
	func showPickerview(pickerView:UIPickerView) {
		pickerView.reloadAllComponents();
		pickerView.hidden = false;
	}

	//*** Tout ce qui suit est demandé par les interfaces UIPickerViewDelegate, UIPickerViewDataSource ***//
	
	// Donne le nombre de colonne du pickerview
	func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
		return 1
	}
	
	// Donne le nombre de rows du pickerview
	func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return containt.count
	}
	
	// Associe les titres au pickerview
	func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		let value = containt[row] as! HasTitle
		return value.title()
	}
	
	// Associe le choix du pickerview au boutton
	func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		let value = containt[row] as! HasTitle
		
		if selectedbutton.tag == 1 {
			CurrentValue.marque = value.id
			models = api.getModels(CurrentValue.marque)
		
		} else if selectedbutton.tag == 2 {
			CurrentValue.model = value.id
			cars = api.getCars(CurrentValue.marque, modelId: CurrentValue.model)
		
		} else if selectedbutton.tag == 3 {
			CurrentValue.car = value.id
		
		} else if selectedbutton.tag ==  4 {
			CurrentValue.province = value.id
		}
		
		selectedbutton.setTitle(value.title(), forState: UIControlState.Normal)
		pickerView.hidden = true

	}
}