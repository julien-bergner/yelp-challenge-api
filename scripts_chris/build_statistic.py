#from ldasetup import *
import json
from ldamodelwrapper import LdaModelWrapper as LMW
from gensim import corpora
import os
import numpy as np
from recommender import Recommender

num_topics = 100
folder = 'C:\\Users\\christoph\\Documents\\Yelp Data Challenge\\output\\all_reviews_by_user_tokenized\\all_reviews_by_user_tokenized'

"""
tokens = []
for fileName in os.listdir(folder):
	with open(folder + '\\' + fileName) as f:
		for line in f:
			tokens.append(json.loads(line)['tokens'])

dictionary = corpora.Dictionary(tokens)
dictionary.save('all_reviews_dictionary.dict')
"""

dictionary = corpora.Dictionary.load('all_reviews_dictionary.dict')
wrapper = LMW('output\\lda.model', dictionary, folder)
posteriors = wrapper.get_all_posteriors()

def mean(posteriors):
	container = [[0]*100]*len(posteriors)
	for index, posterior in enumerate(posteriors):
		for probability in posterior:
			topic = probability[0]
			prob = probability[1]
			container[index][topic] = prob
	a = np.array(container)
	return a.mean(axis=0)

def euclidean(x,y):   
    return np.sqrt(np.sum((x-y)**2))

means = {}
for key, value in posteriors.iteritems():
	means[key] = mean(value).tolist()

"""
with open('means_eachLine.json', 'w') as f:
	for key, value in means.iteritems():
		json.dump({key: value}, f)
		f.write('\n')
	#json.dump(means,f)

#neighbors = {}
x = Recommender(means)
for user in means.iterkeys():	
	y = x.calc_neighbors(user, euclidean)
	with open('neighbors/neighbors_' + user + '.json', 'w') as f:
		json.dump(y, f)
	#neighbors[user] = y


with open('neighbors_full.json', 'w') as f:
	json.dump(neighbors, f)
"""

x = Recommender(means)
y = x.calc_distances(euclidean)
with open('all_distances.json', 'w') as f:
	json.dump(y, f)