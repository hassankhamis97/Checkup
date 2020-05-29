
import Foundation
import Network

class ProfilePresenter:IProfilePresenter,ICheckConnection{
  
    
    
    
    var userId:String!
    
    
    func onSucessfullyConnected() {
          
             let profileModel=ProfileModel(profilePresenterRef: self)
                                          self.profileView.showIndicator()
                  
                               
                  
                                       profileModel.getUser(userId: userId)
                  
    }
    
    func onFailConnected() {
        print("There's no internet connection.")
        self.profileView.errorMessage(msg: "No internet connection")
        let profileModel=ProfileModel(profilePresenterRef: self)
        profileModel.getUserRealm(userId: userId)
        
    }
    
  
    var profileView:IProfileView
    
    
    init(profileView:IProfileView) {
        self.profileView=profileView
    }
    
    func getUser(userId: String)  {
        self.userId=userId
        

        
        var check = InternetConnection.checkInternetConnection(iCheckConnection: self)
    
    
    }
    
    func onSuccess(user:User) {
        profileView.hideIndicator()
        profileView.renderProfileView(user: user)
        
    }
    
    func onFail(message: String) {
        profileView.hideIndicator()
        profileView.errorMessage(msg: message)
    }
    
 func onSucessRealm(userName: String) {
       profileView.renderRealmProfileView(userName: userName)
   }

}
