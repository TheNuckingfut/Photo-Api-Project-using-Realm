//
//  ViewController.swift
//  againyoutube
//
//  Created by Sanjay, Vaishnavi on 21/02/23.
//

import UIKit
import RealmSwift

class ListViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photoVm.photoList?.count ?? 0
    }
    
  var photoVm = photoViewModel()
    @IBOutlet weak var tableView: UITableView!
  
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
       
        photoVm.getPhotoList { _ in [self]
            self.tableView.reloadData()
            self.navigationItem.hidesBackButton = true
            
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
   
//    @IBAction func loginclick(_ sender: Any) {
//        self.navigationController?.popViewController( animated: true)
//    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
       
        cell?.textLabel?.text = "Id = \(photoVm.photoList![indexPath.row].id)"
        cell?.detailTextLabel?.text = "Title = \(photoVm.photoList![indexPath.row].title)"
       
        
        
        return cell!
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.id = " id = \(photoVm.photoList![indexPath.row].id)"
        vc.detialtitle = "title = \(photoVm.photoList![indexPath.row].title)"
        vc.photoVM = self.photoVm
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
   
  
    
    @IBAction func logoutButton(_ sender: Any) {
        
         let logoutButton = self.storyboard?.instantiateViewController(identifier: "loginTableViewController") as? loginTableViewController
        navigationController?.pushViewController(logoutButton!, animated: true)
        
    }
    
}

