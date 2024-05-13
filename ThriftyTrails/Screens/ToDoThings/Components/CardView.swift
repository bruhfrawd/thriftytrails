//
//  CardView.swift
//  ThriftyTrails
//
//  Created by Gaganjot Singh on 05/05/24.
//

import SwiftUI

/// Card view for showing options
struct CardView: View {
    
    // MARK: - Properties
    
    var option: OptionModel
    @Binding var selectedOption: OptionModel?
    
    // MARK: - Body
    
    var body: some View {
        Button(action: {
            selectedOption = option /// passing tapped option for showing this card as selected
        }, label: {
            VStack {
                Text(option.title)
                    .foregroundStyle(.black)
                    
                if let subtitle = option.subtitle {
                    Text(subtitle)
                        .foregroundStyle(.gray)
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 80)
            .background(.white)
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(option.isSelected ? Color.blue : Color.white, lineWidth: 2)
            }
            .clipShape(.rect(cornerRadius: 8))
        })
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    CardView(option:  OptionModel.getToDoList().first!, selectedOption: .constant(nil))
}
