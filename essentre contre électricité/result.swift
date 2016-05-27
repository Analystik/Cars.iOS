//
//  result.swift
//  essentre contre électricité
//
//  Created by Maxime Trudel on 16-05-19.
//  Copyright © 2016 Analystik. All rights reserved.
//

import UIKit

class result: UIViewController {

	//data
	
	let resultArray:Array = ["Vous dépenserez XXX$ sur l'essence", "Vous dépenserez XXX$ sur l'électricité", "Vous allez dépenser xxx$ de plus pour acheter une voiture électrique(incluant la subvention).","Le coût de remplacement des piles est de: xxx$"]
	
	
	
	
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

		//connection a database
		// chnager le layout
		
		// entrer les variable
		

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
