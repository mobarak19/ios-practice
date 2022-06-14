//
//  ViewController.swift
//  CollectionViewInTableView
//
//  Created by Mobarak on 11/9/21.
//

import UIKit

class ViewController: UIViewController {

    var models = [Model]()
    private var tableView : UITableView = {
        let table = UITableView()
        return table
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        models.append(Model(name: "image_1", imageName: "image_1"))
        models.append(Model(name: "image_2", imageName: "image_2"))
        models.append(Model(name: "image_3", imageName: "image_3"))
        models.append(Model(name: "image_4", imageName: "image_4"))
        models.append(Model(name: "image_5", imageName: "image_5"))
        models.append(Model(name: "image_1", imageName: "image_1"))
        models.append(Model(name: "image_2", imageName: "image_2"))
        models.append(Model(name: "image_3", imageName: "image_3"))
        models.append(Model(name: "image_4", imageName: "image_4"))
        configureTableView()

    }
    func configureTableView()  {
    
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.identifire)
//        tableView.register(HeaderView.self, forHeaderFooterViewReuseIdentifier: HeaderView.identifire)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }

}

extension ViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: HeaderView.identifire) as! HeaderView
//        header.configure()
        
        let sectionHeader = UIView.init(frame: CGRect.init(x: 0, y: 0, width: view.frame.width, height: 50))

                  let sectionText = UILabel()
                  sectionText.frame = CGRect.init(x: 5, y: 5, width: sectionHeader.frame.width-10, height: sectionHeader.frame.height-10)
                  sectionText.text = "Custom Text"
                  sectionText.font = .systemFont(ofSize: 14, weight: .bold) // my custom font
                  sectionText.textColor = .red // my custom colour

                  sectionHeader.addSubview(sectionText)
         sectionHeader.addSubview(sectionText)
        return sectionHeader
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
       return models.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifire, for: indexPath) as! CustomTableViewCell
        let isHorizontal = indexPath.row%2==1
        cell.configure(with: models,isHorizontal: isHorizontal)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let isHorizontal = indexPath.row%2==1

        if isHorizontal{
            return 120
        }
        return 420.0
    }
    
}

struct Model {
    let name : String
    let imageName : String
    init(name:String, imageName:String) {
        self.name = name
        self.imageName = imageName
    }
}
