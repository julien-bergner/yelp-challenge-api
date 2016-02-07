from ldamodelwrapper import LdaModelWrapper

x = LdaModelWrapper('output/lda.model', None, None)
with open('manual_topics.txt','w') as f:
	for index,topic in enumerate(x.ldamodel.show_topics(100,40,formatted=True)):
		f.write('Topic ' + str(index) + ':\n')
		#print type(topic)
		f.write(str(topic))
		f.write('\n')