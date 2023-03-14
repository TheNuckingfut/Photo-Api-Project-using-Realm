//
//  HeroViewController.swift
//  againyoutube
//
//  Created by Sanjay, Vaishnavi on 21/02/23.
//

import UIKit
import RealmSwift

class DetailViewController: UIViewController {
    var photoVM: photoViewModel?
    
   // var data = Picture()
    let realm = try! Realm()

    @IBOutlet weak var idLable: UILabel!
    
    @IBOutlet weak var titleLable: UILabel!
    
    var id = ""
    var detialtitle = ""
    
    @IBOutlet weak var thumbnailUrllbl: UILabel!
    var hero : Photos?
    override func viewDidLoad() {
        super.viewDidLoad()
        saveData()
        fetch()
        delete()

       // albumIdlbl.text = "\(hero?.albumId)"
        idLable.text = "\(id)"
        titleLable.text = detialtitle
        
    }
   
  
    func saveData() {
        let userData = photoVM!.photoList!
        for data in userData{
            let picture = Picture()
            picture.id = data.id
            picture.title = data.title
            try! realm.write{
                realm.add(picture)
            }
        }
        
        
    }
    func fetch() {
        let pictures = realm.objects(Picture.self)
        for picture in pictures{
            print("id:\(picture.id)")
            print("title:\(picture.title)")
        }
    }
    
    func delete() {
        let pictures = realm.objects(Picture.self)
        for picture in pictures {
            try! realm.write({
                realm.delete(picture)
            })
        }
    }
    

}
