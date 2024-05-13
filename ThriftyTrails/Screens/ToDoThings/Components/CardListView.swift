//
//  CardListView.swift
//  ThriftyTrails
//
//  Created by Tanvi Shah on 07/05/24.
//

import SwiftUI

// Showing list of cards in the Grid
struct CardListView: View {
    
    // MARK: - Properties
    
    private let columns = [
        GridItem(.flexible(minimum: 100, maximum: 250), spacing: 16),
        GridItem(.flexible(minimum: 100, maximum: 250), spacing: 16),
    ]
    @Binding var options: [OptionModel]
    @State private var selectedOption: OptionModel?
    var isMultiSelection: Bool
    
    // MARK: - Body
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 16, content: {
            ForEach(options, id: \.title) { item in
                CardView(option: item, selectedOption: $selectedOption)
            }
        })
        .onChange(of: selectedOption) { oldValue, newValue in
            if let newValue {
                if isMultiSelection /* check if we can select multiple options */  {
                    options = options.map { option in
                        var opt = option
                        if opt == newValue /* checking for the selected option */ {
                            opt.isSelected.toggle() // changing option's isSelected value for showing it as selected or unselected
                        }
                        return opt
                    }
                } else {
                    options = options.map { option in
                        var opt = option
                        opt.isSelected = opt == newValue // changing option's isSelected value for showing it as selected or unselected
                        return opt
                    }
                }
            }
        }
    }
}

#Preview {
    CardListView(options: .constant([.init(title: "some")]), isMultiSelection: true)
}
