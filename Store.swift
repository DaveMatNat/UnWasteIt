//
//  File.swift
//  UnWasteIt
//
//  Created by admin on 4/17/22.
//

import SwiftUI
import AVFoundation
import Foundation

struct Store : View{
    var Imagee : String
    var words : String
    var body: some View{
        VStack{
            Image(uiImage: UIImage(named:Imagee)!)
                .resizable()
                .frame(width: 350, height: 250).cornerRadius(7)
                .aspectRatio(contentMode: .fit)
                .padding([.bottom],25)
            Text("\(words)")
                .lineLimit(nil)
                .frame(minWidth: 100, maxWidth: .infinity, minHeight: 30, maxHeight: .infinity, alignment: .leading)
                .foregroundColor(.init(red: 0/255, green: 100/255, blue: 0/255))
                .padding([.top],-10)
                    .padding([.leading],15)
                    .padding([.horizontal],10)
                    .padding([.bottom],10)
        }.cornerRadius(10)
    }
}
