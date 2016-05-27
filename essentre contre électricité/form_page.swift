//
//  form_page.swift
//  essentre contre électricité
//
//  Created by Maxime Trudel on 16-05-18.
//  Copyright © 2016 Analystik. All rights reserved.
//

import UIKit

class form_page: UIViewController  {
	
	var currentKM = 10000
	
	
	// gestion du data
//	var api: ApiResult!
	var pvcontrol:mydropdownControl = mydropdownControl(containt:Array<Make>())

	
	// tout des éléments du storyboard

	@IBOutlet var btnMarque: UIButton!
	@IBAction func btnMarqueClick(sender: UIButton) {
		// data a mettre dans le pickerview
		pvcontrol.modifyContaint(btnMarque, containt: pvcontrol.arrtMarque)
		
//action du pickerview
		pvcontrol.showPickerview(dropdown)
		btnModele.setTitle("Choisir un modèle", forState: UIControlState.Normal)
		btnYear.setTitle("Choisir une année", forState: UIControlState.Normal)

		
	}
	
	@IBOutlet var btnModele: UIButton!
	@IBAction func btnModeleClick(sender: UIButton) {
	
		pvcontrol.modifyContaintModel(btnModele, containt: pvcontrol.arrtModel)
		pvcontrol.showPickerview(dropdown)
		btnYear.setTitle("Choisir une année", forState: UIControlState.Normal)

	
	}
	
	
	@IBOutlet var btnYear: UIButton!
	@IBAction func btnYearClick(sender: UIButton) {
		pvcontrol.modifyContaintCars(btnYear, containt: pvcontrol.arrtYear)
		pvcontrol.showPickerview(dropdown)

		
	}
	
	@IBOutlet var btnProvince: UIButton!
	@IBAction func btnProvinceClick(sender: UIButton!) {
		
		pvcontrol.modifyContaintProvince(btnProvince, containt: pvcontrol.arrtProvince)
		pvcontrol.showPickerview(dropdown)

		
	}
	
	
	
	
	@IBOutlet var dropdown: UIPickerView!
	@IBOutlet var resultKmYear: UILabel!
	@IBOutlet var SliderKmYear: UISlider!
	
	
	@IBOutlet var button: UIButton!
	
	
	// fonction du slider
		// obtient la valeur du slider
		// associe la valeur au label
		// affiche le bouton
		// fin de la frame
	
	@IBAction func sliderValuechanged(sender: UISlider) {
		currentKM  = Int(sender.value);
		resultKmYear.text = "\(currentKM)"+"km";
		
		
		
		
		
	if btnMarque.currentTitle != "Choisir une marque" && btnModele.currentTitle != "Choisir un modèle" && btnYear.currentTitle != "Choisir une année" && btnProvince.currentTitle != "Choisir"
		{
		button.hidden = false
		}
		
		
	}
	

	
    override func viewDidLoad() {
        super.viewDidLoad()
		pvcontrol.setui(self)
		
		
	
	
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	
	
		
}
