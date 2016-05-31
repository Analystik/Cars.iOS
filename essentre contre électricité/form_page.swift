//  form_page.swift
//  Copyright © 2016 Analystik. All rights reserved.

import UIKit

struct KmCurrent {
	static var km = 0
}

class form_page: UIViewController {
	var api: ApiResult!
	var dropdownControl: mydropdownControl = mydropdownControl()
	
	@IBOutlet var btnMarque: UIButton!
	@IBOutlet var btnModele: UIButton!
	@IBOutlet var btnYear: UIButton!
	@IBOutlet var btnProvince: UIButton!
	@IBOutlet var SliderKmYear: UISlider!
	@IBOutlet var resultKmYear: UILabel!
	@IBOutlet var dropdown: UIPickerView!
	@IBOutlet var button: UIButton!
	
	@IBAction func btnMarqueClick(sender: UIButton) {
		dropdownControl.modifyContaintMakes(btnMarque, containt: dropdownControl.makes)
		dropdownControl.showPickerview(dropdown)
		btnModele.setTitle("Choisir un modèle", forState: UIControlState.Normal)
		btnYear.setTitle("Choisir une année", forState: UIControlState.Normal)
	}
	
	@IBAction func btnModeleClick(sender: UIButton) {
		dropdownControl.modifyContaintModels(btnModele, containt: dropdownControl.models)
		dropdownControl.showPickerview(dropdown)
		btnYear.setTitle("Choisir une année", forState: UIControlState.Normal)
	}
	
	@IBAction func btnYearClick(sender: UIButton) {
		dropdownControl.modifyContaintCars(btnYear, containt: dropdownControl.cars)
		dropdownControl.showPickerview(dropdown)
	}
	
	@IBAction func btnProvinceClick(sender: UIButton!) {
		dropdownControl.modifyContaintProvinces(btnProvince, containt: dropdownControl.provinces)
		dropdownControl.showPickerview(dropdown)
	}
	
	@IBAction func sliderValuechanged(sender: UISlider) {
		KmCurrent.km = Int(sender.value);
		resultKmYear.text = "\(KmCurrent.km)"+"km";
		
		if needToHide() {
			button.hidden = false
		}
	}
	
	func needToHide() -> Bool {
		return btnMarque.currentTitle != "Choisir une marque"
			&& btnModele.currentTitle != "Choisir un modèle"
			&& btnYear.currentTitle != "Choisir une année"
			&& btnProvince.currentTitle != "Choisir une province"
	}

	override func viewDidLoad() {
        super.viewDidLoad()
		dropdownControl.setui(self)
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
	}
}
