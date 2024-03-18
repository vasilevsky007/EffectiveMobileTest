//
//  PrettyTextField.swift
//  EffectiveMobileTest
//
//  Created by Alex on 14.03.24.
//

import SwiftUI

struct PrettyTextField: View {
    @Binding var text: String
    var placehoderText: LocalizedStringKey?
    var placeholderImage: String?
    var errorMessage: LocalizedStringKey?
    
    var body: some View {
        VStack(alignment: .leading, spacing: DrawingConstants.standardSpacing) {
            HStack(alignment: .center, spacing: 0) {
                if let placeholderImage2 = placeholderImage, isEmpty == true  {
                    Image(placeholderImage2)
                        .resizable()
                        .frame(
                            width: DrawingConstants.PrettyTextField.imageSize,
                            height: DrawingConstants.PrettyTextField.imageSize
                        )
                        .foregroundStyle(Color.placeholder)
                        .padding(.trailing, DrawingConstants.standardSpacing)
                }
                TextField(
                    "",
                    text: $text,
                    prompt: prompt
                )
                .foregroundStyle(.white)
                if !isEmpty {
                    Button {
                        text = ""
                    } label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(
                                width: DrawingConstants.PrettyTextField.closeImageSize,
                                height: DrawingConstants.PrettyTextField.closeImageSize
                            )
                            .foregroundStyle(.white)
                            .padding(DrawingConstants.PrettyTextField.closeImagePadding)
                            .padding(.leading, DrawingConstants.standardSpacing)
                    }
                }
            }
                .font(.text1())
                .padding(DrawingConstants.standardSpacing)
                .background(.controlBackground)
                .animation(.easeInOut, value: isEmpty)
                .clipShape(.rect(cornerRadius: DrawingConstants.cornerRadius))
                .overlay(noError ? .clear : .red, in: .rect(cornerRadius: DrawingConstants.cornerRadius).stroke(lineWidth: 1))
            
//                .shadow(
//                    color: .black,
//                    radius: DrawingConstants.PrettyTextField.shadowRadius,
//                    x: DrawingConstants.PrettyTextField.shadowOffsetX,
//                    y: DrawingConstants.PrettyTextField.shadowOffsetY
//                )
            if !noError {
                Text(errorMessage!)
                    .font(.footnote)
                    .foregroundStyle(.red)
            }
        }
    }
    
    private var prompt: Text? {
        guard let placehoderText = placehoderText else { return nil }
        return Text(placehoderText).foregroundColor(.placeholder)
    }
    private var isEmpty: Bool {
        text == ""
    }
    private var noError: Bool {
        errorMessage == nil || errorMessage == ""
    }
}

#Preview {
    @State var s = ""
    return PrettyTextField(text: $s)
}
