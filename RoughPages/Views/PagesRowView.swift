//
//  PagesRowView.swift
//  RoughPages
//
//  Created by Harvinder Laliya on 3/20/23.
//

import SwiftUI


struct PagesRowView: View {
    var task : String
    var completed : Bool
    
    var body: some View {
        HStack(spacing:20){
            Image(systemName: completed ? "checkmark.circle" : "circle")
            Text(task)
        }
    }
}

//struct PagesRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        TaskRowView(task:"Do Laundry",completed: true)
//    }
//}
