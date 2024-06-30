//
//  ContentView.swift
//  MovieApp
//
//  Created by zz on 28/6/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    var body: some View {
        Home()
    }}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
