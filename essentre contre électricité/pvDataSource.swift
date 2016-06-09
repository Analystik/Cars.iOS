//
//  pvDataSource.swift
//  App1
//
//  Created by user902715 on 6/9/16.
//  Copyright © 2016 user902715. All rights reserved.
//

import Foundation
import UIKit


protocol pvDelegate{
    func didSelected(pickerView: UIPickerView, component: Int, row: Int)
}

class pvDataSource: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var datasource: Dictionary<Int,String> = Dictionary<Int,String>()
    var keys: Array<Int>!
    
    var selectedValue: String!
    var selectedIndex: Int!
    var selectedId: Int!
    
    var callback: pvDelegate!
    
    
    
    
    init(callback: pvDelegate){
        
        super.init()
        self.callback = callback
    }
    
    init(source: Dictionary<Int,String>){
        super.init()
        
        self.SetDataSource(source)
        
    }
    init(source: Dictionary<Int,String>, callback: pvDelegate){
        super.init()
        
        self.callback = callback
        self.SetDataSource(source)
        
    }
    
    func  SetDataSource(source: Dictionary<Int,String>) {
        
        self.datasource = source
        self.keys = Array(self.datasource.keys)
    }
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int{
        return self.datasource.count
    }
    
    
    func pickerView(pickerView: UIPickerView,
                    titleForRow row: Int,
                                forComponent component: Int) -> String? {
        
        return self.datasource[self.keys[row]]
    }
    
    func pickerView(pickerView: UIPickerView,
                    didSelectRow row: Int,
                                 inComponent component: Int){
        
        self.selectedIndex = row
        self.selectedId = self.keys[row]
        self.selectedValue = self.datasource[self.selectedId]
        
        if(self.callback != nil)
        {
            self.callback.didSelected(pickerView, component: component, row: row)
        }
        
        
    }
    
}
