//
//  ContentView.swift
//  PawPal
//
//  Created by StudentPM on 5/7/25.
//

import SwiftUI  // Import SwiftUI framework for building UI

// Main content view of the app
struct ContentView: View {
    @Binding var users: [User]  // Binding to an array of User objects, shared/mutated with a parent view

    var body: some View {
        NavigationView {  // Provides a navigation stack with navigation bar and navigation links
            ZStack {  // Stack views on top of each other
                Image("ContentView")  // Background image named "ContentView"
                    .resizable()       // Allow the image to resize
                    .frame(width: 600, height: 1130)  // Fix the image size to these dimensions
                    .offset(y: -110)   // Move the image up by 110 points
                
                VStack {  // Vertical stack for the content (texts and buttons)
                    Text("Welcome to PawPal!")  // Welcome message
                        .foregroundColor(.white)  // White text color
                        .fontWeight(.bold)        // Bold font weight
                        .font(.system(size: 30))  // Custom font size 30
                        .offset(y: -30)           // Move text up by 30 points
                    
                    Text("What would you like to do?")  // Subtitle prompt
                        .foregroundColor(.white)  // White text color
                        .offset(y: -20)           // Move text up by 20 points
                    
                    // NavigationLink to navigate to Log In screen
                    NavigationLink(destination: logIn(users: $users)) {
                        Text("Log In")  // Button text
                            .padding()  // Padding around the text
                            .frame(width: 200)  // Fixed width for button
                            .foregroundColor(.white)  // White text color
                            .cornerRadius(12)  // Rounded corners
                            .font(.title2)  // Font size style title2
                            .fontWeight(.semibold)  // Semi-bold font weight
                            .background(
                                LinearGradient(gradient: Gradient(colors: [.mint, .yellow]), startPoint: .leading, endPoint: .bottom)
                            )  // Gradient background from mint to yellow
                            .cornerRadius(12)  // Rounded corners (repeated, can be combined)
                            .shadow(radius: 3, x: 0, y: 5)  // Drop shadow with radius and offset
                    }
                    .padding()  // Padding around the button
                    
                    // NavigationLink to navigate to Create Account screen
                    NavigationLink(destination: createAccount(users: $users)) {
                        Text("Create Account")  // Button text
                            .padding()  // Padding around text
                            .frame(width: 200)  // Fixed width button
                            .foregroundColor(.white)  // White text color
                            .font(.title2)  // Font size style title2
                            .fontWeight(.semibold)  // Semi-bold font weight
                            .background(
                                LinearGradient(gradient: Gradient(colors: [.purple, .teal]), startPoint: .leading, endPoint: .bottom)
                            )  // Gradient background from purple to teal
                            .cornerRadius(12)  // Rounded corners
                            .shadow(radius: 3, x: 0, y: 5)  // Drop shadow
                    }
                }
                .offset(y: -160)  // Move entire VStack content up by 160 points
            }
        }
    }
}

// Preview provider for Xcode canvas previews with an empty user array binding
#Preview {
    ContentView(users: .constant([]))
}

