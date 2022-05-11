//
//  ContactsViewController.swift
//  msm-chat
//
//  Created by Fernando on 08/05/22.
//

import UIKit

class ContactsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var contacts = [Contact]()
    
    @IBOutlet weak var listContacts: UITableView!
    
    @IBAction func openConversations(_ sender: Any) {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ConversationViewController")
        self.dismiss(animated: false, completion: nil)
        self.presentingViewController?.present(controller, animated: false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        
        listContacts.dataSource = self
        listContacts.delegate = self
        
    }
    
    func loadData() {
        let contact1 = Contact(id: "12345", name: "Teste contato", username: "teste", status: "To de boa", profileImage: URL(string: "http://www.teste.com.br/image1")!)
        contacts.append(contact1)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "contactsCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ContactsViewCell
        let contact = contacts[indexPath.row]
        
        cell.name.text = contact.name
        cell.status.text = contact.status
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastItem = contacts.count - 1
        if indexPath.row == lastItem {
            loadData()
        }
    }
}
