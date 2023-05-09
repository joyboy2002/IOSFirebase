//
//  MoviesViewModel.swift
//  IOSFirebase
//
//  Created by ISSC_611_2023 on 08/05/23.
//

import Foundation
import Combine
import FirebaseFirestore


class MoviesViewModel:ObservableObject{
    @Published var movies = [Movie]()

    private var db = Firestore.firestore()
    private var listemerRegistration: ListenerRegistration?
    
    deinit {
        //TO DO
        unsubscribe()
    }
    
    func unsubscribe(){
        if listemerRegistration != nil{
            listemerRegistration?.remove()
            listemerRegistration = nil
        }
    }
    
    func subscribe(){
        if listemerRegistration == nil{
            listemerRegistration = db.collection("movielist").addSnapshotListener{(querySnapshot, error) in
                guard let documents = querySnapshot?.documents else{
                    print("No hay documentos")
                    return
                }
                self.movies = documents.compactMap()
            }
        }
    }
}
