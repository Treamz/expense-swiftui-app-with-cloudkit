//
//  CategoryRowView.swift
//  expense-tracker
//
//  Created by Иван Чернокнижников on 13.02.2024.
//


import SwiftUI

struct CategoryRowView: View {
    let category: Category
    let sum: Double
    
    var body: some View {
        HStack {
            CategoryImageView(category: category)
            Text(category.rawValue.capitalized)
            Spacer()
            Text(sum.formattedCurrencyText).font(.headline)
        }
    }
}

struct CategoryRowView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRowView(category: .donation, sum: 2500)
    }
}
