//
//  ViewController.swift
//  TableViewHeaderWithCollectionView
//
//  Created by Mobarak on 11/11/21.
//

import UIKit

class ViewController: UIViewController {

    var dictionary =  [
        DictionaryPage(firstLetter: "A", list: ["Ant"]),
        DictionaryPage(firstLetter: "B", list: ["Bat","Butterfly"]),
        DictionaryPage(firstLetter: "C", list: ["Cat","Camel","Crab"]),
        DictionaryPage(firstLetter: "D", list: ["Dog","Dummy"]),
        DictionaryPage(firstLetter: "E", list: ["Eggle"]),
        DictionaryPage(firstLetter: "F", list: ["Fish"]),
        DictionaryPage(firstLetter: "G", list: ["Giraffe","Goat","Gorrilla"]),
        DictionaryPage(firstLetter: "H", list: ["Horse"]),
        DictionaryPage(firstLetter: "M", list: ["Monkey","Mouse"]),
        DictionaryPage(firstLetter: "O", list: ["Giraffe"]),
        DictionaryPage(firstLetter: "K", list: ["Giraffe","Goat","Gorrilla"]),
        DictionaryPage(firstLetter: "L", list: ["Giraffe","Goat","Gorrilla"]),

    ]
    
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
    }


}

extension ViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dictionary[section].list.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        self.dictionary.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.dictionary[section].firstLetter
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "labelCell", for: indexPath)
        cell.textLabel?.text = self.dictionary[indexPath.section].list[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}

