
import Foundation

protocol  ToDo {
  var name: String { get set }
  var isComplete: Bool { get set }
  var subtask: [ToDo] { get set }
}

final class ToDoItemWithCheckList: ToDo {
  var name: String
  var isComplete: Bool
  var  subtask: [ToDo]
  
  init(name: String, subtask: [ToDo]) {
    self.name = name
    isComplete = false
    self.subtask = subtask
  }
   
}

final class ToDoItem: ToDo {

  // MARK: - Properties
  var name: String
  var isComplete: Bool
  var subtask: [ToDo]

  // MARK: - Initializers
  init(name: String) {
    self.name = name
    isComplete = false
    subtask = []
  }
}
