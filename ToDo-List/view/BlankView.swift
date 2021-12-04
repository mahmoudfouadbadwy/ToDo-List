//
//  BlankView.swift
//  ToDo-List
//
//  Created by Mahmoud Fouad on 8/11/21.
//

import SwiftUI

struct BlankView: View {
    let backgroundColor: Color
    var body: some View {
        VStack {
            Spacer()
        }
        .frame(
            minWidth: 0,
            maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
            minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,
            maxHeight: .infinity
        )
        .background(backgroundColor)
        .edgesIgnoringSafeArea(.all)
    }
}

struct BlankView_Previews: PreviewProvider {
    static var previews: some View {
        BlankView(backgroundColor: .black)
    }
}
