//
//  Home.swift
//  PawPal
//
//  Created by StudentPM on 5/20/25.
//

import SwiftUI  // Import SwiftUI framework

// Model representing a user with a unique ID and username
struct fakeUser: Identifiable {
    let id = UUID()
    let username: String
}

// Model representing a reply to a post, identifiable by a unique ID and containing content text
struct PostReply: Identifiable {
    let id = UUID()
    let content: String
}

// Model representing a post, including the user who posted, description, like status, and any replies
struct Post: Identifiable {
    let id = UUID()
    let user: fakeUser
    let description: String
    var isLiked: Bool = false
    var replies: [PostReply] = []
}

struct Home: View {
    // State storing an array of posts displayed in the feed
    @State private var posts: [Post] = [
        Post(user: fakeUser(username: "Ellie"), description: "Top 10 scary creatures captured on footage"),
        Post(user: fakeUser(username: "Blueberry"), description: "Felt cute might delete later 🤪 "),
        Post(user: fakeUser(username: "Astrolambo"), description: "Just got a new aquarium tank :]"),
        Post(user: fakeUser(username: "Steve"), description: "I swear I am not this chopped, it's the camera 💔"),
        Post(user: fakeUser(username: "Morita"), description: "Bro thinks she's batman")
    ]

    // State to keep track of which post the user is currently replying to (index in posts array)
    @State private var replyingToIndex: Int? = nil
    // State holding the current text input of the reply box
    @State private var replyText: String = ""

    var body: some View {
        ZStack {
            Image("Blank")                      // Background image named "Blank"
                .resizable()                   // Make image resizable to fill view
                .edgesIgnoringSafeArea(.all)  // Extend image to cover entire screen edges

            ScrollView {                       // ScrollView to allow vertical scrolling through posts
                VStack(spacing: 16) {          // Vertical stack with spacing between posts

                    // MARK: Top Stories section (horizontal scroll)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            ForEach(posts) { post in
                                Circle()
                                    .fill(Color.white.opacity(0.5))   // Semi-transparent white circle background
                                    .frame(width: 60, height: 60)    // Fixed size circle
                                    .overlay(
                                        Image(post.user.username)     // User image named after username
                                            .resizable()
                                            .scaledToFill()
                                            .clipShape(Circle())       // Clip image inside circle shape
                                    )
                            }
                        }
                        .padding(.horizontal) // Horizontal padding around top stories
                    }

                    // MARK: Posts list
                    ForEach(posts.indices, id: \.self) { index in  // Iterate over indices of posts array
                        VStack(alignment: .leading, spacing: 8) {
                            
                            // Post user image with username overlay
                            ZStack(alignment: .topLeading) {
                                Image(posts[index].user.username)   // Post image named after username
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 350)              // Fixed height for image
                                    .frame(maxWidth: 400)            // Max width constraint
                                    .clipped()                      // Crop image to frame bounds
                                    .cornerRadius(12)               // Rounded corners

                                // User info (initial and username) overlayed on image top-left
                                HStack(spacing: 8) {
                                    Circle()
                                        .fill(Color.white.opacity(0.8))   // White semi-transparent circle
                                        .frame(width: 40, height: 40)
                                        .overlay(
                                            Text(String(posts[index].user.username.prefix(1))) // First letter of username
                                                .fontWeight(.bold)
                                                .foregroundColor(.black)
                                        )

                                    Text(posts[index].user.username)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .shadow(radius: 2)
                                }
                                .padding(10)  // Padding inside overlay
                            }

                            // Post description text below image
                            Text(posts[index].description)
                                .foregroundColor(.black)
                                .padding(.horizontal)

                            // Like and Reply buttons
                            HStack(spacing: 20) {
                                Button {
                                    posts[index].isLiked.toggle()   // Toggle like status
                                } label: {
                                    Image(systemName: posts[index].isLiked ? "heart.fill" : "heart")  // Filled or empty heart icon
                                        .tint(posts[index].isLiked ? .red : .black)  // Red if liked, black otherwise
                                        .font(.system(size: 24))
                                }

                                Button {
                                    replyingToIndex = index          // Set reply index to current post
                                } label: {
                                    Text("Reply")
                                        .fontWeight(.bold)
                                }
                            }
                            .padding(.horizontal)

                            // Display all replies below the buttons
                            ForEach(posts[index].replies) { reply in
                                HStack(alignment: .top) {
                                    Image(systemName: "arrowshape.turn.up.left.fill")  // Reply arrow icon
                                        .foregroundColor(.gray)
                                    Text(reply.content)
                                        .foregroundColor(.gray)
                                }
                                .padding(.leading)  // Indent replies
                            }

                            // Show reply input field and post button if replying to this post
                            if replyingToIndex == index {
                                VStack(alignment: .leading) {
                                    TextField("Your reply...", text: $replyText)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())

                                    Button("Post Reply") {
                                        if !replyText.isEmpty {
                                            posts[index].replies.append(PostReply(content: replyText))  // Add new reply
                                            replyText = ""              // Clear input field
                                            replyingToIndex = nil       // Close reply input
                                        }
                                    }
                                    .padding(.top, 4)
                                }
                                .padding(.horizontal)
                            }
                        }
                        .padding()
                        .background(Color(red: 254/255, green: 255/255, blue: 212/255))  // Light yellow background for post card
                        .cornerRadius(12)
                        .padding(.horizontal)
                        .frame(maxWidth: 400)      // Limit post width
                        .frame(maxWidth: .infinity) // Center post horizontally inside ScrollView
                    }

                    Spacer(minLength: 50)  // Extra space at the bottom
                }
                .padding(.top)
            }
        }
    }
}

#Preview {
    Home()   // Preview the Home view
}

