//
//  logIn.swift
//  PawPal
//
//  Created by StudentPM on 5/7/25.
//

import SwiftUI  // Import SwiftUI framework for building UI

struct logIn: View {
    @State var name: String = ""           // State variable to hold input text for username (but currently used for both username & password fields)
    @Binding var users: [User]             // Binding to users array from parent view to access user data
    
    var body: some View {
        NavigationView {                   // Navigation container for screen transitions
            ZStack {                      // Stack views on top of each other
                
                Image("LogIn")             // Background image named "LogIn"
                    .resizable()          // Make the image resizable to fill specified frame
                    .frame(width: 600, height: 1130)  // Set image frame size
                    .offset(y: -60)       // Shift image upwards by 60 points
                
                VStack {                   // Vertical stack for text fields and titles
                    Text("Log in")        // Title text
                        .foregroundColor(.white)     // White text color
                        .fontWeight(.bold)            // Bold font weight
                        .font(.system(size: 60))      // Large font size
                        .offset(y: -60)               // Move text upward by 60 points
                        
                    Text("Welcome Back!")  // Subtitle text
                        .foregroundColor(.white)
                        .offset(y: -50)               // Move up by 50 points
                        .font(.system(size: 22))      // Smaller font size
                    
                    TextField("Username", text: $name)  // TextField for username input, bound to 'name'
                        .padding()              // Padding inside text field
                        .background(Color.white)  // White background for the input
                        .cornerRadius(12)       // Rounded corners
                        .offset(y: -25)         // Move up by 25 points
                    
                    SecureField("Username", text: $name)  // SecureField for password input, also bound to 'name' (likely an error, should be separate state var)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                        .offset(y: -20)         // Move up by 20 points
                }
                .offset(y: -180)              // Move entire VStack up by 180 points
                .frame(width: 220)            // Fixed width for the VStack
                
                NavigationLink(destination: Home()) {  // NavigationLink to go to Home screen when tapped
                    Text("Enter")              // Button label
                        .padding()             // Padding around text
                        .frame(width: 100)     // Fixed width for button
                        .foregroundColor(.white) // White text color
                        .font(.title2)         // Font size and style
                        .fontWeight(.semibold) // Semi-bold font weight
                        .background(Color(red: 171/255, green: 200/255, blue: 52/255))  // Greenish background color
                        .cornerRadius(12)     // Rounded corners
                        .offset(y: -34)       // Move button up by 34 points
                }
                
                VStack {                      // VStack for error message display (currently static, no logic to show/hide)
                    Text("Wrong Username/Password!")  // Error message text
                }
                .offset(y: 30)                // Move error message down by 30 points
            }
        }
    }
}

#Preview {
    logIn(users: .constant([]))            // Preview the logIn view with an empty users array binding
}

