//
//  ContentView.swift
//  SOSMS App
//
//  Created by Stayna Alexandre on 11/16/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewMod = ContentViewViewModel()
    var body: some View {
        NavigationView {
            ZStack{
                LinearGradient(gradient: Gradient(colors: [.orange, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                if viewMod.isLogged, !viewMod.currentUser.isEmpty{
                    //AlertView()
                    TabView{
                        AlertView()
                            .tabItem{
                                Label("Home", systemImage: "light.beacon.min.fill")
                            }
                        ProfileView()
                            .tabItem{
                                Label("Profile", systemImage: "person.fill")
                            }
                        ManageContactsView()
                            .tabItem{
                                Label("Manage Contacts", systemImage: "person.crop.circle.badge.plus")
                            }
                    }
                } else{
                    VStack{
                        // app logo image can go here
                        Text("SOSMS")
                            .font(.title)
                            .fontWeight(.black)
                            .foregroundStyle(.white)
                            .fontDesign(.rounded)
                        Image("whitelogo")
                            .resizable()
                            .frame(width: 150, height: 180)
                        Text("Alert those close to you with a click of a button").padding()
                            .foregroundStyle(.white)
                            .fontWeight(.heavy)
                            .multilineTextAlignment(.center)
                        
                        NavigationLink(
                            destination: SignupView()
                                .navigationBarBackButtonHidden(),
                            label: {
                                Text("Create An Account")
                                    .fontWeight(.black)
                                    .frame(width:305, height: 74, alignment: .center)
                                    .background(Color.black)
                                    .foregroundColor(Color.white)
                                    .cornerRadius(10)
                                
                            })
                        
                        NavigationLink(
                            destination: LoginView()
                                .navigationBarBackButtonHidden(),
                            label: {
                                HStack{
                                    Text("Already Have An Account? ")
                                        .foregroundStyle(.white)
                                    Text("Login Here.")
                                        .foregroundStyle(.white)
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                }
                                
                            })
                    }
                }
            }
            // LoginView()
        }
    }
}

#Preview {
    ContentView()
}
