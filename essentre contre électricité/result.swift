//
//  result.swift
//  essentre contre électricité
//
//  Created by Maxime Trudel on 16-05-19.
//  Copyright © 2016 Analystik. All rights reserved.
//

import UIKit

class result: UIViewController, UITableViewDelegate, UITableViewDataSource {

	//data
	
	let resultArray:Array = ["Vous dépenserez XXX$ sur l'essence", "Vous dépenserez XXX$ sur l'électricité", "Vous allez dépenser xxx$ de plus pour acheter une voiture électrique(incluant la subvention).","Le coût de remplacement des piles est de: xxx$"]
	
	
	
	
	//tout des éléments du storyboard
	@IBOutlet var esence100: UILabel!
	@IBOutlet var essencetotal: UILabel!
	@IBOutlet var elec100: UILabel!
	@IBOutlet var electotal: UILabel!
	@IBOutlet var tableView: UITableView!
	
	
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
    

	
	//tableview method
	//creer la cellule et le texte
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
		cell.textLabel?.text = resultArray[indexPath.row]
		return cell
	}
	
	
	// creer le nombre de ranger
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return resultArray.count;
	}
}
