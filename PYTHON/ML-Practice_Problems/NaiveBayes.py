# Naive Bayes Classifier for Loan Dataset

import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import LabelEncoder
from sklearn.naive_bayes import GaussianNB
from sklearn.metrics import accuracy_score, precision_score, recall_score, confusion_matrix, ConfusionMatrixDisplay
import matplotlib.pyplot as plt

# 1️⃣ Load dataset
data = pd.read_csv("LoanDataset.csv")

# 2️⃣ Handle missing values
data.fillna(data.mode().iloc[0], inplace=True)

# 3️⃣ Encode categorical features
label_enc = LabelEncoder()
for col in data.select_dtypes(include='object').columns:
    data[col] = label_enc.fit_transform(data[col])

# 4️⃣ Define features (X) and target (y)
X = data.drop(columns=['Loan_ID', 'Loan_Status'])
y = data['Loan_Status']

# 5️⃣ Split dataset
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# 6️⃣ Train Naive Bayes model
model = GaussianNB()
model.fit(X_train, y_train)

# 7️⃣ Predict
y_pred = model.predict(X_test)

# 8️⃣ Evaluate metrics
accuracy = accuracy_score(y_test, y_pred)
precision = precision_score(y_test, y_pred)
recall = recall_score(y_test, y_pred)
print(f"✅ Accuracy: {accuracy:.2f}")
print(f"✅ Precision: {precision:.2f}")
print(f"✅ Recall: {recall:.2f}")

# 9️⃣ Confusion matrix
cm = confusion_matrix(y_test, y_pred)
disp = ConfusionMatrixDisplay(confusion_matrix=cm, display_labels=['Not Approved', 'Approved'])
disp.plot(cmap='Blues')
plt.title("Confusion Matrix - Naive Bayes Loan Prediction")
plt.show()
