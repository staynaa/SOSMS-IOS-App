//
//  AlertMessageView.swift
//  SOSMS App
//
//  Created by Stayna Alexandre on 12/1/23.
//

import SwiftUI

struct AlertMessageView: View {
    @State var message: String = ""
    @State private var isOn = false
    @State private var showingAlert = false
    
    var body: some View {
        ZStack {
            Color(red: 46/255, green: 46/255, blue: 46/255)
                .ignoresSafeArea()
            VStack{
                Text("Send Alert With A Message")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.bold)
                    .foregroundStyle(Color(red: 240/255, green: 240/255, blue: 240/255))
                Text("Enter Message below...")
                    .fontWeight(.light)
                    .foregroundStyle(Color(red: 250/255, green: 193/255, blue: 132/255))
                TextField(
                    "",
                    text: $message
                )
                .frame(width: 313, height: 300)
                .background(Color.white.opacity(0.5))
                .cornerRadius(10)
                .multilineTextAlignment(.leading)
                
                Toggle(isOn: $isOn) {
                    Text("Share Location")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }.foregroundStyle(.green)
                .toggleStyle(SwitchToggleStyle(tint: .green))
                .padding(30)
                
                Button{showingAlert = true}label:{
                    Text("Send Alert")
                        .frame(width: 150 , height: 55)
                        .background(Color.orange)
                        .cornerRadius(30)
                        .foregroundStyle(.white)
                        .fontWeight(.black)
                }
                .alert("Alert has been Sent. Stay Safe", isPresented: $showingAlert) {
                            Button("OK", role: .cancel) { }
                        }
            }
            
            
        }
        //.background(Color.purple)
    }
}

#Preview {
    AlertMessageView()
}
