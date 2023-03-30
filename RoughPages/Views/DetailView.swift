//
//  DetailView.swift
//  RoughPages
//
//  Created by Harvinder Laliya on 3/24/23.
//
import MarkdownView
import SwiftUI

struct DetailView: View {
    let page : Page
    @ObservedObject var pageModel = PageViewModel()

    
    var body: some View {
        VStack{
            Text(page.title)
                .fontWeight(.bold)
                .font(.system(size: 17))
                .textCase(.uppercase)
            Text("~\(page.name)")
                .fontWeight(.semibold)
            ScrollView{
                let local = try? AttributedString(markdown: page.page)
                Text(local!)
                    .padding(20)
                    .multilineTextAlignment(.center)
            }
            Button(action:{
                pageModel.deleteData(page: page)
            } , label: {
                Text("Delete")
                    .foregroundColor(.white)
                    .padding()
                    .background(.red)
                    .cornerRadius(5)
            })
        }
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
