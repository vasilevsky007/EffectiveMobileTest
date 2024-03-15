//
//  VerificationCodeBox.swift
//  EffectiveMobileTest
//
//  Created by Alex on 15.03.24.
//

import SwiftUI

struct VerificationCodeBox: View {
    @Binding var code: String
    let numberOfCharacters: Int
    let filterRule: (Character) -> Bool
    
    @State private var enteredCharacters: [String]
    @FocusState private var focusedIndex: Int?
    
    var enteredCode: String {
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
                    prompt: Text("✻").foregroundColor(.placeholder)
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
        }
    }
}

#Preview {
    @State var code = ""
    
    return VerificationCodeBox(code: $code, numberOfCharacters: 4, charactersFilter: {$0.isNumber})
}
