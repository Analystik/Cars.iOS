//
//  form_page.swift
//  essentre contre électricité
//
//  Created by Maxime Trudel on 16-05-18.
//  Copyright © 2016 Analystik. All rights reserved.
//

import UIKit

class form_page: UIViewController  {
	
	var gestionUIclass: PVclassViewController!
	// gestion du data
	var api: ApiResult!
	var pvcontrol:mydropdownControl = mydropdownControl(containt:Array<AnyObject>())


	
	// tout des éléments du storyboard

	@IBOutlet var btnMarque: UIButton!
	@IBAction func btnMarqueClick(sender: UIButton) {
		
		pvcontrol.modifyContaint(btnMarque, containt: gestionUIclass.arrtMarque)
		pvcontrol.showPickerview(dropdown)
		btnMarque.setTitle(pvcontrol.getTitle(), forState: UIControlState.Normal)
		btnModele.setTitle("Choisir un modèle", forState: UIControlState.Normal)
		btnYear.setTitle("Choisir une année", forState: UIControlState.Normal)

		
	}
	
	@IBOutlet var btnModele: UIButton!
	
	@IBAction func btnModeleClick(sender: UIButton) {
	}
	
	
	@IBOutlet var btnYear: UIButton!
	@IBAction func btnYearClick(sender: UIButton) {
		
	}
	
	@IBOutlet var btnProvince: UIButton!
	@IBAction func btnProvinceClick(sender: UIButton!) {
		
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
		let currentValue = Int(sender.value);
		resultKmYear.text = "\(currentValue)"+"km";
		
		
	//	resultMarque.setTitle("Test", forState: UIControlState.Normal  )
		
		
		
		
//		if btnMarque.curent != "Choisissez une marque" && btnModel.text != "Choisissez un modèle" && btnYear.text != "Choisissez une année" && btnProvince.text != "Choisissez votre province"
//		{
//		button.hidden = false
//		}
		
		
	}
	

	
    override func viewDidLoad() {
        super.viewDidLoad()
		gestionUIclass = PVclassViewController()
		gestionUIclass.setui(self)
		
		
	
	
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	
	
		
}
