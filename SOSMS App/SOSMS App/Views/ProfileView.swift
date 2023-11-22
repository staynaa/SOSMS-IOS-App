//
//  ProfileView.swift
//  SOSMS App
//
//  Created by Stayna Alexandre on 11/16/23.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var viewMod = ProfileViewViewModel()
    var body: some View {
        NavigationView{
            VStack(spacing: 30){
                // user's name and email to be displayed
                if let currUser = viewMod.user{
                    Text(currUser.userName)
                        .fontWeight(.bold)
                        .padding()
                    HStack{
                        Text("Email: ")
                            .fontWeight(.semibold)
                        Text(currUser.email)
                            .fontWeight(.light)
                    }
                    HStack{
                        Text("Member Since ")
                            .fontWeight(.light)
                            .italic()
                            .foregroundColor(Color.gray)
                        Text("\(Date(timeIntervalSinceReferenceDate: currUser.joined).formatted(date: .abbreviated, time: .shortened))")
                            .fontWeight(.light)
                            .italic()
                            .foregroundColor(Color.gray)
                    }
                    Button{viewMod.logOut()}label: {
                        Text("Log Out")
                        .foregroundColor(Color.red)
                    }

                } else {
                    Text("Loading Your Profile")
                }
                // sign out option
            }.navigationTitle("Profile")
        }
        .onAppear{
            viewMod.getUser()
        }
    }
}

#Preview {
    ProfileView()
}
