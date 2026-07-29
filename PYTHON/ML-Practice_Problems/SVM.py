#  Support Vector Machine (SVM) Classifier on IRIS Dataset
import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import LabelEncoder, StandardScaler
from sklearn.svm import SVC
from sklearn.metrics import accuracy_score, classification_report, confusion_matrix, ConfusionMatrixDisplay
import matplotlib.pyplot as plt

# 1️⃣ Load dataset
data = pd.read_csv("IRIS.csv")

# 2️⃣ Select only two features for visualization (PetalLengthCm, PetalWidthCm)
X = data[['petal_length', 'petal_width']]
y = data['species']

# 3️⃣ Encode target labels
label_enc = LabelEncoder()
y = label_enc.fit_transform(y)

# 4️⃣ Split dataset
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# 5️⃣ Scale features
scaler = StandardScaler()
X_train = scaler.fit_transform(X_train)
X_test = scaler.transform(X_test)

# 6️⃣ Train SVM model
model = SVC(kernel='rbf', gamma='auto', random_state=42)
model.fit(X_train, y_train)

# 7️⃣ Predict
y_pred = model.predict(X_test)

# 8️⃣ Evaluate model
accuracy = accuracy_score(y_test, y_pred)
print(f"✅ Accuracy: {accuracy*100:.2f}%\n")
print("Classification Report:\n", classification_report(y_test, y_pred))

# 9️⃣ Confusion Matrix
cm = confusion_matrix(y_test, y_pred)
disp = ConfusionMatrixDisplay(confusion_matrix=cm, display_labels=label_enc.classes_)
disp.plot(cmap='Blues')
plt.title("Confusion Matrix - SVM Classifier (IRIS Dataset)")
plt.show()

# 🔟 Visualize Decision Boundary
plt.figure(figsize=(8, 6))

# Create a mesh grid
x_min, x_max = X_train[:, 0].min() - 1, X_train[:, 0].max() + 1
y_min, y_max = X_train[:, 1].min() - 1, X_train[:, 1].max() + 1
xx, yy = np.meshgrid(np.arange(x_min, x_max, 0.02),
                     np.arange(y_min, y_max, 0.02))

# Predict for each point in mesh
Z = model.predict(np.c_[xx.ravel(), yy.ravel()])
Z = Z.reshape(xx.shape)

# Plot the decision boundary
plt.contourf(xx, yy, Z, alpha=0.3, cmap=plt.cm.coolwarm)
plt.scatter(X_train[:, 0], X_train[:, 1], c=y_train, edgecolor='k', cmap=plt.cm.coolwarm)
plt.xlabel('Petal Length (standardized)')
plt.ylabel('Petal Width (standardized)')
plt.title('SVM Decision Boundary (Petal Length vs Petal Width)')
plt.show()
