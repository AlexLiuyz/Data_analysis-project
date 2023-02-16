
#Qd
#add the words into the class we want to add, at the same time ignore the stop words
classify<-function(a,b){
  for(word in a){
    condition=TRUE
    for(vocabulary in vocab){
      if(word==vocabulary){
        b<-append(b,word)
      }
    }
  }
  return(b)
}

#to input the sentence in to a specific class and calculate the results according to naive Bayes method
sentence_classify<-function(sentences,opinion,size,size1){
  result=(size1)/(p+neu+neg)
  for(sentence in sentences){
    for(word in sentence){
      count=0
      for(i in opinion){
        if(word==i){
          count=count+1
        }
      }
      result=result*(count+1)/(size+size_vocab)
    }
  }
  result=log(result)
  return(result)
}

#get the value calculate by function sentence_classify, compare them to get the max value, get the opinion
opinion_classify<-function(sentences){
  result1<-sentence_classify(sentences,positive,size_positive,p)
  result2<-sentence_classify(sentences,neutral,size_neutral,neu)
  result3<-sentence_classify(sentences,negative,size_negative,neg)
  k<-max(result1,result2,result3)
  if(result1==k){
    print("positive")
  }
  if(result2==k){
    print("neutral")
  }
  if(result3==k){
    print("negative")
  }
}

p=0
neu=0
neg=0
#to count the words in each class, also ignore the stop words 
for(i in sentiment){
  condition=TRUE
  for(stop in ignore){
    if(stop==word){
      condition=FALSE
    }
  }
  if(condition){
    if(i=="positive"){
      p=p+1
    }
    if(i=="neutral"){
      neu=neu+1
    }
    if(i=="negative"){
      neg=neg+1
    }
  }
}

tatal=neg+neu+p
negative<-c()
positive<-c()
neutral<-c()
index=0
size_vocab<-length(vocab)
condition<-TRUE
#to call the functions to classify the words in 
for(sentence in tokens){
  index=index+1
  if(sentiment[index]=="positive"){
    positive=classify(sentence,positive)
  }
  if(sentiment[index]=="negative"){
    negative=classify(sentence,negative)
  }
  if(sentiment[index]=="neutral"){
    neutral=classify(sentence,neutral)
  }
}

size_vocab<-length(vocab)
#get the length of each class
size_positive<-length(positive)
size_neutral<-length(neutral)
size_negative<-length(negative)
sentence1<-tokenize_words("I love the banner that was unfurled in the United end last night. It read: Chelsea - Standing up against racism since Sunday")
sentence2<-tokenize_words("So Clattenburg¡¯s alleged racism may mean end of his career; Terry,Suarez, Rio use it and can¡¯t play for a couple of weeks?")
sentence3<-tokenize_words("In our busy lives in Dubai could we just spare a moment of silence this Friday morning for the people who still wear crocs.")
#call the function to classify the option of each sentence
opinion_classify(sentence1)
opinion_classify(sentence2)
opinion_classify(sentence3)

#Qd
#add the words into the class we want to add
classify<-function(a,b){
  for(word in a){
    for(vocabulary in vocab){
      if(word==vocabulary){
        b<-append(b,word)
      }
    }
  }
  return(b)
}

#to input the sentence in to a specific class and calculate the results according to naive Bayes method
sentence_classify<-function(sentences,opinion,size,size1){
  result=(size1)/(p+neu+neg)
  for(sentence in sentences){
    for(word in sentence){
      count=0
      for(i in opinion){
        if(word==i){
          count=count+1
        }
      }
      print(count)
      result=result*(count+1)/(size+size_vocab)
    }
  }
  result=log(result)
  return(result)
}

#get the value calculate by function sentence_classify, compare them to get the max value, get the opinion
opinion_classify<-function(sentences){
  result1<-sentence_classify(sentences,positive,size_positive,p)
  result2<-sentence_classify(sentences,neutral,size_neutral,neu)
  result3<-sentence_classify(sentences,negative,size_negative,neg)
  k<-max(result1,result2,result3)
  if(result1==k){
    print("positive")
  }
  if(result2==k){
    print("neutral")
  }
  if(result3==k){
    print("negative")
  }
}

p=0
neu=0
neg=0
for(i in sentiment){
  if(i=="positive"){
    p=p+1
  }
  if(i=="neutral"){
    neu=neu+1
  }
  if(i=="negative"){
    neg=neg+1
  }
}
tatal=neg+neu+p
negative<-c()
positive<-c()
neutral<-c()
index=0
size_vocab<-length
#to call the functions to classify the words in 
for(sentence in tokens){
  index=index+1
  if(sentiment[index]=="positive"){
    positive=classify(sentence,positive)
  }
  if(sentiment[index]=="negative"){
    negative=classify(sentence,negative)
  }
  if(sentiment[index]=="neutral"){
    neutral=classify(sentence,neutral)
  }
}

size_vocab<-length(vocab)
#get the length of each class
size_positive<-length(positive)
size_neutral<-length(neutral)
size_negative<-length(negative)
sentence1<-tokenize_words("I love the banner that was unfurled in the United end last night. It read: Chelsea - Standing up against racism since Sunday")
sentence2<-tokenize_words("So Clattenburg¡¯s alleged racism may mean end of his career; Terry,Suarez, Rio use it and can¡¯t play for a couple of weeks?")
sentence3<-tokenize_words("In our busy lives in Dubai could we just spare a moment of silence this Friday morning for the people who still wear crocs.")
#call the function to classify the option of each sentence
opinion_classify(sentence1)
opinion_classify(sentence2)
opinion_classify(sentence3)