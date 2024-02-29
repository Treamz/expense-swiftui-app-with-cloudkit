//
//  AddNote.swift
//  expense-tracker
//
//  Created by Иван Чернокнижников on 26.02.2024.
//

import SwiftUI

struct AddNote: View {
    
    
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool

    var body: some View {
        VStack(spacing: 5) {
            Text("New Note")
                            .font(.system(size: 32))
                            .bold()
                            .padding(.top, 100)
            
            Form {
                           // Title
                TextField("Title", text: $viewModel.name)
                TextEditor(text: $viewModel.note)
//                               .textFieldStyle(DefaultTextFieldStyle())
//                           // Due date
//                           DatePicker("Due Date", selection: $viewModel.dueDate)
//                               .datePickerStyle(GraphicalDatePickerStyle())
//                           // Button
                           TLButton(
                               title: "Save",
                               background: .pink
                           ) {
                               if viewModel.canSave {
                                   viewModel.save()
                                   newItemPresented = false
                               } else {
                                   viewModel.showAlert = true
                               }
                           }
//
                       }
                       .alert(isPresented: $viewModel.showAlert) {
                           Alert(title: Text("Error"), message: Text("Please fill in all fields and selected due date newer than today or newer."))
                       }
                  }
        
    }
}

#Preview {
    AddNote(newItemPresented: .constant(true))
}
