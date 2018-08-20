import Python

let load_digits = Python.import("sklearn.datasets").load_digits
let LinearSVC = Python.import("sklearn.svm").LinearSVC
let train_test_split = Python.import("sklearn.model_selection").train_test_split

let classifier = LinearSVC()
let dataset = load_digits()
let (X_train, X_test, y_train, y_test)
    = train_test_split(dataset["data"], dataset["target"]).tuple4
classifier.fit(X_train, y_train)

print("train: \(classifier.score(X_train, y_train))")
print("test:  \(classifier.score(X_test, y_test))")

let coremltools = Python.import("coremltools")
let coreml_model = coremltools.converters.sklearn.convert(classifier)
coreml_model.save("Digits.mlmodel")
