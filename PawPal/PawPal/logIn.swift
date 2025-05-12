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
                    .offset(y: -110)
                
//                Spacer()
                VStack{
                    Text("log in")
                    Text("Welcome Back!")
                    
                    TextField("Username", text: $name)
                        .padding()
                        .background(Color.gray)
                    TextField("Username", text: $name)
                        .padding()
                        .background(Color.gray)
                }
            }
        }
        .padding()
    }
}

#Preview {
    logIn()
}
