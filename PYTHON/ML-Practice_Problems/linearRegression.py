# Single Variable Linear Regression
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn.metrics import r2_score, mean_squared_error

# 1️⃣ Load dataset
data = pd.read_csv("Advertising.csv")

# 2️⃣ Split into input (X) and output (Y)
feature=['TV','Radio','Newspaper']
target='Sales'
X = data[['TV']]   # must be 2D for sklearn
y = data[target]

# 3️⃣ Split into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=0)

# 4️⃣ Create and train model
model = LinearRegression()
model.fit(X_train, y_train)

# 5️⃣ Predict on test data
y_pred = model.predict(X_test)

# 6️⃣ Evaluate accuracy
print("R² Score:", r2_score(y_test, y_pred))
print("Mean Squared Error:", mean_squared_error(y_test, y_pred))
#print("Model Coefficient (m):", model.coef_[0])
#print("Model Intercept (c):", model.intercept_)

# 7️⃣ Visualize regression line
plt.scatter(X, y, color='blue', label='Actual Data')
plt.plot(X_test, y_pred, color='red', label='Regression Line')
plt.xlabel('TV')
plt.ylabel('Sales')
plt.legend()
plt.show()

# 🔮 Predict Sales for a user-input TV advertising budget
tv_budget = float(input("Enter TV advertising budget (in thousands of dollars): "))
new_tv = pd.DataFrame([[tv_budget]], columns=['TV'])
predicted_sales = model.predict(new_tv)
print(f"Predicted Sales for ${tv_budget:.2f}k spent on TV advertising = {predicted_sales[0]:.2f} units")

"""
# Display regression equation
m = model.coef_[0]
c = model.intercept_
print(f"\nRegression Equation: y = {m:.2f}x + {c:.2f}")
"""
