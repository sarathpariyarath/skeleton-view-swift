//
//  ViewController.swift
//  SkeletonView
//
//  Created by Sarath P on 19/04/22.
//

import UIKit
import SkeletonView

class ViewController: UIViewController {

    @IBOutlet weak var customTableView: UITableView!
    
    var data: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customTableView.dataSource = self

        for i in 0..<10 {
            self.data.append(i + 1)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            
            self.customTableView.hideSkeleton()
            print(self.data)
            self.customTableView.reloadData()
        }
        
        
        
        print(data)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        customTableView.isSkeletonable = true
        customTableView.showAnimatedGradientSkeleton()
    }

    @IBAction func reloadTableView(_ sender: Any) {
        self.customTableView.reloadData()
    }
    
}

extension ViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DataTableViewCell") as! DataTableViewCell
        cell.cellImage.image = UIImage(systemName: "paperplane.circle")
        cell.cellLabel.text = data[indexPath.row].description
        return cell
    }
    
}
