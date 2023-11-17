//
//  ContentView.swift
//  SOSMS App
//
//  Created by Stayna Alexandre on 11/16/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack{
                // app logo image can go here
                Text("Alert those close to you with a click of a button").padding()
                
                NavigationLink(
                    destination: SignupView(),
                    label: {
                        Text("Create An Account")
                            .frame(width:305, height: 74, alignment: .center)
                            .background(Color.gray)
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                        
                    })
                
                NavigationLink(
                    destination: LoginView(),
                    label: {
                        Text("Already Have An Account? Login Here.")
                        
                    })
            }.navigationTitle("Welcome To SOSMS")
                .navigationBarTitleDisplayMode(.inline)
            // LoginView()
        }
    }
}

#Preview {
    ContentView()
}
