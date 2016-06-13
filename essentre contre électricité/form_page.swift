//  form_page.swift
//  Copyright © 2016 Analystik. All rights reserved.

import UIKit

struct KmCurrent {
	static var km = 10000
}

class form_page: UIViewController, pvDelegate {
	var api: ApiResult = ApiResult()
	
	@IBOutlet var btnMarque: UIButton!
	@IBOutlet var btnModele: UIButton!
	@IBOutlet var btnYear: UIButton!
	@IBOutlet var btnProvince: UIButton!
	@IBOutlet var SliderKmYear: UISlider!
	@IBOutlet var resultKmYear: UILabel!
	@IBOutlet var dropdown: UIPickerView!
	@IBOutlet var button: UIButton!
    
    
    var pvMakesDataSource: pvDataSource!
    var pvModelsDataSource: pvDataSource!
    var pvCarsDataSource: pvDataSource!
    var pvProvinceDataSource: pvDataSource!
    
	
	@IBAction func btnMarqueClick(sender: UIButton) {
        
        self.ShowPickerView(self.pvMakesDataSource)
        
		btnModele.setTitle("Choisir un modèle", forState: UIControlState.Normal)
		btnYear.setTitle("Choisir une année", forState: UIControlState.Normal)
	}
	
	@IBAction func btnModeleClick(sender: UIButton) {
        
		self.pvModelsDataSource.SetDataSource(self.api.getModels(self.pvMakesDataSource.selectedId).ToDictionary())
        self.ShowPickerView(self.pvModelsDataSource)
        
		btnYear.setTitle("Choisir une année", forState: UIControlState.Normal)
	}
	
	@IBAction func btnYearClick(sender: UIButton) {
        
        self.pvCarsDataSource.SetDataSource(self.api.getCars(self.pvMakesDataSource.selectedId, modelId: self.pvModelsDataSource.selectedId).ToDictionary())
        self.ShowPickerView(self.pvCarsDataSource)

    }
	
	@IBAction func btnProvinceClick(sender: UIButton!) {
        
        self.ShowPickerView(self.pvProvinceDataSource)
        
		if needToHide() {
			button.hidden = false
		}
	}
	
	@IBAction func sliderValuechanged(sender: UISlider) {
		let km = Int(sender.value);
		resultKmYear.text = "\(km)"+"km";
	}
	
	func needToHide() -> Bool {
		return btnMarque.currentTitle != "Choisir une marque"
			&& btnModele.currentTitle != "Choisir un modèle"
			&& btnYear.currentTitle != "Choisir une année"
	}

	override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pvMakesDataSource = pvDataSource(source: self.api.getMakes().ToDictionary(), callback: self)
        self.pvProvinceDataSource = pvDataSource(source: self.api.getProvinces().ToDictionary(), callback: self)
        self.pvModelsDataSource = pvDataSource(callback: self)
        self.pvCarsDataSource = pvDataSource(callback: self)
        
	}

    func didSelected(pickerView: UIPickerView, component: Int, row: Int)
    {
        dropdown.hidden = true;
        
        var btn: UIButton!
        let pvSource: pvDataSource = pickerView.dataSource as! pvDataSource
        
        if(pvSource.isEqual(self.pvMakesDataSource))
        { btn = self.btnMarque }
        if(pvSource.isEqual(self.pvModelsDataSource))
        { btn = self.btnModele }
        if(pvSource.isEqual(self.pvCarsDataSource))
        { btn = self.btnYear }
        if(pvSource.isEqual(self.pvProvinceDataSource))
        { btn = self.btnProvince}
        
        if(btn != nil)
        {
            btn.setTitle(pvSource.selectedValue, forState: UIControlState.Normal)
        }
        
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
	}
    
    func ShowPickerView(source: pvDataSource)
    {
        dropdown.delegate = source;
        dropdown.dataSource = source;
        dropdown.hidden = false;
   
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.destinationViewController is Result)
        {
            let ctrl = segue.destinationViewController as! Result
            ctrl.currentProfil = Profil(carId: self.pvCarsDataSource.selectedId, kmPerYear: Int(self.SliderKmYear.value), provinceId: self.pvProvinceDataSource.selectedId )
        }
    }
    
    
    
}
