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
            VStack{
                VStack(spacing: 20){
                    Text("Send A Quick Alert")
                        .fontWeight(.bold)
                        .foregroundStyle(.red)
                    Text("Send your contacts a quick alert without a message to immediately Notify them of your current situation.")
                    Text("Your LAST PINNED location will be SENT.")
                        .fontWeight(.semibold)
                        .underline()
                }
                VStack(spacing: 20){
                    Text("Send An Alert With Message")
                        .fontWeight(.bold)
                        .foregroundStyle(.orange)
                    Text("Send your contacts a message with details on your current situation. You can toggle if you want to send your location as well.")
                }

            }.navigationTitle("Alert")
        }
    }
}

#Preview {
    AlertView()
}
