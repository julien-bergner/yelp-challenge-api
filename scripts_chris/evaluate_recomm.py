import json
import os

print 'Starting to look for sick recommendations.'
for filename in os.listdir('close_neighbors'):
	awesome_recomm = []
	recomm = []
	own_reviews = []
	user_id = filename.replace('close_neighbors_neighbors_','').replace('.json','')
	with open('all_reviews_user/' + user_id + '.json') as h:
		bla = json.loads(h.read())
		for bloo in bla:
			own_reviews.append(bloo)
	with open('close_neighbors/' + filename) as f:
		neighbors = json.loads(f.read())
	for neighb in neighbors:
		neighbor = neighb[1]
		with open('all_reviews_user/' + neighbor + '.json') as g:
			y = json.loads(g.read())
			for x in y:
				if(x['stars'] >= 3):
					recomm.append({'neighbor': neighbor, 'review': x})
	for rev in recomm:
		review = rev['review']
		for own_rev in own_reviews:
			if(review['business_id'] == own_rev['business_id']):
				awesome_recomm.append({'business_id': review['business_id'], 'rating_user': own_rev['stars'], 'rating_neighbor': review['stars'], 'neighbor': rev['neighbor']})
	if(len(awesome_recomm) > 0):
		print 'Got at least one for user ' + user_id
		with open('awesome_recomm/recomm_' + user_id + '.json','w') as j:
			json.dump(awesome_recomm, j)