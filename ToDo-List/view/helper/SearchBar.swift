//
//  SearchBar.swift
//  ToDo-List
//
//  Created by Mahmoud Fouad on 8/15/21.
//

import SwiftUI

struct SearchBar: UIViewRepresentable {
   
    @Binding var text: String
    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = .minimal
        searchBar.autocapitalizationType = .none
        searchBar.placeholder = "Search..."
        searchBar.delegate = context.coordinator
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = text
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator($text)
    }
    
    
    
    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var text: String
        
        init(_ text: Binding<String>) {
            self._text = text
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            searchBar.showsCancelButton = true
            text = searchText
        }
        
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            text = ""
            searchBar.showsCancelButton = false
            searchBar.resignFirstResponder()
            searchBar.endEditing(true)
        }
        
        func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
            searchBar.showsCancelButton = true
            return true
        }
    }
}
