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


# Yet to be completed
# Visualizing Errors
# plt.errorbar() is used to visualiz e the variability of data and to indicate the uncertainty in measurements. It allows you to plot error bars on a graph, which can represent the standard deviation, confidence intervals, or any other measure of variability.

# Basic Error Bar Plot
x = np.linspace(0 ,10, 50)
dy = 0.8
y = np.sin(x) + dy * np.random.randn(50)  # Create a noisy sine wave by adding random noise to the sine values
plt.errorbar(x, y, yerr = dy, fmt = 'o', color = 'red', ecolor = 'blue', elinewidth = 2, capsize = 4)  # Create an error bar plot with specified parameters
plt.title('Error Bar Plot')  # Set the title of the plot
plt.show()


# Continuous Error Bars
from sklearn.guaussian_process import GaussianProcess
model = lambda x : x * np.sin(x)  # Define a model function that takes an input x and returns x multiplied by the sine of x
xdata = np.array([1, 3, 5, 6, 8])  # Create an array of x data points
ydata = model(xdata)  # Compute the corresponding y data points using the model function

gp = GaussianProcess()  # Create an instance of the GaussianProcess class


# Density and Contour Plots


def f(x, y):
    return np.sin(x) ** 10 + np.cos(10 + y * x) * np.cos(x)

x = np.linspace(0, 5, 50)
y = np.linspace(0, 5, 40)
X, Y = np.meshgrid(x, y)    # Copies values of x and y into 2-D arrays, X and Y, respectively. This is useful for evaluating functions on a grid.
Z = f(X, Y) 
plt.contour(X, Y, Z, colors = 'black') # Takes a 2d Value and creates a Contour Plot It is actually a 3d visualizaton.
plt.contour(X, Y, Z, cmap = 'RdGy') 
plt.colorbar()
plt.show()


# Histogram, Binning and Density Plots

data = np.random.randn(1000)  # Generate 1000 random numbers from a standard normal distribution
plt.hist(data)
plt.hist(data, bins = 30, density = True, alpha = 0.5, histtype = 'stepfilled', color = 'steelblue', edgecolor = 'none')  # Create a histogram with specified parameters;
plt.show()

# Mutiple Histograms in single plot

x1 = np.random.normal(0, 0.8, 1000)
x2 = np.random.normal(-2, 1, 1000)
x3 = np.random.normal(3, 2, 1000)
kwargs = dict(histtype = 'stepfilled', alpha = 0.3, bins = 40)  # Dictionry of 'Keyword Arguments' to be passed to the 'hist' function. It is used to avoid repetition of arguments in the following lines of code.
plt.hist(x1, **kwargs)
plt.hist(x2, **kwargs)
plt.hist(x3, **kwargs);

# Compute the histogram of the data, without displaying

counts, bin_edges = np.histogram(data, bins = 30, density = True) 


# Two Dimensional Histograms and Binnings

mean = [0, 0]  # Mean of the distribution
cov = [[1, 0], [0, 1]]  # Covariance matrix
x, y = np.random.multivariate_normal(mean, cov, 1000)  # Generate 1000 random numbers from a multivariate normal distribution
plt.hist2d(x, y, bins = 30, cmap = 'Reds') 
cb = plt.colorbar() 
cb.set_label('counts in bin')


# Kernel Density Estimation (KDE) Plots

from scipy.stats import gaussian_kde  # Import the 'gaussian_kde' function from the 'scipy.stats' module
data = np.vstack([x, y])
kde = gaussian_kde(data)  # Create a Gaussian KDE object from the data
xgrid = np.linspace(-3.5, 3.5, 40)  # Create a grid of x values
ygrid = np.linspace(-6, 6, 40)  # Create a grid
X, Y = np.meshgrid(xgrid, ygrid)  # Create a meshgrid of x and y values
Z = kde.evaluate(np.vstack([X.ravel(), Y.ravel()]))  # Evaluate the KDE on the grid


# Customizing Plot legends


x = np.linspace(0, 10, 100)  
fig, ax = plt.subplots() 
ax.plot(x, np.sin(x), color = 'red', label = 'Sine')
ax.plot(x, np.cos(x), color = 'blue', label = 'Cosine')
leg = ax.legend()  # Add a legend to the plot
ax.legend(loc = 'upper left', frameon = False)  # Customize the legend location and frame

