from scipy import integrate
import numpy as np
import matplotlib.pyplot as plt

def edo3(f,t,a,b,c):
  # Definimos las ecuaciones diferenciales
  x, y, z = f
  
  # Expressión
  df = [
    a*(y-x),
    x*(c-a)-x*z+c*y,
    x*y-b*z
  ]
  return df

# Definimos los parámetros
#a = 10
#b = 28
#c = 8/3

a = 35
b = 3
c = 28

# Definimos las condiciones iniciales
f0 = [20,0,20]

# Definimos el intervalo de tiempo
t = np.linspace(0,50,10000)

# Resolvemos el sistema
s3 = integrate.odeint(edo3, f0, t, args=(a,b,c))



fig = plt.figure(8)
ax = plt.axes(projection='3d')
ax.plot3D(s3[0:5000,0], s3[0:5000,1], s3[0:5000,2], 'b')
ax.plot3D(s3[5000:10000,0], s3[5000:10000,1], s3[5000:10000,2], 'r')
plt.title('Atractor caótico de Chen')
plt.xlabel('x')
plt.ylabel('y')
plt.ylabel('z')
plt.show()

s3a = integrate.odeint(edo3, f0, t, args=(35,3,28))
s3b = integrate.odeint(edo3, f0, t, args=(30,3,20))
s3c = integrate.odeint(edo3, f0, t, args=(55,4,35))

fig = plt.figure(8)
ax = plt.axes(projection='3d')
ax.plot3D(s3a[:,0], s3a[:,1], s3a[:,2], 'b', linewidth=0.6)
ax.plot3D(s3b[:,0], s3b[:,1], s3b[:,2], 'k', linewidth=0.6)
ax.plot3D(s3c[:,0], s3c[:,1], s3c[:,2], 'r', linewidth=0.6)
plt.title('Atractor caótico de Chen')
plt.xlabel('x')
plt.ylabel('y')
plt.ylabel('z')
plt.show()