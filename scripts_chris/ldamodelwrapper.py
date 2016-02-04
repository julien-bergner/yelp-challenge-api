from gensim import corpora, models
import os
import json

class LdaModelWrapper:
	"""Wrapper for loading and interacting with a precalculated LDAModel"""

	def __init__(self, LdaModel, dictionary, folder):
		if type(LdaModel) == str:
			self.ldamodel = models.LdaModel.load(LdaModel)	
		else:
			self.ldamodel = LdaModel
		if type(dictionary) == str:
			with open(dictionary) as f:
				self.dictionary = json.loads(f.read())
		else:
			self.dictionary = dictionary
		self.folder = folder

	def get_user_posteriors(self, userID):
		posteriors = []
		with open(self.folder + '\\' + userID + '.json') as f:
			for line in f:
				bow = self.dictionary.doc2bow(json.loads(line)['tokens'])
				posteriors.append(self.ldamodel.get_document_topics(bow))
		return posteriors

	def get_all_posteriors(self):
		posteriors = {}
		for fileName in os.listdir(self.folder):
			userID = fileName.replace('.json','')			
			posteriors[userID] = self.get_user_posteriors(userID)		
		return posteriors