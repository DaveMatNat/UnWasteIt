//
//  File.swift
//  UnWasteIt
//
//  Created by admin on 4/14/22.
//

import SwiftUI
import AVFoundation
import Foundation
struct MainView: View{
    @State private var Bread = false
    @State private var Chicken = false
    @State private var Eggs = false
    @State private var Milk = false
    @State private var Pork = false
    @State private var Bananas = false
    @State var skip : Bool = false
    @State var Sound : Bool = true
    
    @ObservedObject var myItemList : FoodItemList = FoodItemList()
    
    let newSwiftColor = UIColor(red: 39/255, green: 103/255, blue: 51/255,alpha: 1)
    init(){
        //เปลี่ยนสี Navigation Bar และข้อความบน Navigation Bar
        UINavigationBar.appearance().backgroundColor = .white//newSwiftColor
        UINavigationBar.appearance().barTintColor = .white
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: newSwiftColor,NSAttributedString.Key.font: UIFont(name: "Hoefler Text", size: 45)!]
    }
    //Fonts :Baskerville Bold
    
    
    var body: some View{//เปิด body
        
        NavigationView{//เปิด NavigationView
            ZStack{
                Color.init(red: 85/255, green: 139/255, blue: 87/255)//BG Color
            ScrollView(.vertical, showsIndicators: true){//เปิด ScrollView1
                VStack{//เปิด VStack
                    Text("Select Your Items")
                        .font(.system(size: 30))
                        .fontWeight(.black)
                        .foregroundColor(.white)
                    //.padding(.bottom, -25)
                    ScrollView(.horizontal, showsIndicators: true){//เปิด ScrollView2
                        HStack{//เปิด HStack1
                            ItemView(imageName: "Bread.png", FoodName: "Bread", FoodExpireDay: "", myItemList: self.myItemList, Bread: $Bread,Chicken: $Chicken,Eggs: $Eggs,Milk: $Milk,Pork: $Pork,Bananas: $Bananas)
                                .frame(width: 200, height: 265)
                                .padding([.horizontal],-10)
                                .padding([.bottom],10)
                            ItemView(imageName: "Chicken.png", FoodName: "Chicken", FoodExpireDay: "", myItemList: self.myItemList, Bread: $Bread,Chicken: $Chicken,Eggs: $Eggs,Milk: $Milk,Pork: $Pork,Bananas: $Bananas)
                                .frame(width: 200, height: 265)
                                .padding([.horizontal],-10)
                                .padding([.bottom],10)
                            ItemView(imageName: "Eggs.png", FoodName: "Eggs", FoodExpireDay: "", myItemList: self.myItemList, Bread: $Bread,Chicken: $Chicken,Eggs: $Eggs,Milk: $Milk,Pork: $Pork,Bananas: $Bananas)
                                .frame(width: 200, height: 265)
                                .padding([.horizontal],-10)
                                .padding([.bottom],10)
                            ItemView(imageName: "Bananas.png", FoodName: "Bananas", FoodExpireDay: "", myItemList: self.myItemList, Bread: $Bread,Chicken: $Chicken,Eggs: $Eggs,Milk: $Milk,Pork: $Pork,Bananas: $Bananas)
                                .frame(width: 200, height: 265)
                                .padding([.horizontal],-10)
                                .padding([.bottom],10)
                            ItemView(imageName: "Milk.png", FoodName: "Milk", FoodExpireDay: "", myItemList: self.myItemList, Bread: $Bread,Chicken: $Chicken,Eggs: $Eggs,Milk: $Milk,Pork: $Pork,Bananas: $Bananas)
                                .frame(width: 200, height: 265)
                                .padding([.horizontal],-10)
                                .padding([.bottom],10)
                            ItemView(imageName: "Pork.png", FoodName: "Pork", FoodExpireDay: "", myItemList: self.myItemList, Bread: $Bread,Chicken: $Chicken,Eggs: $Eggs,Milk: $Milk,Pork: $Pork,Bananas: $Bananas)
                                .frame(width: 200, height: 265)
                                .padding([.horizontal],-10)
                                .padding([.bottom],10)
                            
                        }//ปิด HStack1
                    }
                    //ปิด ScrollView2
                }
                Rectangle()
                    .fill(Color.white)
                    .frame(minWidth:0,maxWidth:.infinity , minHeight: 25,maxHeight: 100)
                VStack{
                    Text("Good Condition!")
                        .font(.system(.title))
                        .fontWeight(.black)
                        .foregroundColor(.white)
                        //.padding(.bottom, -25)
                    Text("*Press The \"Image\" To See \"How To Properly Preserve It!\"")
                        .font(.system(size: 14))
                        .foregroundColor(.secondary)
                    ScrollView(.horizontal, showsIndicators: false){//เปิด ScrollView3
                        HStack{//เปิด HStack2
                            if Bread{
                                ForEach(0..<$myItemList.Fresh.count, id:\.self){ i in
                                    ItemViewSelected(imageName: "\(myItemList.Fresh[i].foodImage)", FoodName: "\(myItemList.Fresh[i].foodName)", FoodExpireDay: myItemList.Fresh[i].foodExpiredDate, describe: myItemList.Fresh[i].foodDescribe,Bread: $Bread,Chicken: $Chicken,Eggs: $Eggs,Milk: $Milk,Pork: $Pork,Bananas: $Bananas, skip: $skip, Sound: $Sound)
                                        .frame(width: 200, height: 265)
                                        .padding([.horizontal],-10)
                                        .padding([.bottom],10)
                                }
                                
                            }
                                //.shadow(radius: 15)
                        }
                        //.padding(15)
                        //Spacer()//ปิด HStack2
                    }//ปิด ScrollView3
                    
                }.background(Color.init(red: 131/255, green: 175/255, blue: 127/255))//ปิด VStack
                
                VStack{
                    Text("Near Expiration Date")
                        .font(.system(.title))
                        .fontWeight(.black)
                        .foregroundColor(.init(red: 65/255, green: 119/255, blue: 67/255))
                    Text("*Press The \"Image\" To See \"How You Could Use It In A Creative Way!\"")
                        .font(.system(size: 14))
                        .foregroundColor(.secondary)
                        //.padding(.bottom, -25)
                    ScrollView(.horizontal, showsIndicators: false){//เปิด ScrollView3
                        HStack{//เปิด HStack2
                            if Bread{
                                
                                ForEach(0..<$myItemList.AlmostExpired.count, id:\.self){ i in
                                    ItemViewSelected(imageName: "\(myItemList.AlmostExpired[i].foodImage)", FoodName: "\(myItemList.AlmostExpired[i].foodName)", FoodExpireDay: myItemList.AlmostExpired[i].foodExpiredDate, describe: myItemList.AlmostExpired[i].foodDescribe,Bread: $Bread,Chicken: $Chicken,Eggs: $Eggs,Milk: $Milk,Pork: $Pork,Bananas: $Bananas, skip: $skip, Sound: $Sound)
                                        .frame(width: 200, height: 265)
                                        .padding([.horizontal],-10)
                                        .padding([.bottom],10)
                                    
                                }
                                
                            }
                                //.shadow(radius: 15)
                        }//ปิด HStack2
                    }//ปิด ScrollView3
                    
                }.background(Color.init(red: 177/255, green: 211/255, blue: 164/255))//ปิด VStack
                VStack{
                    HStack{
                    Text("Past Expiration Date")
                        .font(.system(.title))
                        .fontWeight(.black)
                        .foregroundColor(.init(red: 68/255, green: 68/255, blue: 68/255 ))
                        
                        Button(action:{
                            Sound.toggle()
                        }){
                            if Sound == false{
                                Image(systemName:"speaker.slash.fill")
                                    .resizable()
                                    .frame(width: 27, height: 23)
                                    .foregroundColor(Color.red)
                                
                            }
                            else{
                                Image(systemName:"speaker.wave.2.fill").resizable()
                                    .frame(width: 27, height: 23)
                                    .foregroundColor(Color.green)
                                
                            }
                        }
                        
                    }
                    Text("* Press The \"Item's Image\" To See \"How To Check If That Food Item Is Still Edible And What To Do If It's Expired\"")
                        .font(.system(size: 14))
                        .foregroundColor(.secondary)
                        .padding([.horizontal],10)
                    Text("")
                    Text("* Press The Volume Button To Mute/Unmute Text-to-Speech")
                        .font(.system(size: 14))
                        .foregroundColor(.secondary)
                        .padding([.leading],-4)
                        //.padding(.bottom, -25)
                    ScrollView(.horizontal, showsIndicators: false){//เปิด ScrollView3
                        HStack{//เปิด HStack2
                            if Bread{
                                ForEach(0..<$myItemList.Expired.count, id:\.self){ i in
                                    ItemViewSelected(imageName: "\(myItemList.Expired[i].foodImage)", FoodName: "\(myItemList.Expired[i].foodName)", FoodExpireDay: myItemList.Expired[i].foodExpiredDate, describe: myItemList.Expired[i].foodDescribe,Bread: $Bread,Chicken: $Chicken,Eggs: $Eggs,Milk: $Milk,Pork: $Pork,Bananas: $Bananas, skip: $skip, Sound: $Sound)
                                        .frame(width: 200, height: 290)
                                        .padding([.horizontal],-10)
                                        .padding([.bottom],10)
                                }
                                
                            }
                                //.shadow(radius: 15)
                        }//ปิด HStack2
                    }//ปิด ScrollView3
                    
                }.background(Color.init(red: 255/255, green: 248/255, blue: 231/255))//ปิด VStack
            }//ปิด ScrollView1
            .navigationBarTitle("UnWasteIt",displayMode: .automatic)
            }
        }//ปิด NavigationView
        
    }//ปิด body
}
