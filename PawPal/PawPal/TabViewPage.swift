//
//  TabViewPage.swift
//  PawPal
//
//  Created by StudentPM on 5/20/25.
//

import SwiftUI  // Import the SwiftUI framework for UI components

// Main view for the tab-based navigation page
struct TabViewPage: View {
    @State private var users: [User] = []  // State variable holding an array of User objects, mutable by the view
    
    // Custom initializer
    init() {
        // Make the tab bar background opaque white (instead of default transparent)
        UITabBar.appearance().backgroundColor = UIColor.white
    }
    
    // The body property defines the UI content and layout
    var body: some View {
        TabView {  // Creates a tab bar view container
            
            // First tab: ContentView, passing users binding to child view
            ContentView(users: $users)
                .tabItem {
                    Image(systemName: "1.square.fill")  // Tab icon
                    Text("Home")                        // Tab label
                }
            
            // Second tab: Home view
            Home()
                .tabItem {
                    Image(systemName: "2.square.fill")  // Tab icon
                    Text("Home")                        // Tab label (same label as first tab — maybe rename for clarity)
                }
            
            // Third tab: CommentSectionView (Ask Paw)
            CommentSectionView()
                .tabItem {
                    Image(systemName: "3.square.fill")  // Tab icon
                    Text("Ask Paw")                     // Tab label
                }
            
            // Fourth tab: Account view
            Account()
                .tabItem {
                    Image(systemName: "4.square.fill")  // Tab icon
                    Text("Account")                     // Tab label
                }
        }
    }
    
    // A separate computed property for the background image (not currently used in body)
    var background: some View {
        Image("Blank")               // Background image named "Blank"
            .resizable()            // Allow resizing of the image
            .scaledToFill()         // Scale to fill the container
            .ignoresSafeArea()      // Extend beyond safe area edges (go full screen)
    }
}

// Preview provider to render the TabViewPage in Xcode previews
#Preview {
    TabViewPage()
}

