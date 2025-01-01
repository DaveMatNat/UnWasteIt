//
//  File.swift
//  UnWasteIt
//
//  Created by admin on 4/14/22.
//

import SwiftUI
import AVFoundation
import Foundation

// List of Food
class FoodItemList : ObservableObject {
    //Fresh
    @Published var Fresh : [FoodItem]
    //Almost Expired
    @Published var AlmostExpired : [FoodItem]
    //Expired | Passed Expiration Date
    @Published var Expired : [FoodItem]
    
    init(){
        //Initialize List -> Empty List
        self.Fresh = []
        self.AlmostExpired = []
        self.Expired = []
    }
}
