//
//  SignupView.swift
//  SOSMS App
//
//  Created by Stayna Alexandre on 11/16/23.
//

import SwiftUI

struct SignupView: View {
    @State private var email = ""
    @State private var fullname = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    var body: some View {
        NavigationStack{
            VStack{
                VStack(spacing: 30){
                    InputView(text: $fullname,
                              title: "Full Name",
                              placeholder: "Enter Your Full Name")
                    
                    InputView(text: $email ,
                              title: "Email Address",
                              placeholder: "name@example.com")
                    .autocapitalization(.none)
                    
                    InputView(text: $password ,
                              title: "Password",
                              placeholder: "Enter Your Password",
                              isSecureField : true)
                    InputView(text: $confirmPassword ,
                              title: "Confirm Password",
                              placeholder: "Re-Enter Password To Confirm",
                              isSecureField : true)
                }
                .padding(.horizontal)
                
                Button{}label:{
                    HStack {
                        Text("SIGN UP")
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(Color.white)
                    .frame(width: 305 , height: 74)
                }
                .background(Color.gray)
                .cornerRadius(10)
                .padding(.top, 30)
                
                NavigationLink(
                    destination: LoginView()
                        .navigationBarBackButtonHidden(),
                    label: {
                        HStack(spacing: 2){
                            Text("Already A user? ")
                            Text("Login")
                                .fontWeight(.bold)
                        }
                        .font(.system(size: 14))
                    })
            }
        }    }
}

#Preview {
    SignupView()
}
