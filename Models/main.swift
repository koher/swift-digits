import Python

let datasets = Python.import("sklearn.datasets")
let svm = Python.import("sklearn.svm")
let model_selection = Python.import("sklearn.model_selection")

let classifier = svm.LinearSVC()
let dataset = datasets.load_digits()
let (X_train, X_test, y_train, y_test) = model_selection.train_test_split(dataset["data"], dataset["target"]).tuple4
classifier.fit(X_train, y_train)

print("train: \(classifier.score(X_train, y_train))")
print("test:  \(classifier.score(X_test, y_test))")

let coremltools = Python.import("coremltools")

let coreml_model = coremltools.converters.sklearn.convert(classifier)
coreml_model.save("Digits.mlmodel")
