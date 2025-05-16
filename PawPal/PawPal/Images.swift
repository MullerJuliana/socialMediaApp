//
//  Images.swift
//  PawPal
//
//  Created by StudentPM on 5/15/25.
//

import SwiftUI

struct PawButton: View {
    var body: some View {
        NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true)) {
            ZStack {
            
                Circle()
                    .fill(Color(red: 254/255, green: 255/255, blue: 212/255))
                    .frame(width: 230)
                Image("Paw")
                    .resizable()
                    .renderingMode(.template) // Makes it tintable
                    .foregroundColor(Color(red: 232/255, green: 86/255, blue: 86/255))
                    .frame(width: 150, height: 150)
                
                Text("Enter")
                    .foregroundColor(.white)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .offset(y:40)
            }
           
        }
    }
}

struct vet: View{
    var body: some View{
        Image("vet")
            .resizable()
            .frame(width: 280, height: 270) // Specific size for the image
    }
}


#Preview {
    vet()
}
