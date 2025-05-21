//  Account.swift
//  PawPal
//
//  Created by StudentPM on 5/20/25.
//

import SwiftUI  // Import the SwiftUI framework for building UI

// Main Account view struct
struct Account: View {
    @State private var isEditing = false  // State to toggle between viewing and editing mode
    @State private var bio = ""           // State to hold user's bio text
    @State private var selectedImage = "paw"  // State to hold the selected profile image name
    
    var body: some View {
        // Conditional view depending on whether editing mode is active
        if isEditing {
            // Show the EditAccountPage when editing
            EditAccountPage(bio: $bio, selectedImage: $selectedImage, isEditing: $isEditing)
        } else {
            // Regular view of the Account page
            VStack(spacing: 0) {
                // Top section with background image and overlays
                ZStack(alignment: .topLeading) {
                    Image("Blank")               // Background image named "Blank"
                        .resizable()             // Make image resizable
                        .scaledToFill()          // Scale to fill the frame
                        .frame(height: 330)      // Set fixed height for the image
                        .clipped()               // Clip to frame bounds
                    
                        // Overlay a circle with a paw image centered
                        .overlay(
                            ZStack {
                                Circle()        // Circle shape for background
                                    .fill(Color(red: 254/255, green: 255/255, blue: 212/255)) // Light yellow fill color
                                    .frame(width: 180, height: 180) // Fixed circle size
                                
                                Image("Paw")   // Paw image on top of circle
                                    .resizable() // Make resizable
                                    .renderingMode(.template)  // Use template rendering for tint
                                    .foregroundColor(Color(red: 232/255, green: 86/255, blue: 86/255)) // Red tint color
                                    .frame(width: 120, height: 120) // Fixed image size
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity) // Take all available space in overlay
                            .allowsHitTesting(false)  // Disable interaction for this overlay on Account page
                        )
                        // Overlay username text at the bottom left corner
                        .overlay(
                            VStack {
                                Spacer()  // Push content to bottom
                                HStack {
                                    Text("UserName")    // Placeholder username text
                                        .font(.title)   // Title font size
                                        .bold()         // Bold text
                                        .foregroundColor(.white)  // White text color
                                        .padding([.leading, .bottom]) // Padding from left and bottom edges
                                    Spacer()  // Push username text to left
                                }
                            }
                        )
                    
                    // Pencil icon button on top-left for entering edit mode
                    Button(action: {
                        isEditing = true      // Switch to editing mode when pressed
                    }) {
                        Image(systemName: "pencil")   // Pencil icon from SF Symbols
                            .font(.system(size: 30, weight: .bold)) // Font size and weight for icon
                            .foregroundColor(.white)  // White icon color
                            .padding()                 // Padding around button content
                    }
                }
                
                // User info section below the image
                VStack(alignment: .leading, spacing: 8) {
                    Image(selectedImage)    // Show selected profile image
                        .resizable()       // Resizable image
                        .frame(width: 100, height: 100) // Fixed size square
                        .clipShape(Circle()) // Clip image into a circle
                    
                    Text(bio)              // Show user's bio text
                        .font(.body)       // Use body font
                    
                    Divider()              // Divider line separator
                        .frame(minHeight: 3)  // Minimum height for divider
                        .background(Color.black) // Black color for divider
                    
                    HStack {
                        Text("Followers:")   // Label for followers count
                            .foregroundColor(.indigo)  // Indigo text color
                        Text("-100000")       // Placeholder follower count
                            .foregroundColor(.brown)   // Brown text color
                        Text("Following:")   // Label for following count
                            .foregroundColor(.indigo)  // Indigo text color
                        Text("76")            // Placeholder following count
                            .foregroundColor(.brown)   // Brown text color
                    }
                    .padding()              // Padding around follower/following row
                    
                    Text("ABOUT THIS USER:")  // Section title
                    
                    Text("Full Name:")       // Label for full name
                        .foregroundColor(.gray)  // Gray text color
                    Text("Really Cool Name")  // Placeholder full name
                        .foregroundColor(.brown) // Brown text color
                    
                    Text("Contact:")         // Label for contact info
                        .foregroundColor(.gray)  // Gray text color
                    Text("exampleXgmail.com") // Placeholder email/contact
                        .foregroundColor(.brown) // Brown text color
                }
                .padding(.horizontal)     // Horizontal padding for user info section
                .frame(maxWidth: .infinity, alignment: .leading)  // Expand width and align left
                
                Spacer()  // Push content to top
                
            }
            .ignoresSafeArea(edges: .top) // Extend view behind status bar on top
        }
    }
}

// View for editing account details
struct EditAccountPage: View {
    @Binding var bio: String          // Binding to bio text from parent
    @Binding var selectedImage: String // Binding to selected profile image from parent
    @Binding var isEditing: Bool      // Binding to editing state from parent
    
    @State private var tempBio: String = ""       // Temporary bio for editing
    @State private var tempImage: String = ""     // Temporary selected image for editing
    @State private var showingPicker = false      // State to show/hide image picker dialog
    
    let imageOptions = ["Bear", "Cat", "Dog"]     // Options for selectable profile images
    
    var body: some View {
        VStack(spacing: 0) {
            // Top background image with overlays
            ZStack(alignment: .topLeading) {
                Image("Blank")             // Background image "Blank"
                    .resizable()           // Make image resizable
                    .scaledToFill()        // Scale to fill the frame
                    .frame(height: 330)    // Fixed height
                    .clipped()             // Clip image to frame
                    
                    // Overlay clickable paw circle for changing profile image
                    .overlay(
                        ZStack {
                            Button(action: {
                                showingPicker = true  // Show image picker dialog when clicked
                            }) {
                                ZStack {
                                    Circle()      // Circle background
                                        .fill(Color(red: 254/255, green: 255/255, blue: 212/255)) // Light yellow fill
                                        .frame(width: 180, height: 180)  // Fixed size
                                    
                                    Text("click to change") // Instruction text inside circle
                                }
                            }
                            .buttonStyle(PlainButtonStyle())  // Remove default button style
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity) // Fill overlay space
                    )
                    // Username text overlay bottom left
                    .overlay(
                        VStack {
                            Spacer()  // Push to bottom
                            HStack {
                                Text("UserName")     // Username text placeholder
                                    .font(.title)    // Title font
                                    .bold()          // Bold font weight
                                    .foregroundColor(.white)  // White text
                                    .padding([.leading, .bottom])  // Padding from left and bottom
                                Spacer()  // Push to left
                            }
                        }
                    )
                
                // Chevron back button on top-left to save changes and exit editing
                Button(action: {
                    bio = tempBio           // Save temp bio to actual bio
                    selectedImage = tempImage  // Save temp image to actual selected image
                    isEditing = false       // Exit editing mode
                }) {
                    Image(systemName: "chevron.left")  // Chevron back icon
                        .font(.system(size: 30, weight: .bold))  // Font size and weight
                        .foregroundColor(.white)        // White icon color
                        .padding()                      // Padding around button
                }
            }

            // Form section for bio and user info
            VStack(alignment: .leading) {
                TextField("Add Bio...", text: $tempBio)  // Editable text field bound to tempBio
                    .textFieldStyle(RoundedBorderTextFieldStyle())  // Rounded border style
                
                Divider()    // Divider line
                    .frame(minHeight: 3)  // Min height
                    .background(Color.black)  // Black color
                
                HStack {
                    Text("Followers:")   // Followers label
                        .foregroundColor(.indigo)  // Indigo color
                    Text("-100000")      // Placeholder follower count
                        .foregroundColor(.brown)   // Brown color
                    Text("Following:")   // Following label
                        .foregroundColor(.indigo)  // Indigo color
                    Text("76")           // Placeholder following count
                        .foregroundColor(.brown)   // Brown color
                }
                .padding()   // Padding around follower/following row
                
                Text("ABOUT THIS USER:")  // Section title
                
                Text("Full Name:")       // Full name label
                    .foregroundColor(.gray)  // Gray color
                Text("Really Cool Name")  // Placeholder full name
                    .foregroundColor(.brown) // Brown color
                
                Text("Contact:")          // Contact label
                    .foregroundColor(.gray)  // Gray color
                Text("exampleXgmail.com")  // Placeholder contact info
                    .foregroundColor(.brown) // Brown color
            }
            .padding()   // Padding around form
            .frame(maxWidth: .infinity, alignment: .leading)  // Expand width, align left
            
            Spacer()    // Push content up
            
        }
        .ignoresSafeArea(edges: .top)  // Extend behind status bar
        
        .onAppear {
            // Initialize temp variables with current bio and selected image when view appears
            tempBio = bio
            tempImage = selectedImage
        }
        
        // Confirmation dialog for image selection options
        .confirmationDialog("Choose Profile Picture", isPresented: $showingPicker) {
            ForEach(imageOptions, id: \.self) { option in
                Button(option.capitalized) {
                    tempImage = option   // Update tempImage when option selected
                }
            }
        }
    }
}

#Preview {
    Account()   // Preview the Account view
}

