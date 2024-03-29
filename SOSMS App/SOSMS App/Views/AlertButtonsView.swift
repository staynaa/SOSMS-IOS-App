//
//  AlertButtonsView.swift
//  SOSMS App
//
//  Created by Stayna Alexandre on 11/30/23.
//

import SwiftUI

struct AlertButtonsView: View {
    let buttonTitle: String
    let buttonDesc: String
    let color: Color
    @State private var showingAlert = false
    
    var body: some View {
        HStack{
            Button{
                showingAlert=true
            } label:{
                Text("Press")
                    .frame(width: 100, height: 100)
                    .foregroundColor(Color.white)
                    .background(color)
                    .clipShape(Circle())
            }
            .alert("Quick Alert Was Sent. Get somewhere safe if you're able to.", isPresented: $showingAlert) {
                        Button("OK", role: .cancel) { }
                    }
            VStack(alignment: .leading) {
                Text(buttonTitle)
                //.font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(color)
                    .font(.system(size: 20))
                Text(buttonDesc)
                    .font(.system(size: 12))
            }
        }
        .padding()
        .background {
            ZStack(alignment: .top) {
                Rectangle()
                    .opacity(0.3)
                    .cornerRadius(15)
            }
            .foregroundStyle(.gray)
        }
    }
}

#Preview {
    AlertButtonsView(buttonTitle: "Preview Button", buttonDesc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean dignissim, nulla non condimentum imperdiet, nulla.", color: .blue)
}
