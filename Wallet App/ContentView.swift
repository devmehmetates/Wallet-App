//
//  ContentView.swift
//  Wallet App
//
//  Created by Mehmet Ateş on 21.11.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var cardColor = Color.red
    private let cardColors = [Color.red , Color.black , Color.blue , Color.mint , Color.teal ,Color.purple]
    @State private var cardName = ""
    @State private var userID = ""
    
    var body: some View {
        VStack{
            HStack{
                Text("Enroll")
                    .bold()
                Spacer()
                Image(systemName: "creditcard")
                
            }.font(.largeTitle)
                .padding()
            GeometryReader { proxy in
                let size = proxy.size
                VStack{
                    ZStack{
                        Rectangle()
                            .foregroundColor(self.cardColor)
                            .cornerRadius(16)
                        VStack{
                            Spacer()
                            HStack{
                                Text("Bank Name")
                                    .font(.largeTitle)
                                    .bold()
                                Spacer()
                            }
                            Spacer(minLength: size.width * 0.15)
                            HStack{
                                Text("5300 4827 0000 0000")
                                    .font(.title2)
                                Spacer()
                                Image(systemName: "wifi")
                                    .rotationEffect(.degrees(90))
                            }
                           Spacer()
                            HStack{
                                Spacer()
                                Text(self.cardName)
                                    .font(.title3)
                                    .bold()
                            }
                            Spacer()
                        }.padding()
                            .foregroundColor(.white)
                    }.frame(height: size.width * 0.6)
                    List {
                        Section(header: Text("Personel Info")) {
                            TextField("Enter Your Name", text: self.$cardName)
                            TextField("Enter Your Identification Number",text: self.$userID)
                                
                                
                        }
                        .headerProminence(.increased)
                    }
                    .listStyle(.plain)
                    .frame(height: size.height * 0.23)
                   
                    
                    List{
                        Section {
                            
                        } header: {
                            Text("Card Color")
                        }

                    }.listStyle(.plain)
                        .frame(height: size.height * 0.1)
                        
                    HStack{
                        ForEach(self.cardColors, id: \.self) {
                            a in
                            Button {
                                withAnimation {
                                    self.cardColor = a
                                }
                            } label: {
                                Circle()
                                    .frame(height: size.height * 0.05)
                                    .foregroundColor(a)
                                    .overlay(Circle().stroke(.white,lineWidth: self.cardColor == a ? 2 : 0))
                                    .shadow(radius: self.cardColor == a ? 2 : 0)
                            }
                        }
                    }.padding(.horizontal)
                    Spacer()
                }.frame(width: size.width - 30, height: size.height)
                    .padding(.horizontal)
            
            }
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
