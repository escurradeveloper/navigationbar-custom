//
//  ContentView.swift
//  Clase22NavigationBarCustom
//
//  Created by Escurra Colquis on 15/10/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $selection)  {
            ListView()
                .tabItem {
                    Label("Lista", systemImage: "list.star")
                }
                .tag(0)
            
            Text("Pagar")
                .bold()
                .font(.system(size: 50))
                .tabItem {
                    Label("Pagar", systemImage: "dollarsign")
                }
                .tag(1)
            
            Text("Calendario")
                .bold()
                .font(.system(size: 50))
                .tabItem {
                    Label("Calendario", systemImage: "calendar")
                }
                .tag(2)
            
            Text("Mi cuenta")
                .bold()
                .font(.system(size: 50))
                .tabItem {
                    Label("Perfil", systemImage: "person")
                }
                .tag(3)
        }
        .onAppear() {
            UITabBar.appearance().barTintColor = UIColor(.white)
            UITabBar.appearance().backgroundColor = UIColor(.white)
        }
    }
}

struct ListView: View {
    @State private var tapButton = false
    
    var body: some View {
        NavigationStack {
            List(1...20, id: \.self) { index in
                NavigationLink {
                    DetailListView(index: .constant(index))
                      .toolbar(.hidden, for: .tabBar)
                } label: {
                        HStack {
                            Text("Celda: ")
                            Text("\(index)")
                                .bold()
                                .font(.system(size: 20))
                        }
                }
            }
            .listStyle(.insetGrouped)
            .navigationBarHidden(true)
            .safeAreaInset(edge: .top) {
                            VStack {
                                HStack() {
                                    Spacer()
                                    Text("TabView en SwiftUI")
                                        .font(.title.weight(.bold))
                                    Spacer()
                                    Button {
                                        self.tapButton.toggle()
                                    } label: {
                                        Image(systemName: "plus")
                                            .foregroundStyle(.white)
                                            .font(.system(size: 30, weight: .medium))
                                    }
                                }
                            }
                            .padding()
                            .background(LinearGradient(colors: [.green.opacity(0.3), .blue.opacity(0.5)],
                                                       startPoint: .topLeading, endPoint: .bottomTrailing)
                                            .overlay(.ultraThinMaterial)
                            )
            }
            .sheet(isPresented: $tapButton) {
                Text("Pantalla Modal")
                    .presentationDetents([.medium, .large])
            }
        }
    }
}

struct DetailListView: View {
    @Binding var index: Int
    
    var body: some View {
        Spacer()
        HStack {
            Text("Seleccionaste: ")
                .font(.system(size: 30))
            Text("\(index)")
                .bold()
                .font(.system(size: 40))
        }
        Spacer()
    }
}
#Preview {
    ContentView()
}
