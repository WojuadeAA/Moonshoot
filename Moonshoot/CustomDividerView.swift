//
//  CustomDividerView.swift
//  Moonshoot
//
//  Created by Wojuade Abdul Afeez on 28/01/2024.
//

import SwiftUI

struct CustomDividerView: View {
    var body: some View {
        Rectangle()
            .frame(height: 1)
            .foregroundColor(.lightBackground )
            .padding(.vertical)
    }
}

#Preview {
    CustomDividerView()
}
