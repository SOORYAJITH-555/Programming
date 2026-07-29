# Logistic Regression
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import accuracy_score, confusion_matrix, classification_report

# 1️⃣ Load dataset
data = pd.read_csv("data.csv")  # replace with your dataset name

X = data[['Age', 'EstimatedSalary']]  
y = data['Purchased']                 

# 3️⃣ Split dataset into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.25, random_state=0)

# 4️⃣ Feature scaling (recommended for logistic regression)
sc = StandardScaler()
X_train = sc.fit_transform(X_train)
X_test = sc.transform(X_test)

# 5️⃣ Create and train the Logistic Regression model
model = LogisticRegression()
model.fit(X_train, y_train)

# 6️⃣ Predict on test data
y_pred = model.predict(X_test)

# 7️⃣ Evaluate model performance
print("\nAccuracy:", accuracy_score(y_test, y_pred))
print("\nConfusion Matrix:\n", confusion_matrix(y_test, y_pred))
print("\nClassification Report:\n", classification_report(y_test, y_pred))

# 8️⃣ Visualization (optional for 2D features)
plt.figure(figsize=(6, 4))
plt.scatter(range(len(y_test)), y_test, color='blue', label='Actual')
plt.scatter(range(len(y_pred)), y_pred, color='red', marker='x', label='Predicted')
plt.title('Logistic Regression - Actual vs Predicted')
plt.xlabel('Samples')
plt.ylabel('Purchased (0/1)')
plt.legend()
plt.grid(True)
plt.tight_layout()
plt.show()

# 9️⃣ Predict for a new user input
age = float(input("Enter Age: "))
salary = float(input("Enter Estimated Salary: "))
new_data = sc.transform([[age, salary]])
prediction = model.predict(new_data)

if prediction[0] == 1:
    print("✅ The user is likely to purchase the product.")
else:
    print("❌ The user is unlikely to purchase the product.")
