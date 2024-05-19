//
//  ToDoThingsView.swift
//  ThriftyTrails
//
//  Created by Tanvi Shah on 05/05/24.
//

import SwiftUI

struct ToDoThingsView: View {
    
    // MARK: - Properties
    
    private let columns = [
        GridItem(.flexible(minimum: 100, maximum: 250), spacing: 16),
        GridItem(.flexible(minimum: 100, maximum: 250), spacing: 16),
    ]
    @State var toDoThings: [OptionModel] = OptionModel.getToDoList()
    @State var activityPerDayList: [OptionModel] = OptionModel.getActivityPerDayList()
    @State var loading = false
    @State private var navigateToContent = false
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 24) {
                    titleView
                    
                    CardListView(options: $toDoThings, isMultiSelection: true)
                    
                    subtitleView
                    
                    CardListView(options: $activityPerDayList, isMultiSelection: false)
                }
            }
            buildMyTripButton
        }
        .overlay(content: {
            if loading {
                ProgressView()
                    .padding(24)
                    .background()
                    .clipShape(.rect(cornerRadius: 12))
                    .shadow(radius: 10)
            }
        })
        .padding(.horizontal)
        .background(Color.secondary.opacity(0.2))
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {}, label: {
                    Text("Skip")
                })
            }
        }
        .navigationDestination(isPresented: $navigateToContent) {
            ContentView()
        }
    }
}

extension ToDoThingsView {
    
    // MARK: - Components
    
    var titleView: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Things to do\nin your trip")
                .font(.title)
                .fontWeight(.heavy)
            Text("Let our AI know what kind of things you would like to do on your trip and we'll suggest the best sights for you!")
                .font(.footnote)
        }
    }
    
    var subtitleView: some View {
        Text("How packed you want your trip?")
            .font(.body)
    }
    
    var buildMyTripButton: some View {
        Button(action: {
            loading = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                loading = false
                navigateToContent = true
            }
        }, label: {
            Text("Build my trip")
                .font(.title2)
                .fontWeight(.medium)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 56)
                .background(Color.default)
                .clipShape(.rect(cornerRadius: 16))
        })
    }
}

#Preview {
    ToDoThingsView()
}

