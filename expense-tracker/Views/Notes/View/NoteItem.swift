//
//  NoteItem.swift
//  expense-tracker
//
//  Created by Иван Чернокнижников on 26.02.2024.
//

//
//  ToDoListItemView.swift
//  TodoApp
//
//  Created by Иван Чернокнижников on 13.07.2023.
//

import SwiftUI

struct NoteItemView: View {
    
    let item: Note
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.body)
                Text(item.note)
                    .font(.footnote)
                    .foregroundColor(Color(uiColor: .secondaryLabel))

            }
            Spacer()
            
        }
    }
}

struct NoteItemView_Previews: PreviewProvider {
    static var previews: some View {
        NoteItemView(item: .init(id: "", name: "", note: "", date: ""))
    }
}
