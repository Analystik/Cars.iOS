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
	
	var containt:Array<AnyObject>
	var button:UIButton
	var titleBtn:String = ""
	var titletag:String = ""
	
	init(containt: Array<AnyObject>){
		self.containt = containt
		self.button = UIButton()
	}

	func modifyContaint(button: UIButton, containt: Array<Make>){
		print(containt)

		self.containt = containt

		
		self.button = button
		self.titletag = "Name"
	}
	
	func modifyContaint(button: UIButton,containt: Array<Model>){
		self.containt = containt
		self.button = button
		self.titletag = "Name"

	}
	
	func modifyContaint(button: UIButton,containt: Array<Car>){
		self.containt = containt
		self.button = button
		self.titletag = "Year4Digits"

	}
	
	func modifyContaint(button: UIButton,containt: Array<Province>){
		self.containt = containt
		self.button = button
		self.titletag = "Name"

	}
	
	func getTitle() -> String?{
		return titleBtn;
	}
	
	
	
	// donne le nombre de colonne du pickerview
	func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
		return 1
	}
	
	// donne le nombre de ranger du pickerview
	func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		print(self.containt.count)
		return self.containt.count
	}
	
	//associe les titre au pickerview
	func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
		print("totou")
		print(self.containt[row])
		return self.containt[row].titletag
		
	}
	
	// associe le choix du pickerview au textfield
	// cache le pickerview
	func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
		titleBtn = self.containt[row].titletag
		pickerView.hidden = true;
	}
	
	func showPickerview(pickerView:UIPickerView){
		pickerView.reloadAllComponents();
		pickerView.hidden = false;
	}

	
	
}
