//
//  ContentView.swift
//  DineInTouch
//
//  Created by Chris on 14/01/2023.
//

import SwiftUI

struct SetMenuView: View {
    @StateObject var viewModel: SetMenuViewModel
    var body: some View {
        ZStack {
            Color.gray.opacity(0.6)
            ScrollView(showsIndicators: false) {
                Text("Ajouter un apéritif")
                ForEach(viewModel.dishesList, id: \.self) { dish in
                    if dish.type == .appetizer {
                        HStack {
                            Text(dish.name)
                            Text(dish.price.description + " €")
                        }
                    }
                }
                VStack {
                    TextField("ajouter un apéritif", text: $viewModel.appetizer)
                    TextField("prix", text: $viewModel.appetizerPrice)
                    Button(action: {viewModel.createDish(dishType: .appetizer)}) {
                        Image(systemName: "plus.app")
                    }
                }.padding(.horizontal)
                Text("Ajouter une entrée")
                ForEach(viewModel.dishesList, id: \.self) { dish in
                    if dish.type == .starter {
                        HStack {
                            Text(dish.name)
                            Text(dish.price.description + " €")
                        }
                    }
                }
                VStack {
                    TextField("ajouter une entrée", text: $viewModel.starter)
                    TextField("prix", text: $viewModel.starterPrice)
                    Button(action: {viewModel.createDish(dishType: .starter)}) {
                        Image(systemName: "plus.app")
                    }
                }.padding(.horizontal)
                Text("Ajouter un plat")
                ForEach(viewModel.dishesList, id: \.self) { dish in
                    if dish.type == .dish {
                        HStack {
                            Text(dish.name)
                            Text(dish.price.description + " €")
                        }
                    }
                }
                VStack {
                    TextField("ajouter un plat", text: $viewModel.dish)
                    TextField("prix", text: $viewModel.dishPrice)
                    Button(action: {viewModel.createDish(dishType: .dish)}) {
                        Image(systemName: "plus.app")
                    }
                }.padding(.horizontal)
                .padding(.bottom)
                Button(action: {viewModel.sendMenu()}) {
                    Text("Valider")
                }
            }
        }.ignoresSafeArea()
        .padding(.top)
        .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Veuillez entrer un prix ou un plat"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SetMenuView(viewModel: SetMenuViewModel())
    }
}
