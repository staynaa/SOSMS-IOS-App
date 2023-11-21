//
//  LoginView.swift
//  SOSMS App
//
//  Created by Stayna Alexandre on 11/16/23.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject private var viewMod = LoginViewViewModel()
//    @State private var email = ""
//    @State private var password = ""
    
    var body: some View {
        NavigationStack{
            VStack{
                //login form
                VStack(spacing: 30){
                    InputView(text: $viewMod.email ,
                              title: "Email Address",
                              placeholder: "name@example.com")
                    .autocapitalization(.none)
                    
                    InputView(text: $viewMod.password ,
                              title: "Password",
                              placeholder: "Enter Your Password",
                              isSecureField : true)
                }
                .padding(.horizontal)
                if !viewMod.errorMsg.isEmpty{
                    Text(viewMod.errorMsg)
                        .fontWeight(.bold)
                        .font(.system(size: 14))
                        .foregroundColor(Color.red)
                }
                Button{viewMod.login()}label:{
                    HStack {
                        Text("LOGIN")
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(Color.white)
                    .frame(width: 305 , height: 74)
                }
                .background(Color.gray)
                .cornerRadius(10)
                .padding(.top, 30)
                
                Spacer()
                
                NavigationLink(
                    destination: SignupView()
                        .navigationBarBackButtonHidden(),
                    label: {
                        HStack(spacing: 2){
                            Text("New? Go To ")
                            Text("Sign Up")
                                .fontWeight(.bold)
                        }
                        .font(.system(size: 14))
                    })
                
            }
        }
    }
}

#Preview {
    LoginView()
}
