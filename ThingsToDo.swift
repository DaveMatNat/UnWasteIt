//
//  File.swift
//  UnWasteIt
//
//  Created by admin on 4/14/22.
//

import SwiftUI
import AVFoundation
import Foundation

// Continue Here
struct ThingsToDo : View {
    @State public var Like : Bool = false
    let lol : Int = Int.random(in: 2..<999)
    let names = ["Warner","David","James","Brandon","Sofia","Ryu","Neo","Trinity","Luke","Yuji","TJay","Jake","Nathan","Ronald","Tim","Sarah","Ashanti","Rahul","Matthew","Barry","Som Chai","Max","Kim","Mark","Robert","Walt","Jessie","Skyler","Yaritza","Kamden","Kolby","Carla","Elliot","Selena","Trace","Deven","Angel","George","Derick","Eddie","Jordan","Xavier","Micky","Natasha","Miya"]
    let places = ["USA","Thailand","India","Japan","China","Brazil","Canada","France","England"]
    
    @State var randomElement : String = ""
    @State var randomElement2 : String = ""
    @State var ranplace : String = ""
    var Imagee : String
    var WhatToDo : String
    var body: some View{
        VStack{
            HStack{
                Image(uiImage: UIImage(named:"user.png")!)
                    .resizable()
                    .frame(width: 45, height: 45)
                VStack{
                    Text("\(randomElement)")
                    Text("\(ranplace)").foregroundColor(.secondary)
                        .font(.system(size: 12))
                }.frame(minWidth: 100, idealWidth: 100, maxWidth: .infinity, minHeight: 70, idealHeight: 70, maxHeight: 70, alignment: .leading)
                    .padding([.top],8)
            }.frame(minWidth: 100, idealWidth: 100, maxWidth: .infinity, minHeight: 70, idealHeight: 70, maxHeight: 70, alignment: .leading)
                .padding([.leading],25)
            
        Image(uiImage: UIImage(named:Imagee)!)
            .resizable()
            .frame(width: 350, height: 250).cornerRadius(7)
            .aspectRatio(contentMode: .fit)
            //.frame(width: 350, height: 250)
            Spacer()
            HStack(spacing:20){
                Button(action:{Like.toggle()}){
                    if Like == true{
                        Image(systemName: "heart.fill").resizable()
                            .frame(width: 27, height: 23)
                            .foregroundColor(.red)
                    }
                    else {
            Image(systemName: "heart").resizable()
                            .frame(width: 27, height: 23)
                            .foregroundColor(.black)
                    }
                }
             Image(systemName: "bubble.right").resizable()
                    .frame(width: 27, height: 27)
            Image(systemName: "paperplane").resizable()
                    .frame(width: 27, height: 27)
                
            }.frame(minWidth: 100, idealWidth: 100, maxWidth: .infinity, minHeight: 30, idealHeight: 30, maxHeight: 30, alignment: .leading)
                .padding([.leading],25)
                .padding([.bottom],-10)
            Text("Liked by \(randomElement2) and \(lol) others")
                .frame(minWidth: 100, idealWidth: 100, maxWidth: .infinity, minHeight: 60, idealHeight: 60, maxHeight: 60, alignment: .leading)
                .padding([.horizontal],25)
                .padding([.top,.bottom],-10)
                .foregroundColor(.secondary)
            Text(WhatToDo)
                .lineLimit(nil)
                .frame(minWidth: 100, maxWidth: .infinity, minHeight: 30, maxHeight: .infinity, alignment: .leading)
                .padding([.top],-10)
                    .padding([.leading],15)
                    .padding([.horizontal],10)
                    .padding([.bottom],10)
                
        }//.background(.green)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(.sRGB, red: 100/255, green: 100/255, blue: 100/255,
                                  opacity: 0.5), lineWidth: 1))
            .padding([.top,.horizontal],10)
            .padding([.vertical],10)
            .onAppear{
                randomElement = self.names.randomElement()!
                randomElement2 = self.names.randomElement()!
                ranplace = self.places.randomElement()!
            }
    }
}
