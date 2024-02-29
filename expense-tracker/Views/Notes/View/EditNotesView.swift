//
//  EditNotesView.swift
//  expense-tracker
//
//  Created by Иван Чернокнижников on 26.02.2024.
//

import SwiftUI

struct EditNotesView: View {
    private var item: Note
    @StateObject private var viewModel: EditItemViewViewModel
    @Binding var newItemPresented: Bool
    init(newItemPresented: Binding<Bool>, item: Note) {
        self.item = item
        self._viewModel = StateObject(wrappedValue: EditItemViewViewModel(name: item.name, note:item.note ,noteId: item.id ?? "none"))
        //        self.item = Note(name: "", note: "", date: "")
//                self._viewModel =/* StateObject(wrappedValue: EditItemViewViewModel(name: item.name, noteId: item.id!))*/
                self._newItemPresented = newItemPresented
    }
    var body: some View {
        VStack(spacing: 5) {
            Text("Edit Note")
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
                                               viewModel.update()
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
    EditNotesView(newItemPresented: .constant(true), item: Note(name: "test note", note: "body note", date: "id1"))
}
