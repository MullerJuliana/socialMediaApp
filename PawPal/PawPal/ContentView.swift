//
//  ContentView.swift
//  PawPal
//
//  Created by StudentPM on 5/7/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            ZStack{
                Image("contentView")
                    .resizable() // Makes image resizable to fit the frame
                    .frame(width: 600, height: 1130) // Specific size for the image
                    .offset(y: -110)
                VStack {
                    Text("Welcome to PawPal!")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .font(.system(size: 30))
                        .offset(y: -30)
                    Text("What would you like to do?")
                        .foregroundColor(.white)
                        .offset(y: -20)
                    
                    NavigationLink(destination: logIn()) {
                        Text("Log In")
                            .padding()
                            .frame(width: 200)
//                            .background(Color(red: 232/255, green: 46/255, blue: 91/255))
                            .foregroundColor(.white)
                            .cornerRadius(12)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .background(
                                    LinearGradient(gradient: Gradient(colors: [.mint, .yellow]), startPoint: .leading, endPoint: .bottom)
                                )
                            .cornerRadius(12)
                            .shadow(radius: 3, x:0, y: 5)
                    }
                    .padding()
                    NavigationLink(destination: createAccount()) {
                        Text("Create Account")
                            .padding()
                            .frame(width: 200)
//                            .background(Color(red: 232/255, green: 46/255, blue: 91/255))
                            .foregroundColor(.white)
                            
                            .font(.title2)
                            .fontWeight(.semibold)
                            .background(
                                    LinearGradient(gradient: Gradient(colors: [.purple, .teal]), startPoint: .leading, endPoint: .bottom)
                                )
                            .cornerRadius(12)
                            .shadow(radius: 3, x:0, y: 5)
                    }
                }
                .offset(y: -160)
            }
        .padding()
        }
    }
}

#Preview {
    ContentView()
}
