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
	
	var containt:Dictionary<String, String>
	var textbox:UITextField
	
	init(containt: Dictionary<String, String>){
		self.containt = containt
		self.textbox = UITextField()
	}
	
	func getValuebykey(key:String) -> String {
		let index = self.containt.indexForKey(key)
		return self.containt.values[index!]
	}
	
	func getKeybyValue(value:String) -> String {
		
		for (k, v) in self.containt {
			if v == value {
				return k
			}
		}
		return "not found"
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
		var arrayforTitle:[String]{
			get{
				return Array(self.containt.values)
			}
		}
		return  arrayforTitle[row]
		
	}
	
	func modifyContaint(textbox: UITextField,containt: Dictionary<String, String>){
			//self.containt.removeAll();
			print(self.containt);
			self.containt = containt
			self.textbox = textbox

	}
	
	// associe le choix du pickerview au textfield
	// cache le pickerview
	func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
		var arrayforTitle:[String]{
			get{
				return Array(self.containt.values)
			}
			
		}
		self.textbox.text = arrayforTitle[row]
		
		pickerView.hidden = true;
	}

	
	
}
