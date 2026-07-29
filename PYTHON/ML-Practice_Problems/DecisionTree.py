# ID3 Decision Tree Algorithm Demonstration
import pandas as pd
from sklearn.preprocessing import LabelEncoder
from sklearn.tree import DecisionTreeClassifier, plot_tree
import matplotlib.pyplot as plt

# 1️⃣ Load Dataset
data = pd.read_csv("buycomputer.csv")

# 2️⃣ Encode categorical data
label_enc = LabelEncoder()
for col in data.columns:
    data[col] = label_enc.fit_transform(data[col])

# 3️⃣ Define features and target
X = data.drop(columns=['Buy'])
y = data['Buy']

# 4️⃣ Train Decision Tree using ID3 (entropy)
model = DecisionTreeClassifier(criterion='entropy', random_state=0)
model.fit(X, y)

# 5️⃣ Visualize Decision Tree
plt.figure(figsize=(12, 8))
plot_tree(model, feature_names=X.columns, class_names=['No', 'Yes'], filled=True)
plt.title("Decision Tree using ID3 Algorithm")
plt.show()
"""
# 6️⃣ Classify a new sample
# Example: Age=Youth, Income=Medium, Student=Yes, Credit_Rating=Fair
# (Encode manually according to your dataset’s LabelEncoder mappings)
new_sample = pd.DataFrame({
    'Age': [label_enc.fit_transform(['Youth'])[0]],
    'Income': [label_enc.fit_transform(['Medium'])[0]],
    'Student': [label_enc.fit_transform(['Yes'])[0]],
    'Credit_Rating': [label_enc.fit_transform(['Fair'])[0]]
})

# ⚠️ Note: The above line is a simplified example.
# In a real case, you should reuse the same encoders trained earlier for consistency.

prediction = model.predict(new_sample)
print(f"Prediction for the new sample: {'Buys Computer' if prediction[0] == 1 else 'Does Not Buy Computer'}")

"""