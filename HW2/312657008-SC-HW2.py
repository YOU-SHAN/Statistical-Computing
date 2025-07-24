# %%  當v~uniform(0, 10), w~uniform(0, 20)
import random
import math
import matplotlib.pyplot as plt
import scipy.stats as stats

n, T, H = 0, 0, 0

curve = [i * math.pi / 2 + math.pi / 4 for i in range(128)]
curve = [0] + curve
curve = list(map(lambda x: x * 9.8, curve))

num_coll = []
outcome_color = {'H': 'r', 'T': 'b'}

while n < 7000:
    v = random.uniform(0, 10)
    w = random.uniform(0, 20)
    num = v * w
    num_coll.append((v, w))

    for i in range(len(curve) - 1):
        if curve[i] <= num < curve[i + 1]:
            if i % 2 == 0:
                H += 1
                plt.scatter(v, w, color=outcome_color['H'])
            else:
                T += 1
                plt.scatter(v, w, color=outcome_color['T'])

    n += 1

print("Heads:", H)
print("Tails:", T)

plt.scatter([], [], color='r', label='Head')
plt.scatter([], [], color='b', label='Tail')
plt.legend(loc='upper right', bbox_to_anchor=(1.25, 1))
plt.title('Simulation of Coin Tossing Under a Uniform Distribution')
plt.xlabel('Velocity (v)')
plt.ylabel('Angular Velocity (w)')
plt.tight_layout()
plt.show()
print("檢驗銅板是否公正")
p_value = stats.binom_test(H, n, p=0.5)
if p_value < 0.05:
    print("reject the null hypothesis, that is, the coin is unfair.")
else:
    print("do not reject the null hypothesis, that is, the coin can be fair.")

# %% 當v~truncnorm(0, 10), w~truncnorm(0, 20)
import scipy.stats as stats
import numpy as np 
import matplotlib.pyplot as plt
import math

n, T, H = 0, 0, 0

mu_v, sigma_v = 5, 1
lower_v, upper_v = 0, 10

mu_w, sigma_w = 10, 1
lower_w, upper_w = 0, 20


X = stats.truncnorm((lower_v - mu_v)/sigma_v, (upper_v - mu_v)/sigma_v, loc=mu_v, scale=sigma_v)
Y = stats.truncnorm((lower_w - mu_w)/sigma_w, (upper_w - mu_w)/sigma_w, loc=mu_w, scale=sigma_w)

curve = [i * np.pi / 2 + np.pi / 4 for i in range(128)]
curve = [0] + curve
curve = list(map(lambda x: x * 9.8, curve))

num_coll = []
outcome_color = {'H': 'r', 'T': 'b'}

while n < 7000:
    v = X.rvs(1)
    w = Y.rvs(1)
    num = v * w
    num_coll.append((v, w))

    for i in range(len(curve) - 1):
        if curve[i] <= num < curve[i + 1]:
            if i % 2 == 0:
                H += 1
                plt.scatter(v, w, color=outcome_color['H'])
            else:
                T += 1
                plt.scatter(v, w, color=outcome_color['T'])

    n += 1

print("Heads:", H)
print("Tails:", T)

plt.scatter([], [], color='r', label='Head')
plt.scatter([], [], color='b', label='Tail')
plt.legend(loc='upper right', bbox_to_anchor=(1.25, 1))
plt.title('Simulation of Coin Tossing Under a Truncated Normal Distribution')
plt.xlabel('Velocity (v)')
plt.ylabel('Angular Velocity (w)')
plt.tight_layout()
plt.show()
print("檢驗銅板是否公正")
p_value = stats.binom_test(H, n, p=0.5)
if p_value < 0.05:
    print("reject the null hypothesis, that is, the coin is unfair.")
else:
    print("do not reject the null hypothesis, that is, the coin can be fair.")