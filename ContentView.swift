//
//  ContentView.swift
//  Shared
//
//  Created by 宮田知明 on 2022/07/10.
//

import SwiftUI

struct ContentView: View {
    @State var outputText = "Hello World!"
    var body: some View {
        VStack {
            Text(outputText)
                .font(.largeTitle)
                //.fontWeight(.bold)
                .padding()
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
            Button(action: {
                
                outputText = "Hi,Swift!"
                
            }) {
                Text("切り替えボタン")
                .padding(.all)
                .background(Color.blue)
                .foregroundColor(Color.white)
            }
            
        }
           }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
