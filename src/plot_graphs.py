#plot_graphs.py

import matplotlib.pyplot as plt

def plot_absolute(runtime_matrix, fast_runtime, fig_name)
  cores = [1, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80]
  y1 = runtime_matrix[1, :]./fast_runtime
  y2 = runtime_matrix[2, :]./fast_runtime
  y3 = runtime_matrix[3, :]./fast_runtime
  y4 = runtime_matrix[4, :]./fast_runtime
  plt.plot(cores[1:11], y4, 's-', label = "(P)Condat", color = "red")
  plt.plot(cores[1:11], y3, 'o-', label = "(P)Michelot", color = "blue")
  plt.plot(cores[1:11], [1]*10, '--', label = "(S)Condat", color = "grey")
  plt.plot(cores[1:11], y2, '<-', label = "(P)Sort and (P)Scan", color = "orange")
  plt.plot(cores[1:11], y1, '>-', label = "(P)Sort and Scan", color = "green")
  plt.ylabel("absolute speedup")
  plt.xlabel("number of cores")
  plt.xticks([8, 16, 24, 32, 40, 48, 56, 64, 72, 80])
  plt.legend()
  resolution_value = 300
  plt.savefig("fig_name", format="png", dpi=resolution_value)
  plt.show()

def plot_relative_simplex(runtime_matrix, serial_runtime, fig_name)
  cores = [1, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80]
  y1 = runtime_matrix[1, :]./serial_runtime[1]
  y2 = runtime_matrix[2, :]./serial_runtime[2]
  y3 = runtime_matrix[3, :]./serial_runtime[3]
  plt.plot(cores[1:11], y3, 's-', label = r'$N(0,0.001)$', color = "red")
  plt.plot(cores[1:11], y2, '^-', label = r'$U[0,1]$', color = "green")
  plt.plot(cores[1:11], y1, 'o-', label = r'$N(0,1)$', color = "blue")
  plt.ylabel("relative speedup")
  plt.xlabel("number of cores")
  plt.xticks([8, 16, 24, 32, 40, 48, 56, 64, 72, 80])
  plt.legend()
  resolution_value = 300
  plt.savefig("fig_name", format="png", dpi=resolution_value)
  plt.show()
  
def plot_relative_others(runtime_matrix, serial_runtime, fig_name)
  cores = [1, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80]
  cores = [1, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80]
  y1 = runtime_matrix[1, :]./serial_runtime[1]
  y2 = runtime_matrix[2, :]./serial_runtime[2]
  y3 = runtime_matrix[3, :]./serial_runtime[3]
  y4 = runtime_matrix[4, :]./serial_runtime[4]
  plt.plot(cores[1:11], y4, 's-', label = "(P)Condat", color = "red")
  plt.plot(cores[1:11], y3, 'o-', label = "(P)Michelot", color = "blue")
  plt.plot(cores[1:11], y2, '<-', label = "(P)Sort and (P)Scan", color = "orange")
  plt.plot(cores[1:11], y1, '>-', label = "(P)Sort and Scan", color = "green")
  plt.ylabel("relative speedup")
  plt.xlabel("number of cores")
  plt.xticks([8, 16, 24, 32, 40, 48, 56, 64, 72, 80])
  plt.legend()
  resolution_value = 300
  plt.savefig("fig_name", format="png", dpi=resolution_value)
  plt.show()
