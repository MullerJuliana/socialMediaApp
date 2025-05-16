//
//  createAccount.swift
//  PawPal
//
//  Created by StudentPM on 5/7/25.
//

import SwiftUI

struct createAccount: View {
    @State var name: String = ""
    var body: some View {
        NavigationView{
            ZStack{
                Image("Blank")
                    .resizable()
                    .frame(width: 600, height: 1130) // Specific size for the image
                
                VStack{
                    Text("Create Account")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .font(.system(size: 40))
                    
                    TextField("Username", text: $name)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                        .frame(width: 220)
                        
                    TextField("Username", text: $name)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                        .frame(width: 220)
                    
                    TextField("Username", text: $name)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                        .frame(width: 220)
                    
                    ZStack{
                        Image("PawTrail")
                            .resizable()
                            .renderingMode(.template) // Makes it tintable
                            .foregroundColor(Color(red: 254/255, green: 255/255, blue: 212/255))
                            .frame(width: 330, height: 380)
                            .rotationEffect(.degrees(-95))
                        
                        PawButton()
                            .offset(y:130)
                    }
                    
                }
            }
        }
    }
}

#Preview {
    createAccount()
}
