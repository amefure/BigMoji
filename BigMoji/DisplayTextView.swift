//
//  ContentView.swift
//  BigMoji
//
//  Created by t&a on 2023/06/27.
//

import SwiftUI

struct DisplayTextView: View {
    let text:String
    
    var body: some View {
        VStack {
            Text(text)
                .font(.system(size: 400))
                .minimumScaleFactor(0.1)
                .multilineTextAlignment(.center)
                .lineLimit(nil)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        }.ignoresSafeArea()
        .padding()
    }
}
