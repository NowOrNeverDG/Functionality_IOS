//
//  ChatRoomViewController.swift
//  Jan23_ChatList
//
//  Created by Ge Ding on 1/23/23.
//

import UIKit
import MessageKit
import InputBarAccessoryView

struct Sender:SenderType {
    var senderId: String
    var displayName: String
}

struct Message: MessageType {
    var sender: MessageKit.SenderType
    var messageId: String
    var sentDate: Date
    var kind: MessageKit.MessageKind
}
class ChatRoomViewController: MessagesViewController {

    
    let currentUser = Sender(senderId: "self", displayName: "Harry")
    let otherUser = Sender(senderId: "other", displayName: "Peter")
    var messageID = 7
    var messages = [MessageType]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messages.append(Message(sender: currentUser, messageId: "1", sentDate: Date().addingTimeInterval(-86400), kind: .text("Hello World")))
        messages.append(Message(sender: otherUser, messageId: "2", sentDate: Date().addingTimeInterval(-85400), kind: .text("Hello World too")))
        messages.append(Message(sender: currentUser, messageId: "3", sentDate: Date().addingTimeInterval(-84400), kind: .text("Look the world")))
        messages.append(Message(sender: otherUser, messageId: "4", sentDate: Date().addingTimeInterval(-83400), kind: .text("Look the world too")))
        messages.append(Message(sender: currentUser, messageId: "5", sentDate: Date().addingTimeInterval(-82400), kind: .text("Don't reply me")))
        messages.append(Message(sender: otherUser, messageId: "6", sentDate: Date().addingTimeInterval(-81400), kind: .text("Bye Bye")))
        
        DispatchQueue.main.async {
            self.messagesCollectionView.reloadData()
        }
        
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        messageInputBar.delegate = self as InputBarAccessoryViewDelegate

        
    }
}

extension ChatRoomViewController: MessagesDataSource, MessagesDisplayDelegate, MessagesLayoutDelegate {
    var currentSender: MessageKit.SenderType {
        return currentUser
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessageKit.MessagesCollectionView) -> MessageKit.MessageType {
        return messages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessageKit.MessagesCollectionView) -> Int {
        return messages.count
    }
    
    func messageTopLabelHeight(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        return 12
    }
}

extension ChatRoomViewController: InputBarAccessoryViewDelegate {
    func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
        messageID += 1
        messages.append(Message(sender: currentSender, messageId: String(messageID), sentDate: Date().addingTimeInterval(-81400), kind: .text(text)))
        DispatchQueue.main.async {
            self.messagesCollectionView.reloadData()
            inputBar.inputTextView.text = ""
        }
    }
}
