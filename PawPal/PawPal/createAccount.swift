//
//  createAccount.swift
//  PawPal
//
//  Created by StudentPM on 5/7/25.
//

import SwiftUI  // Import SwiftUI framework for UI components

// User model to hold user info
struct User {
    var name: String = ""       // Full name of the user
    var email: String = ""      // Email address
    var userName: String = ""   // Username for login
    var password: String = ""   // Password for login
}

struct createAccount: View {
    
    // Binding to the users array from the parent view so we can add new users
    @Binding var users: [User]
    
    @State var changePage: Bool = false  // Bool to trigger navigation after account creation
    
    // State variables to hold the inputs from the user
    @State var newName: String = ""       // New user's full name input
    @State var newEmail: String = ""      // New user's email input
    @State var newUserName: String = ""   // New user's username input
    @State var newPassword: String = ""   // New user's password input
    
    @State private var errorMessage: String = ""  // String to hold error messages
    @State private var showError: Bool = false    // Bool to toggle error message visibility
    @State private var accountCreated: Bool = false  // Bool to track if account creation succeeded
   
    var body: some View {
        NavigationView {  // Navigation container for screen navigation
            ZStack {      // Stack views on top of each other
                Image("Blank")  // Background image named "Blank"
                    .resizable()  // Make the image resizable to fill the view
                    .ignoresSafeArea()  // Make sure it fills the entire screen area
                
                VStack {  // Vertical stack for input fields and buttons
                    Text("Create Account")  // Title text
                        .foregroundColor(.white)  // White font color
                        .fontWeight(.bold)       // Bold font weight
                        .font(.system(size: 40)) // Font size 40
                    
                    // TextField for full name input, bound to newName state
                    TextField("Full Name...", text: $newName)
                        .padding()             // Padding inside the text field
                        .background(Color.white)  // White background for input
                        .cornerRadius(12)         // Rounded corners
                        .frame(width: 360)        // Fixed width for input
                    
                    // TextField for email input, bound to newEmail state
                    TextField("Email...", text: $newEmail)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                        .frame(width: 360)
                    
                    // Horizontal stack for username and password fields side by side
                    HStack {
                        // Username input field bound to newUserName
                        TextField("Username...", text: $newUserName)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(12)
                            .frame(width: 175)
                        
                        // Password input field bound to newPassword
                        TextField("Password...", text: $newPassword)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(12)
                            .frame(width: 175)
                    }
    
                    ZStack {  // Stack for paw image and enter button
                        Image("PawTrail")  // Decorative paw trail image
                            .resizable()
                            .renderingMode(.template)  // Enable tinting of the image
                            .foregroundColor(Color(red: 254/255, green: 255/255, blue: 212/255))  // Light yellow color
                            .frame(width: 330, height: 380)  // Size of the paw trail image
                            .rotationEffect(.degrees(-95))   // Rotate image by -95 degrees
                            .offset(y: -30)                  // Shift up by 30 points
                        
                        // Hidden navigation link triggered when changePage becomes true
                        NavigationLink(destination: logIn(users: $users).navigationBarBackButtonHidden(true), isActive: $changePage) {
                            EmptyView()  // No visible UI element
                        }
                        
                        // Enter button triggering the SignIn() function and page change
                        Button(action: {
                            SignIn()       // Validate and attempt to create account
                            changePage = true  // Trigger navigation if account creation succeeded
                        }, label: {
                            ZStack {
                                // Circular yellow background for the button
                                Circle()
                                    .fill(Color(red: 254/255, green: 255/255, blue: 212/255))
                                    .frame(width: 230)
                                // Paw image in red on top of circle
                                Image("Paw")
                                    .resizable()
                                    .renderingMode(.template)
                                    .foregroundColor(Color(red: 232/255, green: 86/255, blue: 86/255))
                                    .frame(width: 150, height: 150)
                                
                                // Text label "Enter" below paw image
                                Text("Enter")
                                    .foregroundColor(.white)
                                    .font(.title2)
                                    .fontWeight(.heavy)
                                    .offset(y: 40)  // Move text down by 40 points
                            }
                        })
                        .offset(y: 100)  // Move button down by 100 points
                    }
                }
            }
        }
    }
    
    // Function to handle sign in / account creation validation
    func SignIn() {
        // Check if any field is empty
        if newUserName.isEmpty || newEmail.isEmpty || newPassword.isEmpty || newName.isEmpty {
            errorMessage = "Please Fill all fields"  // Set error message
            showError = true                          // Show error (not currently displayed in UI)
        } else {
            // Create a new User object with input fields
            let newUser: User = User(name: newName, email: newEmail, userName: newUserName, password: newPassword)

            // Check if username already exists
            for user in users {
                if newUserName == user.userName {
                    errorMessage = "Username already exist"  // Set error message
                    showError = true
                    accountCreated = false
                    
                    // Clear the input fields
                    newUserName = ""
                    newEmail = ""
                    newPassword = ""
                }
            }
            // Note: You might want to add the new user to the users array here if validation passes
        }
    }
}

// Preview provider for Xcode canvas
#Preview {
    // Use .constant([]) since users is a @Binding, provide empty user array for preview
    createAccount(users: .constant([]))
}

