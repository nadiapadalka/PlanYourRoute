//
//  LoginView.swift
//  PlanYourRoute
//
//  Created by Nadiia Padalka on 29.07.2025.
//
import SwiftUI

struct LoginView: View {
    @State var email: String = ""
    @State var password: String = ""
    var body: some View {
        NavigationStack{
            VStack(spacing: 24){
                //image
                //form fields
                InputView(
                    text: $email,
                    title: "Email Address",
                    placeholder: "name@example.com")
                .autocapitalization(.none)
    
                InputView(
                    text: $password,
                    title: "Password",
                    placeholder: "Enter your password",
                    isSecureField: true)
                
                //sign in button
                // sign up button
            }
            .padding(.horizontal)
            .padding(.top, 250)
            
            Button{
                print("Log user in")
            } label: {
                HStack{
                    Text("SIGN IN")
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
            NavigationLink {} label: {
                HStack{
                    Text("Don't have an account?")
                    Text("Sign Up")
                        .fontWeight(.bold)
                }
                .font(.system(size: 14))
                    
            }
        }
    }
}
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
