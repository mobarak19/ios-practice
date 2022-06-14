
import UIKit
import ViewAnimator
class ViewController: UIViewController {

    let myTable = UITableView()
    let data = ["Animation","Animation","Animation","Animation","Animation","Animation","Animation","Animation","Animation","Animation","Animation"]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myTable)
        myTable.frame = view.bounds
        myTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        myTable.delegate = self
        myTable.dataSource = self
        
    }

    func animationFunc() {
        let animation = AnimationType.from(direction: .top, offset: 300)
        UIView.animate(views: myTable.visibleCells, animations: [animation],delay: 1,duration: 1)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.animationFunc()

    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        
        cell.textLabel?.text = data[indexPath.row]
        cell.backgroundColor = .systemTeal
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = .systemRed
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row == 0 {
            let vc = FirstViewController()
            
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            
            present(nav,animated: true)
        }else   if indexPath.row == 1 {
            let vc = SecondViewController()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            
            present(nav,animated: true)
        }
    }
    
}
