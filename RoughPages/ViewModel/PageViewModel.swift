//
//  PageViewModel.swift
//  RoughPages
//
//  Created by Harvinder Laliya on 3/21/23.
//

import Foundation
//import FirebaseCore
import FirebaseFirestore

class PageViewModel : ObservableObject {
    
    @Published var list = [Page]()
    
    func getData(){
        let db = Firestore.firestore()
        
        db.collection("pages").addSnapshotListener(){ snapshot , error in
            if error == nil{
                if let snapshot = snapshot{
                    DispatchQueue.main.async {
                        self.list = snapshot.documents.map{ d in
                            return Page(id: d.documentID, name: d["username"] as? String ?? "", title : d["title"] as? String ?? "", page: d["page"] as? String ?? "")
                        }
                    }
                }
            }
            else{
                print(error as Any)
            }
            
        }
    }
    
    func writeData(title:String , name:String , page:String, time:String){
        let db = Firestore.firestore()
        
        db.collection("pages").addDocument(data: ["username":name,"page":page,"timestamp":time,"title":title]){error in
            
            if error == nil {
                self.getData()
            }
            else{
                print(error as Any)
            }
        }
    }
    
    func deleteData(page:Page){
        let db = Firestore.firestore()
        db.collection("pages").document(page.id).delete(){error in
            if error == nil{
                //list.remove(at: <#T##Int#>)
                self.getData()
            }
            else{
                print(error as Any)
            }
        }
    }
}
