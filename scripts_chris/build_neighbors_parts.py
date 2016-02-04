import json
from ldamodelwrapper import LdaModelWrapper as LMW
from gensim import corpora
import os
import numpy as np
from recommender import Recommender

def euclidean(x,y):   
    return np.sqrt(np.sum((x-y)**2))

userCurrPart = []
with open('parts/part5.json') as f:
	for line in f:
		dct = json.loads(line)
		key = dct.keys()[0]
		userCurrPart.append(key)

with open('means.json') as f:
	means = json.loads(f.read())

x = Recommender(means)
for user in userCurrPart:	
	y = x.calc_neighbors(user, euclidean, threshhold = 0.21)
	with open('close_neighbors/close_neighbors_neighbors_' + user + '.json', 'w') as f:
		json.dump(y, f)
	#neighbors[user] = y


