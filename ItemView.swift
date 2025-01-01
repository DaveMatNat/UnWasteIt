//
//  File.swift
//  UnWasteIt
//
//  Created by admin on 4/14/22.
//

import SwiftUI
import AVFoundation
import Foundation

//Item Box UI / Graphics
struct ItemView: View {
    //Formats Dates into mm/DD/YY form
    let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            return formatter
        }()

    //Define Variables
    var imageName : String
    var FoodName : String
    var FoodExpireDay : String
                                                                 //var itemCount : Int
    @State private var selectedDate = Date()
    @State private var showingPopover = false
    @State private var describe : String = ""
    
    @ObservedObject var myItemList : FoodItemList
    
    @Binding var Bread : Bool
    @Binding var Chicken : Bool
    @Binding var Eggs : Bool
    @Binding var Milk : Bool
    @Binding var Pork : Bool
    @Binding var Bananas : Bool
    
    // Changes the placeholder depending in the food item.
    func pretext() -> String{
        if FoodName == "Bread"{
            return "Whole Grain, Whole Wheat etc."
        }
        else if FoodName == "Chicken"{
            return "Free-range Chicken etc."
        }
        else if FoodName == "Eggs"{
            return "Caged-Free Eggs etc."
        }
        else if FoodName == "Milk"{
            return "Almond Milk, Grass Fed Milk etc."
        }
        else if FoodName == "Pork"{
            return "Free-range Pork etc."
        }
        else{
            return "Organic Apples etc."
        }
    }
    
    //Calculate The Numbers of Days Between Today's Date and Item's Expiration Date.
    func numberOfDaysBetween() -> Int {
        let myTodayDate = Date.now
        let fromDate = myTodayDate
        let toDate = selectedDate
        let numberOfDays = Calendar.current.dateComponents([.day], from: fromDate, to: toDate)
        let myDateFormatter = DateFormatter()
        myDateFormatter.dateFormat = "dd"
        let myCurrentDay_Now = myDateFormatter.string(from: myTodayDate)
        let myCurrentDay_Selected = myDateFormatter.string(from: selectedDate)
        myDateFormatter.dateFormat = "MM"
        let myCurrentMonth_Now = myDateFormatter.string(from: myTodayDate)
        let myCurrentMonth_Selected = myDateFormatter.string(from: selectedDate)
        if (myCurrentDay_Now == myCurrentDay_Selected) &&  (myCurrentMonth_Now == myCurrentMonth_Selected){
            return 0
        }else {
        
            return numberOfDays.day! + 1
        }
    }
    //Main UI / Graphics
    var body: some View {
        VStack {//เปิด VStack1
            HStack {//เปิด HStack1
                VStack(alignment: .leading) {//เปิด VStack2
                    HStack {
                        Button(action: {
                            showingPopover = true
                        }) {
                        // Button's Icon
                            HStack {
                            
                                Image(uiImage: UIImage(named:imageName)!)
                                    .resizable()
                                    .frame(width: 150, height: 150)
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 130, height: 190)
                            }
                        }
                    }
                    //Popup UI / Graphics / Functions
                    .popover(isPresented: $showingPopover) {
                        NavigationView {
                            VStack {
                                //Date Picker
                                DatePicker("Date", selection: $selectedDate,in:Date.now..., displayedComponents: .date)
                                    .labelsHidden()
                                    .datePickerStyle(GraphicalDatePickerStyle())
                                    .padding()
                                    .accentColor(Color.init(red: 121/255, green: 162/255, blue: 142/255))
                                Text("Describe Your Food Item")
                                    .font(.system(.title3))
                                    .foregroundColor(.secondary)
                                 TextField(" (Optional) e.g. \(pretext()) ",text: $describe)
                                    .modifier(TextFieldClearButton(text:$describe))
                                    .textFieldStyle(.roundedBorder)
                                    .frame(width: 350, height: 50, alignment: .center)
                                Spacer()
                            }
                            //Popup Title
                            
                            .navigationBarTitle(Text("Pick An Expire Date For \(FoodName)"), displayMode: .inline).lineLimit(2)
                            .toolbar {
                                ToolbarItem(placement: .navigationBarTrailing) {
                                    Button("Done"){
                                        /*
                                        let content = UNMutableNotificationContent()
                                        content.title = "\(imageName.replacingOccurrences(of: ".png", with: ""))"
                                        content.subtitle = "\(numberOfDaysBetween()) Remaining"
                                        content.sound = UNNotificationSound.default
                                        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                                        
                                        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                                        
                                        UNUserNotificationCenter.current().add(request)
                                        */
                                        //print("\(selectedDate)")
                                        let myID = myItemList.Fresh.count + 1
                                        let myItem : FoodItem = FoodItem(id: myID, foodImage: imageName, foodName: (numberOfDaysBetween()), foodExpiredDate: selectedDate,foodDescribe: describe)
                                        describe = ""
                                        //print("\(myItem)")
                                        if numberOfDaysBetween() > 3{
                                        self.myItemList.Fresh.append(myItem)
                                        self.myItemList.Fresh = self.myItemList.Fresh.sorted (by: {$0.foodName < $1.foodName})
                                        }
                                        else if numberOfDaysBetween() <= 3 && numberOfDaysBetween() > 0{
                                            self.myItemList.AlmostExpired.append(myItem)
                                            self.myItemList.AlmostExpired = self.myItemList.AlmostExpired.sorted (by: {$0.foodName < $1.foodName})
                                        }
                                        else{
                                            self.myItemList.Expired.append(myItem)
                                            self.myItemList.Expired = self.myItemList.Expired.sorted (by: {$0.foodName < $1.foodName})
                                        }
                                        
                                        self.Bread = true
                                        self.Chicken = true
                                        self.Milk = true
                                        self.Pork = true
                                        self.Bananas = true
                                        
                                        showingPopover = false
                                    }.foregroundColor(Color.blue)
                                }
                                
                                    ToolbarItem(placement: .navigationBarLeading) {
                                        Button("Cancel"){
                                            showingPopover = false
                                        }.foregroundColor(Color.red)
                                }
                            }
                        }
                    }
                }//ปิด VStack2
                .padding([.bottom, .horizontal])
            }//ปิด HStack1
        }//เปิด VStack1
        .background(.white)
        .cornerRadius(25)
        .overlay(
            RoundedRectangle(cornerRadius: 25)
                .stroke(Color(.sRGB, red: 100/255, green: 100/255, blue: 100/255,
                              opacity: 0.5), lineWidth: 1)
        )
        .padding([.top, .horizontal])
    }
}
