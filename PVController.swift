//
//  PVController.swift
//  essentre contre électricité
//
//  Created by Maxime Trudel on 16-05-24.
//  Copyright © 2016 Analystik. All rights reserved.
//

import Foundation
import UIKit

class PVController: NSObject, UIPickerViewDelegate, UIPickerViewDataSource{
	
	var containt:Array<String>
	var textbox:UITextField
	
	init(containt: Array<String>){
		self.containt = containt
		self.textbox = UITextField()
	}
	
	
	// donne le nombre de colonne du pickerview
	func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
		return 1
	}
	
	
	// donne le nombre de ranger du pickerview
	func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return self.containt.count
	}
	
	//associe les titre au pickerview
	func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
		return  self.containt[row]
		
	}
	
	func modifyContaint(textbox: UITextField,containt: Array<String>){
			//self.containt.removeAll();
			self.containt = containt
			self.textbox = textbox

	}
	
	// associe le choix du pickerview au textfield
	// cache le pickerview
	func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
		self.textbox.text = self.containt[row]
		pickerView.hidden = true;
		print("entrer")
	}

	
	
}
