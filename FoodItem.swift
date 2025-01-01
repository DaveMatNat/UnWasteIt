//
//  File.swift
//  UnWasteIt
//
//  Created by admin on 4/14/22.
//

import SwiftUI
import AVFoundation
import Foundation

class FoodItem : Identifiable{
    var id : Int
    var foodImage : String
    var foodName : Int
    var foodExpiredDate : Date
    var foodDescribe : String
    
    init(id : Int, foodImage : String, foodName : Int, foodExpiredDate : Date , foodDescribe : String){
        self.id = id
        self.foodName = foodName
        self.foodImage = foodImage
        self.foodExpiredDate = foodExpiredDate
        self.foodDescribe = foodDescribe
    }
}
