//
//  ProfileView.swift
//  PlanYourRoute
//
//  Created by Nadiia Padalka on 29.07.2025.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        if let user = viewModel.currentUser {
        List{
            Section{
                HStack{
                    Text(user.initials)
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 72, height: 72)
                        .background(Color(.systemGray))
                        .clipShape(Circle())
                    VStack(alignment: .leading, spacing: 4){
                        Text(user.fullname)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.top, 4)
                        Text(user.email)
                            .font(.footnote)
                            //.accentColor(.gray)
                            .foregroundColor(.gray)
                    }
                }
            }
            Section("General"){
                HStack{
                    SettingsRowView(imageName: "gear", title: "Version", tintColor: Color(.systemGray))
                    Spacer()
                    Text("1.0.0")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            Section("Account"){
                Button{
                    viewModel.signOut()
                    print("Signing out...")
                } label: {
                    SettingsRowView(imageName: "arrow.left.circle.fill", title: "Sign Out", tintColor: Color(.red))
                }
                
                Button{
                    print("Deleteing accout...")
                } label: {
                    SettingsRowView(imageName: "x.circle.fill", title: "Delete Accout", tintColor: Color(.red))
                }
            }
                
                    
            }
        }
    }
}

#Preview {
    ProfileView()
}
