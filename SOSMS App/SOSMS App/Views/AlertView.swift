//
//  AlertView.swift
//  SOSMS App
//
//  Created by Stayna Alexandre on 11/21/23.
//

import SwiftUI

struct AlertView: View {
    var body: some View {
        NavigationView{
            ZStack{
                Color(red: 240/255, green: 240/255, blue: 240/255)
                    .ignoresSafeArea()
                VStack(spacing: 30){
                    Text("Are You Okay? If you aren't sure, press the round button of whichever option you feel comfortable using right now.")
//                        .foregroundStyle(Color(red: 240/255, green: 240/255, blue: 240/255))
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal,30)
                    
                    AlertButtonsView(buttonTitle: "Send A Quick Alert", buttonDesc: "Send your contacts a quick alert without a message to immediately Notify them of your current situation.",color: .red)
                    
                    AlertButtonsView(buttonTitle: "Send An Alert With Message", buttonDesc: "Send your contacts a message with details on your current situation. You can toggle if you want to send your location as well.",color: .orange)
                    
                }.navigationTitle("Send Alert")
            }
        }
    }
}

#Preview {
    AlertView()
}
