//
//  ViewController.swift
//  GetApiCalling
//
//  Created by Arpit Dhameliya on 14/03/24.
//

import UIKit
import Alamofire

struct UserData {
    
    var userId = 0
    var id = 0
    var title = ""
    var body = ""
    
    init(dic : NSDictionary) {
        
        self.userId = (dic["userId"] as? Int) ?? 0
        self.id = (dic["id"] as? Int) ?? 0
        self.title = (dic["title"] as? String) ?? ""
        self.body = (dic["body"] as? String) ?? ""
    }
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var TableView: UITableView!
    
    var arr = [UserData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.TableView.dataSource = self
        self.TableView.delegate = self
        self.TableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        
        AF.request("https://jsonplaceholder.typicode.com/posts",method: .get).responseJSON { data in
            
            switch data.result {
            case .success(let success):
                if let ans = success as? NSArray {
                    for i in ans {
                        if let dic = i as? NSDictionary {
                            self.arr.append(UserData(dic: dic))
                        }
                    }
                    self.TableView.reloadData()
                }
            case .failure(let failure):
                print("failure")
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return self.arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        
        let index = arr[indexPath.row]
        
        Cell.userid.text = "\(index.userId)"
        Cell.id.text = "\(index.id)"
        Cell.title.text = index.title
        Cell.body.text = index.body
        
        return Cell
    }
    
    
}
