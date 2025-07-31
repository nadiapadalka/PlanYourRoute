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
    @EnvironmentObject var viewModel: AuthViewModel
    //logic for backing in navigation stack
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 24){
            InputView(
                text: $email,
                title: "Email Address",
                placeholder: "name@example.com")
            InputView(
                text: $fullName,
                title: "Full Name",
                placeholder: "Enter your name")
            InputView(
                text: $password,
                title: "Password",
                placeholder: "Enter your password",
                isSecureField: true)
            ZStack(alignment: .trailing) {
                InputView(
                    text: $confirmPassword,
                    title: "Confirm Password",
                    placeholder: "Confirm your password",
                    isSecureField: true)
                //ui results when validating confirmPassword field
                if !password.isEmpty && !confirmPassword.isEmpty {
                    if password == confirmPassword {
                        Image(systemName: "checkmark.circle.fill")
                            .imageScale(.large)
                            .fontWeight(.bold)
                            .foregroundColor(Color(.systemGreen))
                    }
                    else {
                        Image(systemName: "xmark.circle.fill")
                            .imageScale(.large)
                            .fontWeight(.bold)
                            .foregroundColor(Color(.systemRed))
                    }
                }
            }
        }
        .padding(.horizontal)
        .padding(.top, 150)
        
        Button{
            print("Sign user up...")
            Task {
                try? await viewModel.createUser(
                    withEmail: email,
                    password: password,
                    fullName: fullName)
            }
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
        .disabled(!formIsValid)
        .opacity(formIsValid ? 1 : 0.5)
        .cornerRadius(10)
        .padding(.top, 24)
        //space between components
        Spacer()

        Button{
            dismiss()
        } label: {
                HStack{
                    Text("Already have an account?")
                    Text("Sign in")
                        .fontWeight(.bold)
                }
                .font(.system(size: 14))
            }
        }
    }

//validation protocol
extension RegistrationView: AuthentificationFormProtocol{
    var formIsValid: Bool{
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count >= 6
        && confirmPassword == password
        && !fullName.isEmpty
    }
}

#Preview {
    RegistrationView()
}
