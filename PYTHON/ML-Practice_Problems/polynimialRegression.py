# Polynomial Regression
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from sklearn.linear_model import LinearRegression
from sklearn.preprocessing import PolynomialFeatures
from sklearn.model_selection import train_test_split
from sklearn.metrics import r2_score, mean_squared_error

# 1️⃣ Load dataset
data = pd.read_csv("Advertising.csv")

# 2️⃣ Select one feature (for visualization simplicity)
X = data[['TV']]   # independent variable (2D)
y = data['Sales']  # dependent variable

# 3️⃣ Transform input into polynomial features (degree 2 or 3)
degree = 2  # you can change to 3 for a more curved line
poly = PolynomialFeatures(degree=degree)
X_poly = poly.fit_transform(X)

# 4️⃣ Split data into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(X_poly, y, test_size=0.2, random_state=0)

# 5️⃣ Train polynomial regression model
model = LinearRegression()
model.fit(X_train, y_train)

# 6️⃣ Predict
y_pred = model.predict(X_test)

# 7️⃣ Evaluate model performance
print("R² Score:", r2_score(y_test, y_pred))
print("Mean Squared Error:", mean_squared_error(y_test, y_pred))

# 8️⃣ Generate smooth curve for visualization
X_curve = np.linspace(X.min(), X.max(), 200).reshape(-1, 1)  # 200 evenly spaced TV values
X_curve_poly = poly.transform(X_curve)
Y_curve = model.predict(X_curve_poly)

# 9️⃣ Visualization
plt.figure(figsize=(7, 5))
plt.scatter(X, y, color='blue', label='Actual Data')
plt.plot(X_curve, Y_curve, color='red', linewidth=2, label=f'Polynomial Fit (degree={degree})')
plt.xlabel('TV Advertising Budget (in $1000)')
plt.ylabel('Sales (units)')
plt.title(f'Polynomial Regression (Degree = {degree})')
plt.legend()
plt.grid(True)
plt.tight_layout()
plt.show()

# 🔮 10️⃣ Predict for user input
tv_budget = float(input("Enter TV advertising budget (in thousands of dollars): "))
new_tv = poly.transform([[tv_budget]])  # transform to polynomial terms
predicted_sales = model.predict(new_tv)
print(f"Predicted Sales for ${tv_budget:.2f}k spent on TV advertising = {predicted_sales[0]:.2f} units")
