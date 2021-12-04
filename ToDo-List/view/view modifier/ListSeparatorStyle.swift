//
//  ListSeparatorStyle.swift
//  ToDo-List
//
//  Created by Mahmoud Fouad on 8/11/21.
//

import SwiftUI

struct ListSeparatorStyle: ViewModifier {
    
    let style: UITableViewCell.SeparatorStyle
    
    func body(content: Content) -> some View {
        content
            .onAppear() {
                UITableView
                    .appearance()
                    .separatorStyle = self.style
            }
    }
}

extension View {
    
    func listSeparatorStyle(style: UITableViewCell.SeparatorStyle) -> some View {
        ModifiedContent(content: self, modifier: ListSeparatorStyle(style: style))
    }
}
