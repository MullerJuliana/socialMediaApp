//
//  AskPaw.swift
//  PawPal
//
//  Created by StudentPM on 5/16/25.
//

import SwiftUI

// Data Models

//reply to a comment struct
struct Reply: Identifiable {
    var id = UUID()                  // Unique ID for each reply
    var content: String              // Text content of the reply
}

// comment or question struct
struct Comment: Identifiable {
    var id = UUID()                  // Unique ID for each comment
    var title: String                // Title or headline of the comment
    var content: String              // Main body text of the comment
    var isLiked: Bool = false        // Tracks whether this comment is liked
    var replies: [Reply] = []        // Array of replies to this comment
}

// Comment Section View

struct CommentSectionView: View {
    // MARK: - State Variables
    @State private var comments: [Comment] = [
        Comment(title: "Why is my cat so fat", content: "she stepped on the bed and the whole thing just broke, is it normal?"),
        
        Comment(title: "Is it okay for a fish to eat a sandwhich?",
                content: "He really liked the tuna one so I think he will be ok :]"),
        
        Comment(title: "My cat keeps mogging me and Im jealous",
                content: "I swear, he just starts mewing out of nowhere while im trying to rizz, what can I do?")
    ]
    @State private var title = ""                 // Input title for a new comment
    @State private var content = ""               // Input content for a new comment
    @State private var replyingToIndex: Int? = nil // Tracks which comment is being replied to
    @State private var replyText = ""             // Input content for a new reply

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    // Header
                    VStack{
                        Text("Ask Paw!")// Page title
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.indigo)
                        vet()// Vet Image
                    }

                    // Description Text
                    Text(" PawPal lets you connect with pet lovers and experts who can offer helpful advice, share similar experiences, or just reassure you that you’re not alone. It’s like a group chat with people who truly get pets.")
                        .foregroundColor(Color(red: 191/255, green: 160/255, blue: 156/255))
                        .fontWeight(.semibold)
                        .padding()

                    // Background Orange
                    ZStack(alignment: .top) {
                        Image("Blank")// Background image
                            .resizable()
                            .scaledToFill()
                            .ignoresSafeArea()

                        VStack {
                            
                            // Comment Input Section
                            
                            VStack {
                                TextField("Your question...", text: $title)// Input for comment title
                                    .padding(.horizontal)
                                    .padding(.top)

                                TextEditor(text: $content)// Input for comment body
                                    .frame(height: 100)
                                    .padding(.horizontal)
                                   

                                Button(action: addComment) {// Post button
                                    Text("Post")
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background((title.isEmpty || content.isEmpty) ? Color.gray : Color.green)  // Gray if empty
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                        .padding(.horizontal)
                                        .padding(.bottom)
                                }
                                .disabled(title.isEmpty || content.isEmpty)// Disable if inputs are empty
                            }
                            .background(Color(red: 254/255, green: 255/255, blue: 212/255))// Light yellow background
                            .cornerRadius(12)
                            .padding()

                            // Comment Display Section
                            ForEach(comments.indices, id: \.self) { index in
                                VStack(alignment: .leading, spacing: 8) {
                                    Text(comments[index].title)// Comment title
                                        .fontWeight(.bold)
                                        .foregroundColor(Color(red: 77/255, green: 62/255, blue: 56/255))

                                    Text(comments[index].content)// Comment content
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                        .frame(width: 340, alignment: .leading)
                                        

                                    // Like & Reply Buttons
                                    HStack {
                                        Button {
                                            comments[index].isLiked.toggle()// Toggle like state
                                        } label: {
                                            Image(systemName: comments[index].isLiked ? "heart.fill" : "heart") // Fill heart if liked
                                                .tint(comments[index].isLiked ? .red : .black)
                                                .font(.system(size: 24))
                                        }

                                        Button {
                                            replyingToIndex = index // Show reply input for this comment
                                        } label: {
                                            Text("Reply")
                                                .fontWeight(.bold)
                                        }
                                    }

                                    // MARK: - Replies Section
                                    ForEach(comments[index].replies) { reply in
                                        HStack(alignment: .top) {
                                            Image(systemName: "arrowshape.turn.up.left.fill") // Reply icon
                                                .foregroundColor(.gray)
                                            Text(reply.content)// Reply content
                                                .foregroundColor(.gray)
                                        }
                                        .padding(.leading)
                                    }

                                    // MARK: - Reply Input Section
                                    if replyingToIndex == index {
                                        VStack(alignment: .leading) {
                                            TextField("Your reply...", text: $replyText)// Input field
                                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                            
                                            Button("Post Reply") {
                                                if !replyText.isEmpty {
                                                    comments[index].replies.append(Reply(content: replyText))// Add reply
                                                    replyText = ""// Clear input
                                                    replyingToIndex = nil// Hide reply input
                                                }
                                            }
                                            .padding(.top, 4)
                                        }
                                        .padding(.leading)
                                    }
                                }
                                .padding()
                                .background(Color(red: 254/255, green: 255/255, blue: 212/255)) // Light yellow background
                                .cornerRadius(12)
                            }
                        }
                    }
                }
                .padding(.top)
            }
        }
    }

    // MARK: - Add Comment Function
    func addComment() {
        comments.append(Comment(title: title, content: content)) // Add new comment to list
        title = ""        // Clear title input
        content = ""      // Clear content input
    }
}

// MARK: - Preview
#Preview {
    CommentSectionView() // Shows preview in Xcode canvas
}

