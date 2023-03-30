//
//  AddPageView.swift
//  RoughPages
//
//  Created by Harvinder Laliya on 3/20/23.
//

import SwiftUI

struct AddPageView: View {
    @State private var title : String = ""
    @State private var page : String = ""
    @ObservedObject var pageModel = PageViewModel()
    @State private var timestamp = Date().formatted(.dateTime.year().month().day().hour().minute())


    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            Text("Create a new page")
                .font(.title3).bold()
                .frame(maxWidth: .infinity,alignment: .leading)
            TextField("Enter title here",text:$title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextEditor(text:$page)
                .shadow(radius: 1)
                
            Button(action:{
                pageModel.writeData(title: title, name: "harvy", page: page, time: timestamp)
                title=""
                page=""
                dismiss()
            }, label: {
                Text("Add Page")
                    .foregroundColor(.white)
                    .padding()
                    .background(.indigo)
                    .cornerRadius(5)
            })
            
            Spacer()
        }
        .padding(.top,40)
        .padding(.horizontal)
    }
}

//struct AddPageView_Previews: PreviewProvider {
//    static var previews: some View {
//
//    }
//}
