# Import required libraries
import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import LabelEncoder, StandardScaler
from sklearn.metrics import accuracy_score, precision_score, recall_score, confusion_matrix, classification_report
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense

# Step 1: Load the dataset
data = pd.read_csv("IRIS.csv")
print("First 5 records:\n", data.head())

# Step 2: Separate features and target
X = data.drop('species', axis=1)
y = data['species']

# Step 3: Encode the categorical target labels
le = LabelEncoder()
y = le.fit_transform(y)

# Step 4: Standardize the feature data
scaler = StandardScaler()
X_scaled = scaler.fit_transform(X)

# Step 5: Split dataset into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(X_scaled, y, test_size=0.2, random_state=42)

# Step 6: Build the ANN model
model = Sequential()

# Input layer + First hidden layer
model.add(Dense(8, input_dim=4, activation='relu'))

# Second hidden layer
model.add(Dense(6, activation='relu'))

# Output layer (3 classes -> softmax)
model.add(Dense(3, activation='softmax'))

# Step 7: Compile the model
model.compile(optimizer='adam', loss='sparse_categorical_crossentropy', metrics=['accuracy'])

# Step 8: Train the model (backpropagation happens automatically here)
history = model.fit(X_train, y_train, epochs=100, batch_size=8, verbose=0)

# Step 9: Test the model
y_pred = np.argmax(model.predict(X_test), axis=-1)

# Step 10: Evaluate performance
acc = accuracy_score(y_test, y_pred)
prec = precision_score(y_test, y_pred, average='weighted')
rec = recall_score(y_test, y_pred, average='weighted')
cm = confusion_matrix(y_test, y_pred)

print("\n=== Model Evaluation ===")
print(f"Accuracy: {acc:.2f}")
print(f"Precision: {prec:.2f}")
print(f"Recall: {rec:.2f}")
print("\nConfusion Matrix:\n", cm)
print("\nClassification Report:\n", classification_report(y_test, y_pred, target_names=le.classes_))
