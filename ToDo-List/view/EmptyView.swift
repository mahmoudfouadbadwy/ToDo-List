//
//  EmptyView.swift
//  ToDo-List
//
//  Created by Mahmoud Fouad on 8/11/21.
//

import SwiftUI

struct EmptyView: View {
    var body: some View {
       Image("welcome")
        .resizable()
        .scaledToFit()
    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
