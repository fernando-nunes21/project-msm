//
//  ConverationsViewController.swift
//  msm-chat
//
//  Created by Fernando on 04/05/22.
//

import UIKit

class ConversationsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //change User to model represent conversation
    var conversationUsers = [Conversation]()
    
    @IBOutlet weak var conversations: UITableView!
    
    @IBAction func openProfile() {
        performSegue(withIdentifier: "Profile", sender: Any?.self)
    }
    
    @IBAction func openContacts(_ sender: Any) {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ContactsViewController")
        self.dismiss(animated: false, completion: nil)
        self.presentingViewController?.present(controller, animated: false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        conversations.dataSource = self
        conversations.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func loadData() {
        let conversation1 = Conversation(id: "teste", lastMessage: "Mensagem de teste", sendAt: Date(), senderProfileImage: URL(string: "http://www.teste.com.br/image1")!, fromUser: "12345", toUser: "23456")
        conversationUsers.append(conversation1)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return conversationUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "conversationCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ConversationViewCell
        let conversationUser = conversationUsers[indexPath.row]
        
        cell.lastMessage.text = conversationUser.lastMessage
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastItem = conversationUsers.count - 1
        if indexPath.row == lastItem {
            loadData()
        }
    }
}
