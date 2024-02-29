//
//  NotesView.swift
//  expense-tracker
//
//  Created by Иван Чернокнижников on 26.02.2024.
//

import SwiftUI
import FirebaseFirestore
struct NotesView: View {
    @StateObject private var viemModel = NotesViewModel()
    @State private var isPresentAddNote = false
    @State private var isPresentEditNote = false
    @FirestoreQuery var items: [Note]
    @State private var itemToEdit: Note = Note(name: "", note: "", date: "")

    @State private var showAlert = false
    
    init() {
        let uuid: String = UIDevice.current.identifierForVendor?.uuidString ?? "none"
        
        print("\(uuid)")

        self._items = FirestoreQuery(collectionPath: "\(uuid)")
    
        
        
    }
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                VStack {
                    Text(Date().formatted(.dateTime.day().month().year()))
                
                    ForEach(items) {note in
                       NoteItemView(item: note)
                            .padding()
                            .onTapGesture {
                                itemToEdit = note
                                isPresentEditNote = true
                            }
                            .onLongPressGesture {
                                itemToEdit = note
                                showAlert = true
                               
                            }
                    }
                }
            }
            Button {
                isPresentAddNote = true
            } label: {
                Image(systemName: "plus")
                    .padding()
                    .background(Color.black)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .shadow(radius: 4, x: 0, y: 4)
            }
            .padding()
        }
        .alert("Do you want to delete this note?", isPresented: $showAlert) {
                    Button("OK") {
                        viemModel.delete(id: itemToEdit.id ?? "none")
                    }
            Button("Cancel",role: .cancel) {}
                }
        .sheet(isPresented: $isPresentAddNote) {
            NavigationStack {
                AddNote(newItemPresented: $isPresentAddNote)
            }
        }
        .sheet(isPresented: $isPresentEditNote) {
            NavigationStack {
                EditNotesView(newItemPresented: $isPresentEditNote, item: itemToEdit)
            }
        }
        .onAppear {
        
        }
    }
}

#Preview {
    NotesView()
}
