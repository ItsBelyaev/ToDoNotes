import RealmSwift
import UIKit

class TableViewController: UITableViewController {

    var thingsToDo: Results<Todo>!
    
    var todo = Todo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        thingsToDo = realm.objects(Todo.self)
    
    }
    

    @IBAction func addPressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "New Todo", message: "❤︎", preferredStyle: .alert)
        alert.addTextField { tf in
            
        }
        
        let addAction = UIAlertAction(title: "Add", style: .cancel) { action in
            if let text = alert.textFields?.first?.text {
                let newTodo = Todo()
                newTodo.todo = text
                StorageManager.saveObject(newTodo)
                self.tableView.reloadData()

            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return thingsToDo.isEmpty ? 0 : thingsToDo.count
    }
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let todo = thingsToDo[indexPath.row]
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { _, _, _ in
            StorageManager.deleteObject(todo)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = thingsToDo[indexPath.row].todo
        
        return cell
    }
    
}

