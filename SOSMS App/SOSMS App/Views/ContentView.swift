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
                    
                    Text("Alert those close to you with a click of a button").padding()
                    
                    NavigationLink(
                        destination: SignupView()
                            .navigationBarBackButtonHidden(),
                        label: {
                            Text("Create An Account")
                                .frame(width:305, height: 74, alignment: .center)
                                .background(Color.gray)
                                .foregroundColor(Color.white)
                                .cornerRadius(10)
                            
                        })
                    
                    NavigationLink(
                        destination: LoginView()
                            .navigationBarBackButtonHidden(),
                        label: {
                            Text("Already Have An Account? Login Here.")
                            
                        })
                }
            }
            
            // LoginView()
        }
    }
}

#Preview {
    ContentView()
}
