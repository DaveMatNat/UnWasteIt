//
//  File.swift
//  UnWasteIt
//
//  Created by admin on 4/14/22.
//

import SwiftUI
import AVFoundation
import Foundation

struct ItemViewSelected: View {
    let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            return formatter
        }()
    @State private var delete : Bool = false
    var imageName : String
    var FoodName : String
    var FoodExpireDay : Date
    var describe : String
    
    @State private var showingPopover = false
    @Binding var Bread : Bool
    @Binding var Chicken : Bool
    @Binding var Eggs : Bool
    @Binding var Milk : Bool
    @Binding var Pork : Bool
    @Binding var Bananas : Bool
    @Binding var skip : Bool
    @Binding var Sound : Bool
    
    func CorrectGrammar() -> String{
        if imageName.replacingOccurrences(of: ".png", with: "") == "Eggs"{
            return "Had"
            
        }
        else if imageName.replacingOccurrences(of: ".png", with: "") == "Bananas"{
            return "Had"
        }
        else{
            return "Has"
        }
    }
    
    func CorrectGrammar2() -> String{
        if imageName.replacingOccurrences(of: ".png", with: "") == "Eggs"{
            return "Are"
            
        }
        else if imageName.replacingOccurrences(of: ".png", with: "") == "Bananas"{
            return "Are"
        }
        else{
            return "Is"
        }
    }
    
    func CorrectGrammar3() -> String{
        if imageName.replacingOccurrences(of: ".png", with: "") == "Eggs"{
            return "Have"
            
        }
        else if imageName.replacingOccurrences(of: ".png", with: "") == "Bananas"{
            return "Have"
        }
        else{
            return "Has"
        }
    }
    
    func ExpiredString() -> String{
        if Int(FoodName) == 0{
            return "Gone Bad. \nOr \(CorrectGrammar()) It? Hmm?"
        
        }else{
            if FoodName == "1"{
                return "\(FoodName) Day Left"
            }
            return "\(FoodName) Days Left"
        }
    }
    
    func descriptionString() -> String{
        if describe == ""{
            return ""
        }else{
            return "\(describe)"
        }
    }
    
    let synthesizer = AVSpeechSynthesizer()
    
    func Start(texts:String){
        let utterance = AVSpeechUtterance(string: texts)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.52
        synthesizer.speak(utterance)
        
        
    }
    func Stop(){
        synthesizer.stopSpeaking(at: .immediate)
    }
    var body: some View {
        
        VStack {//เปิด VStack1
            // describe your food
            //.foregroundColor(Color.blue)
            Button(action: {
                showingPopover = true
                if Sound == false{
                    print(Sound)
                    synthesizer.pauseSpeaking(at: .immediate)
                }
                else{
                if Int(FoodName) ?? 0 <= 0{
                    if skip == false{
                        Start(texts: "Just Because Your \"\(imageName.replacingOccurrences(of: ".png", with: ""))\" \(CorrectGrammar3()) Past The Expiration Date Doesn't Mean That Your \"\(imageName.replacingOccurrences(of: ".png", with: ""))\" \(CorrectGrammar2()) Unsafe To Consume!     Instead, Follow The Instructions Given Below To Find Out If Your \"\(imageName.replacingOccurrences(of: ".png", with: ""))\" \(CorrectGrammar3()) Actually Gone Bad")
                        
                    }
                    if imageName == "Bread.png"{ // pic name of the item
                        Start(texts: "See If There Are Any Mold Or Fungi Growing On It. They Come In Green, White, Or Black Spots. If There Is No Mold Then It's Safe To Eat!, Simply cut the mouldy portion off. Generally, hard or dense food is not easily penetrated by mould. However, if the food is completely covered with mould you should throw it away.feeding mouldy bread to birds is also a bad idea. since they can harm birds.")
                    }
                    if imageName == "Pork.png"{
                        Start(texts: "Bad Porks Are Dull Gray In Color, Bad Odor Or A Sour Smell. And If It Is Mushy Or Slimy Then It Is An Indication That It Has Gone Bad, Pork Meat can be turned into a fertilizer.place the meat near the centre of the pile and bury it well under other layers of compost. ")
                    }
                    if imageName == "Chicken.png"{
                        Start(texts: "Slimy, Has A Foul Smell, Or Has Changed To A Yellow, Green, Or Gray Color, These Are Signs That Your Chicken Has Gone Bad, Chicken Meat can be turned into a fertilizer.place the meat near the centre of the pile and bury it well under other layers of compost.")
                    }
                    if imageName == "Milk.png"{
                        Start(texts: "If It Has A Sour Or Stinky Smell, It Has Gone Bad, Spoiled milk can be used instead of buttermilk or sour cream in baked goods. It can also be used to tenderise meats or added to soups, casseroles, or salad dressings.")
                    }
                    if imageName == "Eggs.png"{
                        Start(texts: "Pour Cold Water Into A Bowl Then Crack The Egg Into The Bowl.If The Egg Floats Then The Egg Is Not Safe To Eat, You can feed your expired eggs to your chickens. cook them. So either hard boil them or crack them and scramble them up.")
                    }
                    if imageName == "Bananas.png"{
                      Start(texts: "Simply See If The Banana or Bananas are Overiped With Spots Or Bruises, Overiped banana aren't harmful in anyway.they are still edible or used in any sort of cooking.")
                    }
                    
                
                }
                }
            }) {
            // Button's Icon
                Image(uiImage: UIImage(named:imageName)!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                }
            
            HStack {//เปิด HStack1
                VStack(alignment: .leading) {//เปิด VStack2
                    Text(ExpiredString())
                        .font(.system(.title2))
                        .foregroundColor(Color.init(red: 85/255, green: 139/255, blue: 87/255))
                        .fontWeight(.black)
                        //.foregroundColor(.secondary)
                    HStack {
                        Text("\(FoodExpireDay, formatter: dateFormatter)")
                                                .foregroundColor(.secondary)
                        Spacer()
                    }
                    HStack{
                        if descriptionString() == ""{
                            Text("")
                        }
                        else{
                    Text("Description: \(descriptionString())")
                            .font(.system(size: 14,weight: .bold))
                            .foregroundColor(.red)
                        
                        if delete == true{
                        Button(action: {
                            delete = false
                        }) {
                        // Button's Icon
                            
                            Image(systemName: "trash")
                                    .imageScale(.large)
                                    .accentColor(Color.red)
                           }
                        }
                    }
                }
                //Work Here 4/12/2022
                    .popover(isPresented: $showingPopover) {
                        NavigationView {
                        if (Int(FoodName) ?? 0 > 3){
                            ScrollView(.vertical, showsIndicators: false){//เปิด ScrollView1
                                VStack{
                                    Spacer()
                            
                                    if imageName == "Bread.png"{
                                        Store(Imagee: "bread.jpg", words: "To save bread so it stays fresh longer, you can store it in plastic wrap, a reusable zip-top plastic bag, or a bread box. Avoid storing bread in damp, airy locations.")
                                    }
                                    if imageName == "Pork.png"{
                                        Store(Imagee: "pork.jpg", words:"Pack the meat tightly in the crocks (or jars if you don't have a lot of meat to store), and cover tightly with cheesecloth. Keep the meat at 36°F" )
                                    }
                                    if imageName == "Chicken.png"{
                                        Store(Imagee: "chicken.jpg", words:"To safely store your chicken, keep it in its original packaging and wrap it tightly in plastic wrap." )
                                    }
                                    if imageName == "Milk.png"{
                                        Store(Imagee: "milk.jpg", words:"Milk is preserved by the method of pasteurisation." )
                                    }
                                    if imageName == "Eggs.png"{
                                        Store(Imagee: "eggs.jpg", words:"You can store them for as long as a year by freezing them. You can't freeze eggs in the shell, but you can freeze them either beaten or separated" )
                                    }
                                    if imageName == "Bananas.png"{
                                        Store(Imagee: "banana.jpg", words:"Hang them,Wrap the stems in plastic wrap. ...Once they ripen, pop them in the fridge. ...If the bananas are peeled, add citrus...For longer periods of time, freeze." )
                                    }
                            
                                }.navigationBarTitle(Text("How To Store \"\(imageName.replacingOccurrences(of: ".png", with: ""))\" "), displayMode: .inline)
                                    .toolbar {
                                        ToolbarItem(placement: .navigationBarTrailing) {
                                            Button("Close"){
                                                showingPopover = false
                                            }.foregroundColor(Color.red)
                                        }
                                    }
                            }
                        }
                            
                        else if (Int(FoodName) ?? 0 <= 3) && (Int(FoodName) ?? 0 > 0){
                            ScrollView(.vertical, showsIndicators: false){//เปิด ScrollView1
                                VStack{//เปิด VStack
                                    Spacer()
                                    if imageName == "Bread.png"{ // Pic's name of the item
                                        ThingsToDo(Imagee: "french-toast-gfa5610f87_1920.jpg", WhatToDo: "Try Making Classic French Toast, Dont Waste Bread!")
                                        ThingsToDo(Imagee:"duck-g73ad47a46_1920.jpg" , WhatToDo: "Feeding Some Ducks")
                                        ThingsToDo(Imagee: "flag-7048909_1920.jpg", WhatToDo:"Support Ukrainians By Donating Atlest A Loaf Of Bread To www.moldovawcf.org")
                                        ThingsToDo(Imagee: "hands-600497_1920.jpg", WhatToDo:"www.wfp.org, Just Donated 10 Loafs Of Bread, Feelin Good!.")
            
                                    }
                                    
                                    if imageName == "Pork.png"{
                                        ThingsToDo(
                                        Imagee: "steak-2936531_1280.jpg", WhatToDo:"Have Butter, Abit Of Rosemary And A Slice Of Pork? Make Classic Steak At Home." )
                                        ThingsToDo(
                                        Imagee: "hand.png", WhatToDo:"Donate meat at www.dobrafabryka.pl To Help Hungry Childrens!" )
            
                                    }
                                    if imageName == "Chicken.png"{
                                       ThingsToDo(Imagee: "schnitzel-4781034_1280.jpg", WhatToDo:"Just Made A Delicious Schnitzel!")
                                        ThingsToDo(
                                        Imagee: "flag-7048909_1920.jpg", WhatToDo:"Help Out Ukraine Now! Donate To www.directrelief.org, I Donated A Whole Chicken So You Should Too!" )
                                        ThingsToDo(
                                        Imagee: "buddhists-453393_1280.jpg", WhatToDo: "Hey! Don't Waste Chickens,  Donate Them To The Monks!")
                                    }
                                    if imageName == "Milk.png"{
                                        ThingsToDo(Imagee: "biscuit-1832917_1280.jpg", WhatToDo: "Just Made A Batch Of Delicious Cookies!")
                                        ThingsToDo(Imagee: "chocolate-2354710_1280.jpg", WhatToDo: "Milk Is The Second Most Wasted Food. So I Stopped Wasting Them By Making Fudge Cakes!")
                                        ThingsToDo(Imagee: "a-bowl-3366480_1280.jpg", WhatToDo: "Don't Know What To Do With Milk? Make Cottage Cheese!")
                                    }
                                    if imageName == "Eggs.png"{
                                        ThingsToDo(Imagee: "Souffle.png", WhatToDo: "Make A Delicious Chocolate Soufflé!")
                                        
                                        ThingsToDo(Imagee: "ScotchEgg.png", WhatToDo: "Assembled The Perfect Scotch Egg")
                                        ThingsToDo(Imagee: "hand.png", WhatToDo: "Just Donated A Package Of Eggs to www.scholarsofsustenance.org You Can Donate Too!")
                                        ThingsToDo(Imagee: "british-flag-g3d2387cbe_1920.jpg", WhatToDo:" Remember To Donate To www.ukharvest.org. Many People Needs It.")
                                        
                                    }
                                    if imageName == "Bananas.png"{
                                      ThingsToDo(Imagee: "drink-breakfast-642121_1280.jpg", WhatToDo: "Nothing Much, Just Made An Almond Banana Smoothie For Myself! ")
                                    }
                                    
                                }
                            }.navigationBarTitle(Text("Our Community With \"\(imageName.replacingOccurrences(of: ".png", with: ""))\" "), displayMode: .inline)
                                .toolbar {
                                    ToolbarItem(placement: .navigationBarTrailing) {
                                        Button("Close"){
                                            showingPopover = false
                                        }.foregroundColor(Color.red)
                                    }
                                }
                        }
                            
                        else if Int(FoodName) ?? 0 <= 0{
                            
                            ScrollView(.vertical, showsIndicators: false){
                                VStack{
                                   
                                    Spacer()
                            if imageName == "Bread.png"{ // pic name of the item
                                Past(Imagee: "age-1238317_1280.jpg", HowTo: "See If There Are Any Mold Or Fungi Growing On It. They Come In Green, White, Or Black Spots. If There Is No Mold Then It's Safe To Eat!", WTD: "Simply cut the moldy portion off. Generally, hard or dense food is not easily penetrated by mould. However, if the food is completely covered with mold you should throw it away.feeding moldy bread to birds is also a bad idea, since they can harm birds.")
                                
    
                            }
                            if imageName == "Pork.png"{
                                Past(Imagee: "age-1238317_1280.jpg", HowTo: "Bad Porks Are Dull Gray In Color, Bad Odor Or A Sour Smell. And If It Is Mushy Or Slimy Then It Is An Indication That It Has Gone Bad.", WTD: "Pork Meat can be turned into a fertilizer.place the meat near the centre of the pile and bury it well under other layers of compost. ")
                                
                            }
                            if imageName == "Chicken.png"{
                                Past(Imagee: "chicken-breast-279848_1280.jpg", HowTo:"Slimy, Has A Foul Smell, Or Has Changed To A Yellow, Green, Or Gray Color, These Are Signs That Your Chicken Has Gone Bad.", WTD: "Chicken Meat can be turned into a fertilizer.place the meat near the centre of the pile and bury it well under other layers of compost.")
                                
                            }
                            if imageName == "Milk.png"{
                                Past(Imagee: "an_vision-5SN5N5-JM3c-unsplash.jpg", HowTo: "If It Has A Sour Or Stinky Smell, It Has Gone Bad.", WTD: "Spoiled milk can be used instead of buttermilk or sour cream in baked goods. It can also be used to tenderise meats or added to soups, casseroles, or salad dressings.")
                                
                            }
                            if imageName == "Eggs.png"{
                                Past(Imagee: "easter-eggs-6035549_1280.jpg", HowTo: "Pour Cold Water Into A Bowl Then Crack The Egg Into The Bowl.If The Egg Floats Then The Egg Is Not Safe To Eat.", WTD: "You can feed your expired eggs to your chickens. cook them. So either hard boil them or crack them and scramble them up.")
                                
                            }
                            if imageName == "Bananas.png"{
                                Past(Imagee: "Bananas.png", HowTo: "Simply See If It Is Overiped With Spots Or Bruises.", WTD: "Overiped banana aren't harmful in anyway.they are still edible or used in any sort of cooking.")
                            }
                            
                                
                            }
                            }//.background(Color.init(red: 255/255, green: 248/255, blue: 231/255))
                                .navigationBarTitle(Text(" \(imageName.replacingOccurrences(of: ".png", with: "")) Gone Bad? What Do I Do?"), displayMode: .inline)
                                    .toolbar {
                                        ToolbarItem(placement: .navigationBarTrailing) {
                                            Button("Close"){
                                                showingPopover = false
                                                Stop()
                                                skip = true
                                            }.foregroundColor(Color.red)
                                        }
                                    }
                        }
                            
                            
                        }
                 }
                }//ปิด VStack2
                .padding([.bottom, .horizontal])
                .onLongPressGesture {
                    //delete = true
                }
            }//ปิด HStack1
        }//ปิด VStack1
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
