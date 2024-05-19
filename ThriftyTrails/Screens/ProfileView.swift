//
//  ChatView.swift
//  Thrifty Trails
//
//  Created by Michael Arbotante on 10/5/2024.
//

import SwiftUI

struct ChatView: View {
    @State private var inputText: String = ""
    @State private var messages: [String] = []

    var body: some View {
        VStack {
            // Messages display area
            ScrollView {
                VStack(alignment: .trailing, spacing: 10) { // Align text to the right
                    ForEach(messages, id: \.self) { message in
                        Text(message)
                            .padding()
                            .background(Color.blue.opacity(0.2))
                            .cornerRadius(10)
                            .frame(maxWidth: .infinity, alignment: .trailing) // Ensure alignment to the right
                    }
                }
                .padding()
            }

            // Text input field
            HStack {
                TextField("Type something...", text: $inputText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button("Send") {
                    sendMessage()
                }
                .padding()
                .disabled(inputText.isEmpty)
            }
        }
    }
    
    func sendMessage() {
        messages.append(inputText)
        inputText = "" // Clear text field after sending
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
