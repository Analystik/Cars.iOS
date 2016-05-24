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
	// tout des éléments du storyboard
	
	@IBOutlet var dropdown: UIPickerView!
	@IBOutlet var resultMarque: UITextField!
	@IBOutlet var resultModel: UITextField!
	@IBOutlet var resultYear: UITextField!
	@IBOutlet var resultProvince: UITextField!
	@IBOutlet var resultKmYear: UILabel!
	
	@IBOutlet var button: UIButton!
	@IBOutlet var SliderKmYear: UISlider!
	
	
	// fonction du slider
		// obtient la valeur du slider
		// associe la valeur au label
		// affiche le bouton
	
	@IBAction func sliderValuechanged(sender: UISlider) {
		let currentValue = Int(sender.value);
		resultKmYear.text = "\(currentValue)"+"km";
		button.hidden = false
	}

	
    override func viewDidLoad() {
        super.viewDidLoad()
		gestionUIclass = PVclassViewController()
		gestionUIclass.setui(self)
		
		gestionUIclass.getApiResult("https://secure.bixi.com/data/stations.json")
		
	
	
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	
	
		
}
