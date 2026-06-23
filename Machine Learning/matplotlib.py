import numpy as np

import matplotlib.pyplot as plt
import matplotlib as mpl


# Styling

print(plt.style.available)  # Check Styles
plt.style.use('classic') # Set Styles


# Simple Line Plots

fig = plt.figure()  # Create an object of Figure Class - The Empty Window that pops up
ax = plt.axes()     # Create an object of 'axes' Class - Individual Plotting Area (Charts)
x = np.linspace(0, 10, 100) # Create an array
ax.plot(x, np.sin(x), color = 'red')   # Fill and plot values of 'axes' with respect to 'x-axis' and 'y-axis'
plt.title('Simple Line Plot')   # Set title
plt.tight_layout()  # Adjust the padding between and around subplots.
plt.show()



# Multiple Line Plots

fig, (ax1 ,ax2) = plt.subplots(1,2, figsize = (10,5))  # Create a figure and a set of subplots
x = np.linspace(0, 10, 100)  # Create an array
ax1.plot(x, np.sin(x), color = 'red')  # Plot on the
ax1.set_title('Sine Wave')  # Set title for the first subplot

ax2.plot(x, np.cos(x), color = 'blue',)  # Plot on the second subplot
ax2.set_title('Cosine Wave')  # Set title for the second subplot    
plt.show()  # Display the plots


# Adjusting the Plot: line Color and Styles

ax1.plot(x, np.sin(x), color = 'red', linestyle = 'dashdot')  # Passing linestyle as an argument to the plot function
ax2.plot(x, np.cos(x), color = 'blue', linestyle = 'solid') 


#  Adjusting the Plot: Axes Limits

ax1.set_xlim(0, 10)  # Set x-axis limits for the first subplot
ax1.set_ylim(-1, 1)  # Set y-axis limits for the first

ax2.set_xlim(0, 10)  # Set x-axis limits for the second subplot
ax2.set_ylim(-1, 1)  # Set y-axis limits for the second


# Simple Scatter Plots

ax.plot(x, np.sin(x), 'o', color = 'red')  # Plotting points with 'o' marker, Remaining is same as 'axes'


# Combining Line and Scatter Plots. This way it will be combined

ax.plot(x, np.sin(x), color = 'red')  # Line Plot
ax.plot(x, np.sin(x), 'o', color = 'blue')  # Scatter


# Scatter plot using 'scatter' function


plt.scatter(x, np.sin(x), color = 'green', marker = 'o' )  # Scatter plot using scatter function, Remaining is same as 'axes'


rng = np.random.RandomState(0)  # Create a random number generator
x = rng.randn(100)  # Generate 100 random numbers for x-axis
y = rng.randn(100)  # Generate 100 random numbers for y-axis
colors = rng.rand(100)  # Generate 100 random numbers for colors
sizes = 1000 * rng.rand(100)  # Generate 100 random numbers for sizes, Scale it by multiplying with 1000
plt.scatter(x, y, c = colors, s = sizes, alpha = 0.5, cmap = 'viridis')  # Create a scatter plot with varying colors and sizes
plt.colorbar()  # Show color scale


# Multidimensional Scatter Plots. Folowing are dimensions
    # 1 - x - axis
    # 2 - y - axis
    # 3 - color
    # 4 - size
# Each point in the scatter plot can be represented by 4 dimensions. The x and y coordinates determine the position of the point, while the color and size can represent additional information about the data point.

plt.scatter(x, y, c = colors, s = sizes, alpha = 0.5, cmap = 'viridis')  # Create a scatter plot with varying colors and sizes


# Example of 'IRIS' dataset
from sklearn.datasets import load_iris  # Import the 'load_iris' function from the 'sklearn.datasets' module
iris = load_iris()  # Load the IRIS dataset
features = iris.data.T
sizes = features[3] * 100
plt.scatter(features[0], features[1], alpha= 0.2, s= sizes, c = iris.target, cmap = 'viridis')  # Create a scatter plot of the first two features of the IRIS dataset, colored by the target variable
plt.xlabel(iris.feature_names[0])  # Set the x-axis label to the name of the first feature
plt.ylabel(iris.feature_names[1])  # Set the y-axis label to the name
plt.colorbar(label = 'target')  # Add a colorbar to the plot, labeled with 'target'
plt.show()