//  result.swift
//  Copyright © 2016 Analystik. All rights reserved.

import UIKit

class Result: UIViewController {
	let Api: ApiResult = ApiResult()
	
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

		let finEvaluation = Api.calculate(Profil(carId: CurrentValue.car, kmPerYear: KmCurrent.km, provinceId: CurrentValue.province))
		
		depessence.text = "Vous dépenserez \(String(format:"%.2f", finEvaluation.gasTotalExpensesIn8Years))$ sur l'essence"
		depenceelec.text = "Vous dépenserez \(String(format: "%.2f", finEvaluation.electricityTotalExpensesIn8Years))$ sur l'électricité"
		achatelec.text = "Vous allez dépenser \(String(format: "%.2f", finEvaluation.deltaPrice))$ de plus pour acheter une voiture électrique(incluant la subvention)."
		remplassepile.text = "Le coût de remplacement des piles est de: \(String(format: "%.2f", finEvaluation.batteryExpenses))$"
		essence100.text =  "\(String(format: "%.2f", finEvaluation.gasTotalExpensesPer100km))$ sur 100km"
		elec100.text = "\(String(format: "%.2f", finEvaluation.electricityTotalExpensesPer100km))$ sur 100km"
		esstotal.text = "\(String(format: "%.2f", finEvaluation.gasTotalExpensesIn8Years))$ sur 8ans"
		electotal.text = "\(String(format: "%.2f", finEvaluation.electricityTotalExpensesIn8Years))$ sur 8ans"
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}