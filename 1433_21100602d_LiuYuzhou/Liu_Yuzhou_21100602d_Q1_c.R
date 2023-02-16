test.once<-function(seeds){
  #generate seeds to put into the sample function
  set.seed(seeds)
  a<-sample(1:100,replace=TRUE,500)
  #to generate 500 different cards
  #1:100represent 100 different type of cards
  t=1
  while(t<=500){
    #we let 100 and 99 to represent Agrippa and Ptolemy
    if(a[t]==99){
      return(0)
    }
    else if(a[t]==100){
      return(0)
    }
    t<-t+1
  }
  #to stimulate the process, we pick 1 card from the 100 type of cards,repeat it for 500 times 
  return(1)
}

time<-c(1000,100000,4000000)
#try it multiple times to see the probabilities
for(i in time){
  success<-0
  for(j in 1:i){
    t<-test.once(j)
    success<-success+t#count how many times we get the case we want
  }
  print(success/i)
  #show the result
}
