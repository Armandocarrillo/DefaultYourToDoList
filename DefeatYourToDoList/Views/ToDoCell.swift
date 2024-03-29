

import UIKit

public class ToDoCell: UICollectionViewCell {

  // MARK: - IBOutlets
  @IBOutlet var toDoLabel: UILabel!
  @IBOutlet var checkBoxView: UIView!
  @IBOutlet var subTaskCollectionView: UICollectionView!

  // MARK: - Properties
  var subtasks: [ToDo] = []
  
  public override func layoutSubviews() {
    checkBoxView.layer.borderWidth = 1
    checkBoxView.layer.borderColor = UIColor.black.cgColor
    
    subTaskCollectionView.register(UINib(nibName: "ToDoCell", bundle: nil),
                                   forCellWithReuseIdentifier: "cell")
    subTaskCollectionView.delegate = self
    subTaskCollectionView.dataSource = self

    super.layoutSubviews()
  }
}

extension ToDoCell: UICollectionViewDataSource {

  public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return subtasks.count
  }

  public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ToDoCell

    let currentToDo = subtasks[indexPath.row]
    if currentToDo.isComplete {
      cell.checkBoxView.backgroundColor = UIColor(red: 0.24, green: 0.56, blue: 0.30, alpha: 1.0)
    } else {
      cell.checkBoxView.backgroundColor = .white
    }

    cell.toDoLabel.text = currentToDo.name
    return cell
  }
}

// MARK: - UICollectionViewDelegate
extension ToDoCell: UICollectionViewDelegate {

  public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    var currentToDo = subtasks[indexPath.row]

    if currentToDo.isComplete {
      currentToDo.isComplete = false
    } else {
      currentToDo.isComplete = true
    }
    collectionView.reloadData()
  }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ToDoCell: UICollectionViewDelegateFlowLayout {

  public func collectionView(_ collectionView: UICollectionView,
                             layout collectionViewLayout: UICollectionViewLayout,
                             sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = collectionView.frame.width
    let height: CGFloat = 60
    
    return CGSize(width: width, height: height)
  }
  
  public func collectionView(_ collectionView: UICollectionView,
                             layout collectionViewLayout: UICollectionViewLayout,
                             minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 0.0
  }
  
  public func collectionView(_ collectionView: UICollectionView, layout
    collectionViewLayout: UICollectionViewLayout,
                             minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0.0
  }
}
