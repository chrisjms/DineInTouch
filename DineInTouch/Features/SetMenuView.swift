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
                        }
                    }
                    ZStack {
                        Rectangle()
                            .foregroundColor(.red)
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                        VStack {
                            Text("Ajouter un plat")
                        }
                    }
                    ZStack {
                        Rectangle()
                            .foregroundColor(.blue)
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                        VStack {
                            Text("Ajouter un dessert")
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SetMenuView(viewModel: SetMenuViewModel())
    }
}
