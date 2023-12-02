//
//  LoginView.swift
//  SOSMS App
//
//  Created by Stayna Alexandre on 11/16/23.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject private var viewMod = LoginViewViewModel()
    
    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [.orange, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Text("Login")
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundStyle(.white)
                        .fontDesign(.rounded)
                    
                    if !viewMod.errorMsg.isEmpty{
                        Text(viewMod.errorMsg)
                            .fontWeight(.bold)
                            .font(.system(size: 14))
                            .foregroundColor(Color.red)
                    }
                    //login form
                    VStack(spacing: 50){
                        TextField("Enter Email Address", text: $viewMod.email)
                            .padding()
                            .frame(width: 313, height: 48)
                            .background(Color.white)
                            .cornerRadius(10)
                            .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(.red, lineWidth: CGFloat(viewMod.wrongEmail))
                            )
                        SecureField("Enter Password", text: $viewMod.password)
                            .padding()
                            .frame(width: 313, height: 48)
                            .background(Color.white)
                            .cornerRadius(10)
                            .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(.red, lineWidth: CGFloat(viewMod.wrongPW))
                            )
                    }
                    .padding(.horizontal)
                    Button{viewMod.login()}label:{
                        HStack {
                            Text("LOGIN")
                                .fontWeight(.semibold)
                        }
                        .foregroundColor(Color.white)
                        .frame(width: 305 , height: 74)
                    }
                    .background(Color.black)
                    .cornerRadius(10)
                    .padding(.top, 30)
                    
                    // Spacer()
                    
                    NavigationLink(
                        destination: SignupView()
                            .navigationBarBackButtonHidden(),
                        label: {
                            HStack(spacing: 2){
                                Text("New? Go To ")
                                    .foregroundStyle(.white)
                                Text("Sign Up")
                                    .foregroundStyle(.white)
                                    .fontWeight(.bold)
                            }
                            .font(.system(size: 14))
                        })
                }
                .background(.black.opacity(0.2))
                .cornerRadius(10)
                .padding()
            }
        }
    }
}

#Preview {
    LoginView()
}
