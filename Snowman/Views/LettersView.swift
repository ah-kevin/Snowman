//
//  LettersView.swift
//  Snowman
//
//  Created by bjke on 2023/12/5.
//

import SwiftUI

struct LettersView: View {
    let letters: [Letter]
    var body: some View {
        HStack {
            ForEach(letters) { letter in
                Text(letter.char)
                    .font(.title)
                    .bold()
                    .frame(width: 20, height: 20)
                    .padding()
                    // 任何视图都可以有一个 overlay 修饰符，它会在顶部放置另一个视图。在这种情况下，你正在添加一个图形视图。用于 overlay 初始化器的参数是要放在顶部的视图。
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
                            .foregroundColor(letter.color)
                            .padding(2)
                    }
            }
        }
    }
}

#Preview {
    LettersView(letters: Game(id: 1).letters)
}
