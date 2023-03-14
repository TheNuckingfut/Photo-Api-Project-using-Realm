//
//  viewModel.swift
//  first
//
//  Created by Sanjay, Vaishnavi on 28/02/23.
//

import Foundation

//class photoViewModel{
//
//    var photo:[Photos] = []
//    func fetchPhotos(completed : @escaping()-> ()) {
//
//        APIService.shared.fetch { photos in
//            self.photo = photos
//            completed()
//        }
//    }
//}
enum Result {
    case success
    case failure
}

protocol PhotoViewModdelProtocal {
    func numberOfRows() -> Int
    func numberOfSections() -> Int
    func getPhotoList(completion : @escaping (Result) -> ())
    var  photoArray: [Photos]? { get set }
}


class photoViewModel : PhotoViewModdelProtocal {
    func getPhotoList(completion: @escaping (Result) -> ()) {
        apiService.fetch { [self] photoArray in
            self.photoList = photoArray
            completion(.success)
        }
    }
    
   
    
    var photoArray: [Photos]?
    
    
    
   
    
    func numberOfRows() -> Int {
        return self.photoList?.count ?? 1
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    public var apiService : APIService!
    
    var photoList: [Photos]?
    
    init() {
        apiService = APIService()
    }
}
