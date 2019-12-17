//
//  PostsDao.swift
//  socialnetwork
//
//  Created by Alan Quintiliano on 16/12/19.
//  Copyright © 2019 Alan Donizete Quintiliano. All rights reserved.
//
import CoreData
import Combine

class PostsDao: DataManager {

    func savePost(post: Post) -> AnyPublisher<Post, Error> {
        return self.executeAsync() { promise in
            let postData = PostData(context: DataManager.context())
            postData.id = Int16(post.id)! 
            postData.date = Date(timeIntervalSince1970: TimeInterval(integerLiteral: post.date))
            postData.user = UserData(context: DataManager.context())
            postData.user?.email = post.user.email
            postData.user?.name = post.user.name
            postData.user?.id = Int16(post.user.id) ?? 0
            postData.reactions = try! String(data: JSONEncoder().encode(post.reactions), encoding: .utf8)
            postData.text = post.text
            
            do {
                try DataManager.context().save()
                promise(.success(post))
            } catch (let error) {
                promise(.failure(error))
            }
        }
    }

    func getPosts() -> AnyPublisher<[Post], Error> {
        return self.executeAsync() { promise in
            let request: NSFetchRequest<PostData> = PostData.fetchRequest()
            do {
                let list = try DataManager.context().fetch(request)
                let posts = list.map { (postData: PostData) -> Post in
                    let user = User(id: String(postData.user?.id ?? 0), name: postData.user?.name ?? "", email: postData.user?.email ?? "")
                    let reactions = try! JSONDecoder().decode(Dictionary<String, Int>.self, from: postData.reactions!.data(using: .utf8)!)
                    let post = Post(id: String(postData.id), user: user, text: postData.text!, date: Int64(postData.date!.timeIntervalSince1970), reactions: reactions)
                    return post
                }
                promise(.success(posts))
            } catch (let error) {
                promise(.failure(error))
            }
        }
    }

    func saveReaction(reaction: Reaction) -> AnyPublisher<Reaction, Error> {
        return self.executeAsync() { promise in
            let userData = UserData(context: DataManager.context())
            userData.email = reaction.user.email
            userData.name = reaction.user.name
            userData.id = Int16(reaction.user.id) ?? 0

            let postData = PostData(context: DataManager.context())
            postData.id = Int16(reaction.post.id)!
            postData.date = Date(timeIntervalSince1970: TimeInterval(integerLiteral: reaction.post.date))
            postData.user = userData
            postData.reactions = try! String(data: JSONEncoder().encode(reaction.post.reactions), encoding: .utf8)
            postData.text = reaction.post.text

            let reactionData = ReactionData(context: DataManager.context())
            reactionData.date = Date(timeIntervalSince1970: TimeInterval(integerLiteral: reaction.date))
            reactionData.reactionType = reaction.reactionType.rawValue
            reactionData.post = postData
            reactionData.user = userData
            reactionData.id = Int16(reaction.id) ?? 0

            do {
                try DataManager.context().save()
                promise(.success(reaction))
            } catch (let error) {
                promise(.failure(error))
            }
        }
    }
}
