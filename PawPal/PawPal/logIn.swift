//
//  logIn.swift
//  PawPal
//
//  Created by StudentPM on 5/7/25.
//

import SwiftUI

struct logIn: View {
    @State var name: String = ""
    var body: some View {
        NavigationView{
            ZStack{
                Image("LogIn")
                    .resizable() // Makes image resizable to fit the frame
                    .frame(width: 600, height: 1130) // Specific size for the image
                    .offset(y: -60)
                
//                Spacer()
                VStack{
                    Text("Log in")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .font(.system(size: 60))
                        .offset(y: -60)
                        
                    Text("Welcome Back!")
                        .foregroundColor(.white)
                        .offset(y: -50)
                        .font(.system(size: 22))
                    
                    TextField("Username", text: $name)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                        .offset(y: -25)
                    
                    SecureField("Username", text: $name)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                        .offset(y: -20)
                }
                .offset(y: -180)
                .frame(width: 220)
                
                NavigationLink(destination: createAccount()) {
                    Text("Enter")
                        .padding()
                        .frame(width: 100)
                        .foregroundColor(.white)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .background(Color(red: 171/255, green: 200/255, blue: 52/255))
                        .cornerRadius(12)
                        .offset(y: -34)
                    }
                VStack{
                    Text("Forgot Password?")
                    Text("Wrong Username/Password!")
                        .foregroundColor(.yellow)
                }
                .offset(y: 30)
            }
        }
    }
}

#Preview {
    logIn()
}
