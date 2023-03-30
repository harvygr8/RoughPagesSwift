//
//  PageView.swift
//  RoughPages
//
//  Created by Harvinder Laliya on 3/20/23.
//


import SwiftUI

struct PageView: View {
    
    @ObservedObject var pageModel = PageViewModel()
    
    @State var refresh: Bool = false
    @State var searchText : String = ""

    var body: some View {
        VStack {
            NavigationView{
                
                if searchText != ""{
                    List(pageModel.list.filter{$0.title.lowercased().contains(self.searchText.lowercased())}){ item in
                        NavigationLink(destination: DetailView(page: item)){
                            HStack(spacing:20){
                                Text(item.title)
                            }
                        }
                    }
                    .padding(.top,20)
                    .navigationTitle("RoughPages")
                    .navigationBarTitleDisplayMode(.large)
                    .scrollContentBackground(.hidden)
                    .listRowSeparator(.hidden)
                    .environment(\.defaultMinListRowHeight,10)
                }
                else{
                    List(pageModel.list ){ item in
                        NavigationLink(destination: DetailView(page: item)){
                            HStack(spacing:20){
                                Text(item.title)
                            }
                        }
                    }
                    .padding(.top,20)
                    .navigationTitle("RoughPages")
                    .navigationBarTitleDisplayMode(.large)
                    .scrollContentBackground(.hidden)
                    .listRowSeparator(.hidden)
                    .environment(\.defaultMinListRowHeight,10)
                }
                
            }
            
            TextField("Search" , text:$searchText)
                .padding(10)
                .textFieldStyle(.roundedBorder)
                .frame(width: 220)

            }
            .frame(maxWidth: .infinity , maxHeight: .infinity)
            .onAppear {
                print("view appeared!")
            }
            .onDisappear {
                print("View disappeared!")
            }
        }
    
    init(){
        pageModel.getData()
    }
}
