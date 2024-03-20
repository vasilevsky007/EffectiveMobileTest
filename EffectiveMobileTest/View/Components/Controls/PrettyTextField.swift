//
//  PrettyTextField.swift
//  EffectiveMobileTest
//
//  Created by Alex on 14.03.24.
//

import SwiftUI

/// A custom text field with support for placeholder text, placeholder images, and error messages.
///
/// Use ``init(text:placehoderText:placeholderImage:errorMessage:)`` to create a styled text field with customizable placeholder text and image.
struct PrettyTextField: View {
    @Binding private var text: String
    private let placehoderText: LocalizedStringKey?
    private let placeholderImage: String?
    private let errorMessage: LocalizedStringKey?
    
    /// Initializes a new instance of ``PrettyTextField``.
    /// - Parameters:
    ///   - text: The text binding for the field's input.
    ///   - placehoderText: The localized placeholder text displayed when the field is empty.
    ///   - placeholderImage: The name of the placeholder image to display.
    ///   - errorMessage: The localized error message to display when there is an error.
    init(text: Binding<String>,
                placehoderText: LocalizedStringKey? = nil,
                placeholderImage: String? = nil,
                errorMessage: LocalizedStringKey? = nil) {
        self._text = text
        self.placehoderText = placehoderText
        self.placeholderImage = placeholderImage
        self.errorMessage = errorMessage
    }
    
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
                            .foregroundStyle(.grey5)
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
