//
//  ContentView.swift
//  RoughPages
//
//  Created by Harvinder Laliya on 3/20/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showAddPageView : Bool = false

    var body: some View {
        ZStack(alignment:.bottomTrailing){
            PageView()
            AddButtonView()
                .onTapGesture {
                    showAddPageView.toggle()
                }
        }   
        .sheet(isPresented: $showAddPageView ,
        onDismiss: {
            DispatchQueue.main.async {
                PageView().pageModel.getData()
            }
        }){
            AddPageView()
        }
        .frame(maxWidth:.infinity,maxHeight: .infinity,alignment: .bottom)
//        .background(.gray)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
