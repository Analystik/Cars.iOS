//
//  result.swift
//  essentre contre électricité
//
//  Created by Maxime Trudel on 16-05-19.
//  Copyright © 2016 Analystik. All rights reserved.
//

import UIKit

class result: UIViewController {

	let Api:ApiResult = ApiResult()
	
	//data
	
	

	
	
	//tout des éléments du storyboard
	
	@IBOutlet var depessence: UILabel!
	@IBOutlet var depenceelec: UILabel!
	@IBOutlet var achatelec: UILabel!
	@IBOutlet var remplassepile: UILabel!
	@IBOutlet var essence100: UILabel!
	@IBOutlet var elec100: UILabel!
	@IBOutlet var esstotal: UILabel!
	@IBOutlet var electotal: UILabel!
	
	override func viewDidLoad() {
        super.viewDidLoad()


		
		let x = Api.calculate(Profil(carid: Constants.currentCar,kmperyear: kmconstant.currentkm,provinceid: Constants.currentProvince))
		
		depessence.text = "Vous dépenserez \(String(format:"%.2f", x.TotalGaz8years))$ sur l'essence"
		depenceelec.text = "Vous dépenserez \(String(format: "%.2f", x.TotalElec8years))$ sur l'électricité"
		achatelec.text = "Vous allez dépenser \(String(format: "%.2f", x.delta))$ de plus pour acheter une voiture électrique(incluant la subvention)."
		remplassepile.text = "Le coût de remplacement des piles est de: \(String(format: "%.2f", x.batterie))$"
		essence100.text =  "\(String(format: "%.2f", x.TotalGaz100))$ sur 100km"
		elec100.text = "\(String(format: "%.2f", x.TotalElec100))$ sur 100km"
		esstotal.text = "\(String(format: "%.2f", x.TotalGaz8years))$ sur 8ans"
		electotal.text = "\(String(format: "%.2f", x.TotalElec8years))$ sur 8ans"
		
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}





