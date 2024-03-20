//
//  VerificationCodeBox.swift
//  EffectiveMobileTest
//
//  Created by Alex on 15.03.24.
//

import SwiftUI

/// A view for entering verification codes.
///
/// `VerificationCodeBox` provides a text input interface for users to enter verification codes. It consists of a row of text fields, each representing a single character of the code. 
/// As the user types, the entered characters are validated according to the provided filter rule and displayed in the corresponding text fields.
/// The box automatically moves focus to the next text field as characters are entered, providing a seamless input experience.
///
/// Use ``init(code:numberOfCharacters:charactersFilter:)`` to create a box for entering verification codes with customizable appearance and behavior.
struct VerificationCodeBox: View {
    @Binding private var code: String
    private let numberOfCharacters: Int
    private let filterRule: (Character) -> Bool
    
    @State private var enteredCharacters: [String]
    @FocusState private var focusedIndex: Int?
    
    /// Initializes a new instance of ``VerificationCodeBox``.
    /// - Parameters:
    ///   - code: The binding for the entered verification code.
    ///   - numberOfCharacters: The number of characters in the verification code.
    ///   - charactersFilter: A closure specifying the filtering rule for entered characters.
    private var enteredCode: String {
        var result = ""
        for enteredCharacter in enteredCharacters {
            result += enteredCharacter
        }
        return result
    }
    
    init(code: Binding<String>, numberOfCharacters: Int, charactersFilter: @escaping (Character) -> Bool) {
        self._code = code
        self.numberOfCharacters = numberOfCharacters
        self.enteredCharacters = .init(repeating: "", count: numberOfCharacters)
        self.filterRule = charactersFilter
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: DrawingConstants.standardSpacing) {
            ForEach(0..<numberOfCharacters) { position in
                TextField(
                    "",
                    text: $enteredCharacters[position],
                    prompt: Text("✻").foregroundStyle(.secondaryContent)
                )
                    .focused($focusedIndex, equals: position)
                    .font(.code())
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .frame(
                        width: DrawingConstants.VerificationCodeBox.size,
                        height: DrawingConstants.VerificationCodeBox.size
                    )
                    .background(.controlBackground)
                    .clipShape(.rect(cornerRadius: DrawingConstants.cornerRadius))
            }
        }.onChange(of: enteredCode) {
            withAnimation {
                code = String(enteredCode.prefix(numberOfCharacters)).filter(filterRule)
                if (0..<numberOfCharacters).contains(code.count) {
                    focusedIndex = code.count
                } else {
                    focusedIndex = nil
                }
                var newStrings = Array(code).map { String($0) }
                newStrings.append(contentsOf: Array.init(repeating: "", count: numberOfCharacters - newStrings.count))
                enteredCharacters = newStrings
            }
        }.onAppear {
            focusedIndex = 0
        }
    }
}

#Preview {
    @State var code = ""
    
    return VerificationCodeBox(code: $code, numberOfCharacters: 4, charactersFilter: {$0.isNumber})
}
