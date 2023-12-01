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
            VStack(spacing: 30){
                Text("Are You Okay? If you aren't sure, hold the round button if whichever option you feel comfortable using right now.")
                    .fontWeight(.semibold)
                    
                AlertButtonsView(buttonTitle: "Send A Quick Alert", buttonDesc: "Send your contacts a quick alert without a message to immediately Notify them of your current situation.",color: .red)
                
                AlertButtonsView(buttonTitle: "Send An Alert With Message", buttonDesc: "Send your contacts a message with details on your current situation. You can toggle if you want to send your location as well.",color: .orange)
                
            }.navigationTitle("Alert")
        }
    }
}

#Preview {
    AlertView()
}
