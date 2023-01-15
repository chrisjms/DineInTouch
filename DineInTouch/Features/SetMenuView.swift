//
//  ContentView.swift
//  DineInTouch
//
//  Created by Chris on 14/01/2023.
//

import SwiftUI

struct SetMenuView: View {
    @StateObject var viewModel: SetMenuViewModel
    @State var xOffset: CGFloat = CGFloat.zero
    @State var index : Int = 1
    @State var offset: CGFloat = UIScreen.main.bounds.width
    var body: some View {
        ZStack {
            Color.gray.opacity(0.6)
            VStack {
                HStack(spacing: 0) {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.green)
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                        VStack {
                            Text("Ajouter une entrée")
                            ForEach(viewModel.dishesList, id: \.self) { dish in
                                if dish.type == .appetizer {
                                    HStack {
                                        Text(dish.name)
                                        Text("\(dish.price)")
                                    }
                                }
                            }
                            HStack {
                                TextField("ajouter une entrée", text: $viewModel.appetizer)
                                TextField("prix", text: $viewModel.appetizerPrice)
                                Button(action: {self.viewModel.createDish(dishType: .appetizer)}) {
                                    Image(systemName: "plus.app")
                                }
                            }.padding(.horizontal)
                        }
                    }
                    ZStack {
                        Rectangle()
                            .foregroundColor(.red)
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                        VStack {
                            Text("Ajouter un plat")
                            ForEach(viewModel.dishesList, id: \.self) { dish in
                                if dish.type == .dish {
                                    HStack {
                                        Text(dish.name)
                                        Text("\(dish.price)")
                                    }
                                }
                            }
                            HStack {
                                TextField("ajouter un plat", text: $viewModel.dish)
                                TextField("prix", text: $viewModel.dishPrice)
                                Button(action: {self.viewModel.createDish(dishType: .dish)}) {
                                    Image(systemName: "plus.app")
                                }
                            }.padding(.horizontal)
                        }
                    }
                    ZStack {
                        Rectangle()
                            .foregroundColor(.blue)
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                        VStack {
                            Text("Ajouter un dessert")
                            ForEach(viewModel.dishesList, id: \.self) { dish in
                                if dish.type == .dessert {
                                    HStack {
                                        Text(dish.name)
                                        Text("\(dish.price)")
                                    }
                                }
                            }
                            HStack {
                                TextField("ajouter un dessert", text: $viewModel.dessert)
                                TextField("prix", text: $viewModel.dessertPrice)
                                Button(action: {self.viewModel.createDish(dishType: .dessert)}) {
                                    Image(systemName: "plus.app")
                                }
                            }.padding(.horizontal)
                        }
                    }
                }
                .offset(x: self.offset)
                    .highPriorityGesture(DragGesture()
                        .onEnded { value in
                        if value.translation.width > 50 {
                            if self.index != 0 {
                                self.index -= 1
                            }
                            if self.index == 1 {
                                self.offset = UIScreen.main.bounds.width
                            } else if self.index == 2 {
                                self.offset = 2
                            } else {
                                self.offset = -UIScreen.main.bounds.width
                            }
                        }
                        if -value.translation.width > 50 {
                            if self.index != 3 {
                                self.index += 1
                            }
                            if self.index == 1 {
                                self.offset = UIScreen.main.bounds.width
                            } else if self.index == 2 {
                                self.offset = 2
                            } else {
                                self.offset = -UIScreen.main.bounds.width
                            }
                        }
                    })
                HStack {
                    if self.index == 2 {
                        Button(action: {self.index = 1
                            self.offset = UIScreen.main.bounds.width
                        }) {
                            Text("view 1")
                        }
                    }
                    if self.index == 1 || self.index == 3 {
                        Button(action: {self.index = 2
                            self.offset = 0
                        }) {
                            Text("view 2")
                        }
                    }
                    if self.index == 2 {
                        Button(action: {self.index = 3
                            self.offset = -UIScreen.main.bounds.width
                        }) {
                            Text("view 3")
                        }
                    }
                    if self.index == 3 {
                        Button(action: {self.viewModel.sendMenu()}) {
                            Text("Valider")
                        }
                    }
                }.padding(.bottom, 100)
            }.animation(.default)
        }.ignoresSafeArea()
        .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Veuillez entrer un prix ou un plat"))
        }
        .fullScreenCover(isPresented: $viewModel.goToCommandView) {
            CommandView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SetMenuView(viewModel: SetMenuViewModel())
    }
}
