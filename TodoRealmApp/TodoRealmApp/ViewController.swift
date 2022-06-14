
import UIKit
import RealmSwift
class ViewController: UIViewController {

    var models : [Todo] = []
    
    let todoTableView : UITableView = {
        let tableV = UITableView()
        
        return tableV
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(onAddTouched))
        
        view.backgroundColor = .systemBackground
        
        addTableView()
        
        models = DatabaseHelper.shared.getAllTodos()
    }
    func addTableView()  {
        todoTableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(todoTableView)
        todoTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        
        todoTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        todoTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        todoTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        todoTableView.delegate = self
        todoTableView.dataSource = self
        
        todoTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
    
    @objc func onAddTouched() {
        showAlartView(0, true)
    }
    
    
    func showAlartView(_ at:Int, _ isAdd: Bool)  {
        
        let alartVc = UIAlertController(title: isAdd ? "Add todo" : "Update todo", message: "", preferredStyle: .alert)
        alartVc.addTextField { textF in
            
            textF.placeholder = isAdd ? "Enter title" : self.models[at].title
            
        }
        
        alartVc.addTextField { textF in
            
            textF.placeholder =  isAdd ? "Enter description" : self.models[at].desc
        }
        
        let saveBtn = UIAlertAction(title: isAdd ? "Save" : "Update", style: .default) { _ in
        
            let title :String  = alartVc.textFields![0].text!
            let desc :String = alartVc.textFields?[1].text! ?? ""
            
            guard !title.isEmpty else { return }
                
            guard !desc.isEmpty else { return }

            let todo = Todo(title: title, desc: desc)
            
            if isAdd {
               // self.models.append(todo)
                DatabaseHelper.shared.saveTodo(todo)

            }else{
               // self.models[at] = todo
                DatabaseHelper.shared.updateTodo(self.models[at],todo)

            }
            self.models = DatabaseHelper.shared.getAllTodos()

            self.todoTableView.reloadData()
            
        }
        
        alartVc.addAction(saveBtn)
        self.present(alartVc, animated: true, completion: nil)
    }
    

}


extension ViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! UITableViewCell
        
        cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = models[indexPath.row].title
        cell.detailTextLabel?.text = models[indexPath.row].desc

        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let edit = UIContextualAction(style: .normal, title: "Edit") { _, _, _ in
           
            //var model = self.models[indexPath.row]
            
            self.showAlartView(indexPath.row, false)

            
            
            
        }
        edit.backgroundColor = .cyan
        let delete = UIContextualAction(style: .destructive, title: "Delete") { _, _, _ in
            
            self.models.remove(at: indexPath.row)
            DatabaseHelper.shared.deleteTodo(self.models[indexPath.row])
            self.todoTableView.reloadData()
            
        }
        return UISwipeActionsConfiguration(actions: [delete,edit])
    }
    
    
    
}


class Todo: Object {
    
  @Persisted  var title:String
  @Persisted var desc :String
    
  convenience init(title:String,desc:String) {
        self.init()
        self.title = title
        self.desc = desc
    }
}

