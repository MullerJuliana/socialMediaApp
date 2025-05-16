//
//  AskPaw.swift
//  PawPal
//
//  Created by StudentPM on 5/16/25.
//



import SwiftUI

// Comment model (reusing Note)
struct Comment: Identifiable {
    var id = UUID()
    var title: String
    var content: String
}

struct CommentSectionView: View {
    @State private var comments: [Comment] = []
    @State private var title = ""
    @State private var content = ""

    var body: some View {
        NavigationView {
                ScrollView {
                    ZStack {
                        Image("Blank")
                            .resizable()
                            .scaledToFill()
                            .ignoresSafeArea()
                        
                        Rectangle()
                            .fill(Color.white)
                            .frame(width: 400, height: 600)
                            .offset(y:-270)
                                           
                            vet()
                            .offset(x:70, y:-250)
                        
                        Text(" PawPal lets you connect with pet lovers and experts who can offer helpful advice, share similar experiences, or just reassure you that you’re not alone. It’s like a group chat with people who truly get pets.")
                            .offset(y:-50)
                            .foregroundColor(Color(red: 191/255, green: 160/255, blue: 156/255))
                            .fontWeight(.semibold)
                            .padding()
                        
                    VStack(spacing: 16) {
                        // Input Fields
                        VStack() {
                            
                            TextField("Your question...", text: $title)
                                .padding()
                                .background(Color(UIColor.systemGray6))
                                .cornerRadius(10)

                            TextEditor(text: $content)
                                .frame(height: 100)
                                .padding()
                                .background(Color(UIColor.systemGray6))
                                .cornerRadius(10)

                            Button(action: addComment) {
                                Text("Post")
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background((title.isEmpty || content.isEmpty) ? Color.gray : Color.green)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                            .disabled(title.isEmpty || content.isEmpty)
                        }
                        .padding()
                        .offset(y:200)
                        
                        // List of Comments
                        VStack(alignment: .leading, spacing: 16) {
                            ForEach(comments) { comment in
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(comment.title)
                                        .fontWeight(.bold)
                                    Text(comment.content)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                .padding()
                                .background(Color(red: 254/255, green: 255/255, blue: 212/255))
                                .cornerRadius(12)
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding(.top)
                }
            }
            .navigationTitle("Ask Paw!")
        }
    }

    func addComment() {
        comments.append(Comment(title: title, content: content))
        title = ""
        content = ""
    }
}

#Preview {
    CommentSectionView()
}



