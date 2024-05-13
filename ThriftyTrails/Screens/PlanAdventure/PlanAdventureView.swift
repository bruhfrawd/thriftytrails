//
//  PlanAdventureView.swift
//  ThriftyTrails
//
//  Created by Gaganjot Singh on 06/05/24.
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
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Skip")
                })
            }
        }
    }
}

extension PlanAdventureView {
    /// main title
    var title: some View {
        Text("Plan your next\nadventure")
            .font(.title)
            .fontWeight(.heavy)
    }
    
    /// this will give you text with body font
    func getBodyText(_ text: String) -> some View {
        Text(text)
            .font(.body)
    }
    
    /// this will give you text with footnote font
    func getFootnoteText(_ text: String, color: Color) -> some View {
        Text(text)
            .font(.footnote)
            .foregroundStyle(color)
    }
    
    /// country and dates container view
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
                    } //: ForEach Loop
                } //: ScrollView
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
            } //: Menu
            
            DatePicker("", selection: $date, displayedComponents: .date)
                .frame(height: 5)
        } //: HStack
    }
    
    /// number of persons view
    var personCountView: some View {
        HStack(spacing: 16) {
            Text("\(numberOfPerson)")
                .foregroundStyle(Color.blue)
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .background(Color.white)
                .clipShape(.rect(cornerRadius: 8))
            Stepper("Person", value: $numberOfPerson, in: 1...10)
        } //: HStack
    }
    
    /// first time visit toggle option
    var firstVisitingTimeContainer: some View {
        HStack {
            getBodyText("First time visiting?")
            Toggle("", isOn: $firstTimeVisiting)
                .tint(.blue)
                .padding(.trailing, 4)
        } //: HStack
    }
    
    /// divider
    var line: some View {
        Color.gray
            .opacity(0.4)
            .frame(height: 1)
            .frame(maxWidth: .infinity)
    }
    
    /// select your range of budget
    var selectBudgetView: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                getFootnoteText("How much do you plan to send on this trip?", color: .black)
                getFootnoteText("(Optional)", color: .gray)
            } //: HStack
            HStack {
                getFootnoteText("Consider", color: .gray)
                getFootnoteText("Stay + Activities + Food.", color: .black)
                getFootnoteText("Do not include flights", color: .gray)
            } //: HStack
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
            } //: HStack
            RangeSlider(
                lowValue: $lowValue,
                highValue: $highValue,
                in: 1...1000,
                showDifferenceOnEditing: false) { _ in
            }
        } //: VStack
    }
    
    // next button that will navigate to next screen
    var nextButton: some View {
        NavigationLink {
            ToDoThingsView()
        } label: {
            Text("Next")
                .font(.title3)
                .fontWeight(.medium)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 56)
                .background(Color.default)
                .clipShape(.rect(cornerRadius: 16))
        }
    }
}

#Preview {
    PlanAdventureView()
}
