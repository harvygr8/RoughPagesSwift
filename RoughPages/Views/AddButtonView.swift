//
//  AddButtonView.swift
//  RoughPages
//
//  Created by Harvinder Laliya on 3/20/23.
//


import SwiftUI

struct AddButtonView: View {
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 50)
                .foregroundColor(.indigo)
            Text("+")
                .foregroundColor(.white)
                .font(.title).bold()
        }
        .frame(height:50)
        .padding()
    }
}

struct AddButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AddButtonView()
    }
}
