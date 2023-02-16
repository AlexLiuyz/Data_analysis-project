Q2
(a)just according to the question, to make four lists, and then input them into a dataframe called record

(b)to use tokenizers to tokenize the words in the text, and add a column into the dataframe

(c)I input all the words in the text into a vector, and then use unique method to avoid the repeatition of two same words, to check the words to see the whether the words appear in the text, one text add one time, if the times it appear in different text more than three, then I add the word into vocab. 
the answer
length(vocab)
[1] 4014

(d)In this question, I use three functions, classify->to add the word into different classes according to their sentiment
sentence_classify->input the sentence ito different classes and use log to calculate the result
opinion_classify->to compare the result it get in sentence_classify and put the, into different classes
then I also get a vector for stop words, to skip some not important words, then tokenize the sentence show show in the question. Call the function to classify them.
