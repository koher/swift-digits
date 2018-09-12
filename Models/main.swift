/*
For Xcode 10 projects
https://conda.io/miniconda.html
conda create -n swiftpython  python=2.7.9
source activate swiftpython
pip install --upgrade pip
pip install scikit-learn

in Schema > Run > Pre-actions > source activate swiftpython 
*/

import Foundation
import Python


class SkLearn{
    
    static func run(){
        let sys = Python.import("sys")
        let  path = "/Users/\(NSUserName())/miniconda3/envs/swiftpython/lib/python2.7/site-packages/"
        sys.path.append(path)
        
        let load_digits = Python.import("sklearn.datasets").load_digits
        let LinearSVC = Python.import("sklearn.svm").LinearSVC
        let train_test_split = Python.import("sklearn.model_selection").train_test_split
        
        let classifier = LinearSVC()
        let dataset = load_digits()
        let (X_train, X_test, y_train, y_test) = train_test_split(dataset["data"], dataset["target"]).tuple4
        classifier.fit(X_train, y_train)
        
        print("train: \(classifier.score(X_train, y_train))")
        print("test:  \(classifier.score(X_test, y_test))")
    }
}


SkLearn.run()
