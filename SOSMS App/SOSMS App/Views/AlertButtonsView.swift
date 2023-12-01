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
    
    
    var body: some View {
        HStack{
            Button{
                
            } label:{
                Text("Hold")
                //                    .onLongPressGesture(minimumDuration: 0.2, perform: <#T##() -> Void#>)
                    .frame(width: 100, height: 100)
                    .foregroundColor(Color.white)
                    .background(color)
                    .clipShape(Circle())
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
