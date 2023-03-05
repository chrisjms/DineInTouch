//
//  LoginView.swift
//  DineInTouch
//
//  Created by Chris on 04/03/2023.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel: LoginViewModel
    var body: some View {
        NavigationView {
            ZStack {
                NavigationLink(destination: SignUpView(viewModel: self.viewModel), isActive: $viewModel.isNewRestaurantPresented) {}.isDetailLink(false)
                LinearGradient(
                    gradient: Gradient(colors: [Color.orange, Color.white]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                VStack {
                    Text("Dine in Touch")
                        .bold()
                        .font(.title)
                        .padding(.top, UIScreen.screenHeight*0.1)
                        .padding(.bottom, UIScreen.screenHeight*0.1)
                    Text("Accéder à votre restaurant")
                        .bold()
                        .font(.title2)
                        .padding(.top, UIScreen.screenHeight*0.1)
                        .padding(.bottom, UIScreen.screenHeight*0.02)
                    Text("Votre adresse mail")
                        .font(.title3)
                    TextField("Mail", text: $viewModel.restaurantCode)
                        .padding(.horizontal, UIScreen.screenWidth*0.07)
                        .padding(.vertical, UIScreen.screenHeight*0.01)
                        .background(Color.white)
                        .cornerRadius(25)
                    Text("Votre mot de passe")
                        .font(.title3)
                    TextField("Mot de passe", text: $viewModel.restaurantCode)
                        .padding(.horizontal, UIScreen.screenWidth*0.07)
                        .padding(.vertical, UIScreen.screenHeight*0.01)
                        .background(Color.white)
                        .cornerRadius(25)
                    Spacer()
                    Button(action: {viewModel.isNewRestaurantPresented.toggle()}) {
                        Text("S'inscrire")
                            .font(.footnote)
                            .foregroundColor(.blue)
                            .padding(.bottom, 30)
                    }
                }
                .navigationBarHidden(true)
                .padding()
            }.ignoresSafeArea()
        }
    }
}

struct SignUpView: View {
    @StateObject var viewModel: LoginViewModel
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.orange, Color.white]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            VStack {
                TextFields(text: "Votre adresse mail", textField: "Email", bindingText: $viewModel.email)
                TextFields(text: "Nouveau mot de passe", textField: "Mot de passe", bindingText: $viewModel.email)
                TextFields(text: "Confirmation du mot de passe", textField: "Mot de passe", bindingText: $viewModel.email)
                TextFields(text: "Votre restaurant est-il déjà renseigné?", textField: "Code du restaurant", bindingText: $viewModel.email)
                Text("Sinon votre restaurant sera enregistré et vous pourrez renseigner son menu.")
                    .font(.title2)
                Spacer()
                Button(action: {}) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.blue)
                            .frame(width: UIScreen.screenWidth*0.5, height: UIScreen.screenHeight*0.05)
                        Text("S'inscrire")
                            .foregroundColor(.white)
                    }
                }
            }.padding()
                .padding(.top, UIScreen.screenHeight*0.1)
            .navigationTitle("Inscription")
            .navigationBarTitleDisplayMode(.inline)
        }.ignoresSafeArea()
    }
}

struct TextFields: View {
    var text: String
    var textField: String
    @Binding var bindingText: String
    var body: some View {
        Text(text)
            .font(.title2)
        TextField(textField, text: $bindingText)
            .padding(.horizontal, UIScreen.screenWidth*0.07)
            .padding(.vertical, UIScreen.screenHeight*0.01)
            .background(Color.white)
            .cornerRadius(25)
            .padding(.bottom)
    }
}
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: LoginViewModel())
    }
}
