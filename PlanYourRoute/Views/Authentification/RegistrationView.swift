//
//  SwiftUIView.swift
//  PlanYourRoute
//
//  Created by Nadiia Padalka on 29.07.2025.
//

import SwiftUI

struct RegistrationView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var fullName: String = ""
    @State var confirmPassword: String = ""
    var body: some View {
        VStack(spacing: 24){
            InputView(text: $email, title: "Email Address", placeholder: "name@example.com")
            InputView(text: $fullName,
                      title: "Full Name",
                      placeholder: "Enter your name")
            InputView(text: $password, title: "Password", placeholder: "Enter your password", isSecureField: true)
            InputView(text: $confirmPassword, title: "Confirm Password", placeholder: "Confirm your password", isSecureField: true)
        }
        .padding(.horizontal)
        .padding(.top, 150)
        
        Button{
            print("Sign user up...")
        } label: {
            HStack{
                Text("SIGN UP")
                    .fontWeight(.semibold)
                    .font(.headline)
                Image(systemName: "chevron.right")
            }
            .foregroundColor(.white)
            .frame(
                width: UIScreen.main.bounds.width - 32,
                height: 48)
        }
        .background(Color(.systemBlue))
        .cornerRadius(10)
        .padding(.top, 24)

        Spacer()

        Button{} label: {
                HStack{
                    Text("Already have an account?")
                    Text("Sign in")
                        .fontWeight(.bold)
                }
                .font(.system(size: 14))
            }
        }
    }
    
    

#Preview {
    RegistrationView()
}
