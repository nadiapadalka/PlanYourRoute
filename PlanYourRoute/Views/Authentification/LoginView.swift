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
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        NavigationStack{
            VStack(spacing: 24){
                //image
                //form fields
                InputView(
                    text: $email,
                    title: "Email Address",
                    placeholder: "name@example.com")
                //prevent autocapitalization
                .textInputAutocapitalization(.never)
                InputView(
                    text: $password,
                    title: "Password",
                    placeholder: "Enter your password",
                    isSecureField: true)
                
            }
            .padding(.horizontal)
            .padding(.top, 250)
            
            Button{
                print("Log user in")
                //checking if such user exists, and signing him in
                Task{
                    try await viewModel.signIn(withEmail: email, password: password)
                }
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
            //adding validation in case if form is valid or not
            .disabled(!formIsValid)
            .opacity(formIsValid ? 1 : 0.5)
            .cornerRadius(10)
            .padding(.top, 24)
            
            Spacer()
            NavigationLink {
                RegistrationView()
                    .navigationBarBackButtonHidden(true)
            } label: {
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

extension LoginView: AuthentificationFormProtocol{
    var formIsValid: Bool{
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count >= 6
    }
}
