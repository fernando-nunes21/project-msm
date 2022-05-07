//
//  ConverationsViewController.swift
//  msm-chat
//
//  Created by Fernando on 04/05/22.
//

import UIKit

class ConversationsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //change User to model represent conversation
    var conversationUsers = [User]()
    
    @IBOutlet weak var conversations: UITableView!
    
    @IBAction func openProfile() {
        performSegue(withIdentifier: "Profile", sender: Any?.self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        conversations.dataSource = self
        conversations.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func loadData() {
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return conversationUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "conversationCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ConversationViewCell
        let conversationUser = conversationUsers[indexPath.row]
        
        //cell.profileName.text = conversationUser.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastItem = conversationUsers.count - 1
        if indexPath.row == lastItem {
            loadData()
        }
    }
}
