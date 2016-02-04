import json
import os

review_folder = 'output\\all_reviews_by_user\\all_reviews_by_user'
cutoff = 0.21
no_recomm = []
medium_recomm = []
good_recomm = []
try:
	for fileName in os.listdir('neighbors2'):
		with open('neighbors2/' + fileName) as f:
			close_neighbors = []
			neighbors = json.loads(f.read())
			for neighbor in neighbors:
				if round(neighbor[0],2) <= cutoff:
					close_neighbors.append(neighbor)
			if(len(close_neighbors) == 0):
				no_recomm.append(fileName)
			elif(len(close_neighbors) > 0 and len(close_neighbors) <= 5):
				medium_recomm.append(fileName)
			elif(len(close_neighbors) >= 10):
				good_recomm.append(fileName)
			with open('close_neighbors/close_neighbors_' + fileName,'w') as h:
				json.dump(close_neighbors,h)
finally:
	with open('no_recomm2.json','w') as f:
		json.dump(no_recomm,f)
	with open('medium_recomm2.json','w') as g:
		json.dump(medium_recomm,g)
	with open('good_recomm2.json','w') as h:
		json.dump(good_recomm,h)