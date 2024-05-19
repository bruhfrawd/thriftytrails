//
//  PlanAdventureView.swift
//  ThriftyTrails
//
//  Created by Tanvi Shah on 06/05/24.
//

import SwiftUI

struct PlanAdventureView: View {
    
    // MARK: - Properties
    
    @State private var city: String = ""
    @State private var numberOfPerson: Int = 1
    @State private var date: Date = .init()
    @State private var firstTimeVisiting: Bool = false
    @State private var lowValue = 150.0
    @State private var highValue = 800.0
    @State private var selectedCountry = ""
    @State private var navigateToToDoThings = false
    
    let countries = ["Australia", "Canada", "India", "Europe"]
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 16) {
                    title
                    getBodyText("Where do you want to go?")
                    countryAndDatesView
                        .padding(.bottom)
                    getBodyText("How many people are going?")
                    personCountView
                        .padding(.bottom)
                    firstVisitingTimeContainer
                    line
                        .padding(.bottom)
                    selectBudgetView
                } //: VStack
            } //: ScrollView
            nextButton
        } //: VStack
        .padding(.horizontal)
        .background(Color.secondary.opacity(0.2))
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {}, label: {
                    Text("Skip")
                })
            }
        }
        .navigationDestination(isPresented: $navigateToToDoThings) {
            ToDoThingsView()
        }
    }
}

extension PlanAdventureView {
    var title: some View {
        Text("Plan your next\nadventure")
            .font(.title)
            .fontWeight(.heavy)
    }
    
    func getBodyText(_ text: String) -> some View {
        Text(text)
            .font(.body)
    }
    
    func getFootnoteText(_ text: String, color: Color) -> some View {
        Text(text)
            .font(.footnote)
            .foregroundStyle(color)
    }
    
    var countryAndDatesView: some View {
        HStack {
            Menu {
                ScrollView {
                    ForEach(countries, id: \.self) { item in
                        Button(action: {
                            selectedCountry = item
                        }, label: {
                            Text(item)
                        })
                    }
                }
            } label: {
                Text(selectedCountry.isEmpty ? "Select a country" : selectedCountry)
                    .foregroundStyle(selectedCountry.isEmpty ? .gray : .black)
                    .frame(height: 48)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .overlay {
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.blue)
                    }
            }
            
            DatePicker("", selection: $date, displayedComponents: .date)
                .frame(height: 5)
        }
    }
    
    var personCountView: some View {
        HStack(spacing: 16) {
            Text("\(numberOfPerson)")
                .foregroundStyle(Color.blue)
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .background(Color.white)
                .clipShape(.rect(cornerRadius: 8))
            Stepper("Person", value: $numberOfPerson, in: 1...10)
        }
    }
    
    var firstVisitingTimeContainer: some View {
        HStack {
            getBodyText("First time visiting?")
            Toggle("", isOn: $firstTimeVisiting)
                .tint(.blue)
                .padding(.trailing, 4)
        }
    }
    
    var line: some View {
        Color.gray
            .opacity(0.4)
            .frame(height: 1)
            .frame(maxWidth: .infinity)
    }
    
    var selectBudgetView: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                getFootnoteText("How much do you plan to send on this trip?", color: .black)
                getFootnoteText("(Optional)", color: .gray)
            }
            HStack {
                getFootnoteText("Consider", color: .gray)
                getFootnoteText("Stay + Activities + Food.", color: .black)
                getFootnoteText("Do not include flights", color: .gray)
            }
            getBodyText("Select your budget")
                .padding(.top)
            HStack(spacing: 16) {
                Text(String(format: "%.f", lowValue))
                    .frame(maxWidth: .infinity)
                    .frame(height: 48)
                    .background(Color.white)
                    .clipShape(Capsule())
                Text(String(format: "%.f", highValue))
                    .frame(maxWidth: .infinity)
                    .frame(height: 48)
                    .background(Color.white)
                    .clipShape(Capsule())
            }
            RangeSlider(
                lowValue: $lowValue,
                highValue: $highValue,
                in: 1...1000,
                showDifferenceOnEditing: false) { _ in
            }
        }
    }
    
    var nextButton: some View {
        Button(action: {
            navigateToToDoThings = true
        }, label: {
            Text("Next")
                .font(.title3)
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
    PlanAdventureView()
}

