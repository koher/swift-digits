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
        
        let dataset = Python.import("sklearn.datasets").load_digits()
        let classifier = Python.import("sklearn.svm").LinearSVC()
        let (xTrain, xTest, yTrain, yTest) = Python.import("sklearn.model_selection").train_test_split(dataset["data"], dataset["target"]).tuple4

        classifier.fit(xTrain, yTrain)
        print("train: \(classifier.score(xTrain, yTrain))")
        print("test:  \(classifier.score(xTest, yTest))")
        
    }
}


SkLearn.run()
