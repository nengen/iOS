// Final Exam
import UIKit

enum Status {
    case Doing, Pending, Completed
    
    init(){
        self = .Pending
    }
}

struct Task{
    var description: String
    var status = Status()
    
    init(description: String){
        self.description = description
    }
}

var task = Task(description : "Have fun")
task.status = .Completed