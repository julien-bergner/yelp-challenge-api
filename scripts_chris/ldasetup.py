import json
from gensim import corpora, models
import time
from nltk.tokenize import RegexpTokenizer
from stop_words import get_stop_words
import anticontract
import pickle

class UserBuilder:
	"""Used to build a set of users from json data - either directly or read from a file"""

	def __init__(self, documents, dataType = None):
		"""
		Documents may be either a list of dictionaries or a file name.
		dataType is used to convey information about the form of the documents:
			- 'load-single' is used to read a single list of dictionaries from a file
			- 'load-multi' is used to read each line of a file as a list
		Each dictionary must contain a keyword 'user_id' with the user's id as value
		Each dictionary must also contain a keyword 'text' with the review string as value
		"""	
		self.users = {}			
		if dataType == 'load-single':
			with open(documents) as f:
				self.documents = json.loads(f.read())
		elif dataType == 'load-multi':
			self.documents = []
			with open(documents) as f:
				for line in f:
					self.documents.append(json.loads(line))
		else:
			self.documents = documents

	def build_users(self):	
		print 'Building users.\n'	
		for review in self.documents:
			user = review["user_id"]
			if(user in self.users):
				self.users[user].append(review['text'])
			else:
				self.users[user] = []
				self.users[user].append(review['text'])
		print 'Done building users.\n'

	def save(self, fileName):
		print 'Saving users to file ', fileName, '.\n' 
		with open(fileName + '.json','w') as g:
			json.dump(self.users, g)
		print 'Done saving users.\n'

class UserTokenizer:
	"""Build a list of tokens for the given user(s) """

	stop_en = get_stop_words('en')
	tokenizer = RegexpTokenizer(r'\w+')

	def __init__(self, users):
		self.tokenized_docs = {}
		self.users = users

	def tokenize(self):				
		print 'Tokenizing users.\n'
		for user,docs in self.users.iteritems():
			doc_lower = " ".join(docs).lower().replace("w/","").replace("\n","")
			doc_final = anticontract.expand_contractions(doc_lower)
			tokens = self.tokenizer.tokenize(doc_final)
			clean_tokens = [token for token in tokens if token not in self.stop_en]
			self.tokenized_docs[user] = clean_tokens
		print 'Done tokenizing users.\n'
	
	def save(self, fileName):		
		print 'Saving tokenized users to file ', fileName, '.\n'
		with open(fileName + '.json','w') as f:
			json.dump(self.tokenized_docs,f)
		print 'Done saving tokenized users.\n'


class DictionaryBuilder:
	"""Build dictionary that assigns an id to each unique token. Used for building the document-term-matrix."""

	def __init__(self, tokUsers):
		self.tokUsers = tokUsers

	def build(self):
		self.srcTexts = []
		print "Building dictionary.\n"
		for value in self.tokUsers.itervalues():
			self.srcTexts.append(value)
		self.dictionary = corpora.Dictionary(self.srcTexts)
		print 'Done building dictionary.\n'

	def save(self, fileNameDict, fileNameTexts):
		print 'Saving dictionary.\n'
		self.dictionary.save(fileNameDict + '.dict')
		#with open(fileNameTexts + '.json', 'w') as f:
		#	json.dump(self.srcTexts,f)
		print 'Done saving dictionary.\n'

class DTMBuilder:
	"""Builds a document-term-matrix from a given dictionary of id-token pairs"""

	def __init__(self, dictionary, srcTexts):
		self.dictionary = dictionary
		self.srcTexts = srcTexts
		self.dtm = []

	def build(self):
		print 'Building document-term-matrix.\n'
		self.dtm = [self.dictionary.doc2bow(text) for text in self.srcTexts]
		print 'Done building document-term-matrix.\n'

	def save(self,fileName):
		print 'Saving document-term-matrix.\n'
		with open(fileName + '.json','w') as f:
			pickle.dump(self.dtm,f)
		print 'Done saving document-term-matrix.\n'

class LDAWrapper:
	"""Wrapper class for easy use of LDA algorithm as given in gensim package"""

	def __init__(self, dtm, dictionary):
		self.dtm = dtm
		self.dictionary = dictionary

	def run(self, num_topics = 10, passes = 10):
		print 'Fitting LDA model.\n'
		self.ldamodel = models.ldamodel.LdaModel(self.dtm, num_topics = num_topics, id2word = self.dictionary, passes = passes)
		print 'Done fitting LDA model.\n'

	def save(self, fileName):
		print 'Saving fitted LDAModel.\n'
		self.ldamodel.save(fileName + '.model')
		print 'Done saving LDAModel.\n'