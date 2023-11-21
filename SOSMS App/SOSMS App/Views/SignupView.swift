//
//  SignupView.swift
//  SOSMS App
//
//  Created by Stayna Alexandre on 11/16/23.
//

import SwiftUI

struct SignupView: View {
    @ObservedObject private var viewMod = SignupViewViewModel()
    
    var body: some View {
        NavigationStack{
            VStack{
                if !viewMod.errorMsg.isEmpty{
                    Text(viewMod.errorMsg)
                        .fontWeight(.bold)
                        .font(.system(size: 14))
                        .foregroundColor(Color.red)
                }
                if !viewMod.errorMsgPW.isEmpty{
                    Text(viewMod.errorMsg)
                        .fontWeight(.bold)
                        .font(.system(size: 14))
                        .foregroundColor(Color.red)
                }
                VStack(spacing: 30){
                    TextField("Enter Full Name", text: $viewMod.fullname)
                        .padding()
                        .frame(width: 313, height: 48)
                        .background(Color.white)
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(.red, lineWidth: CGFloat(viewMod.nameErr))
                        )
                    TextField("Enter Email Address", text: $viewMod.email)
                        .padding()
                        .frame(width: 313, height: 48)
                        .background(Color.white)
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(.red, lineWidth: CGFloat(viewMod.emailErr))
                        )
                    SecureField("Enter Password", text: $viewMod.password)
                        .padding()
                        .frame(width: 313, height: 48)
                        .background(Color.white)
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(.red, lineWidth: CGFloat(viewMod.pwErr))
                        )
                }
                .padding(.horizontal)
                Button{
                    viewMod.signup()
                }label:{
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
