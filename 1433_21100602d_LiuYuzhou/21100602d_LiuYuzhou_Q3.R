library(ggplot2)
myfile<-read.csv("points.txt",header=FALSE,sep=",")
x_axes<-myfile$V1
y_axes<-myfile$V2
#to calculate the distance
#and group the points which close to each center together according to the together
cluster_points<-function(x,y,c1x,c2x,c3x,c1y,c2y,c3y){
  distance1=(x-c1x)**2+(y-c1y)**2
  distance2=(x-c2x)**2+(y-c2y)**2
  distance3=(x-c3x)**2+(y-c3y)**2
  distance=min(distance1,distance2,distance3)
  if(distance==distance1){
    return("red")
  }
  else if(distance==distance2){
    return("green")
  }
  else if(distance==distance3){
    return("blue")
  }
}
#update the center of the points according to the coordinate points in each group
update_center<-function(cent){
  x=0
  for(i in cent){
    x=x+i
  }
  x=x/length(cent)
  return(x)
}

#the center points
red<-c(40,40)
green<-c(100,0)
blue<-c(0,100)
for(c in 1:1000){
  #to clean each vector after iterate one time
  cluster1_x<-c()
  cluster1_y<-c()
  cluster2_x<-c()
  cluster2_y<-c()
  cluster3_x<-c()
  cluster3_y<-c()
  #for
  for(i in 1:90){
    accord=cluster_points(x_axes[i],y_axes[i],red[1],green[1],blue[1],red[2],green[2],blue[2])
    if(accord=="red"){
      cluster1_x<-append(cluster1_x,x_axes[i])
      cluster1_y<-append(cluster1_y,y_axes[i])
    }
    else if(accord=="green"){
      cluster2_x<-append(cluster2_x,x_axes[i])
      cluster2_y<-append(cluster2_y,y_axes[i])
    }
    else if(accord=="blue"){
      cluster3_x<-append(cluster3_x,x_axes[i])
      cluster3_y<-append(cluster3_y,y_axes[i])
    }
  }
  red[1]=update_center(cluster1_x)
  red[2]=update_center(cluster1_y)
  green[1]=update_center(cluster2_x)
  green[2]=update_center(cluster2_y)
  blue[1]=update_center(cluster3_x)
  blue[2]=update_center(cluster3_y)
}

cluster1<-data.frame(cluster1_x,cluster1_y)
cluster2<-data.frame(cluster2_x,cluster2_y)
cluster3<-data.frame(cluster3_x,cluster3_y)
ggplot()+geom_point(data=cluster1,color="red",aes(cluster1_x,cluster1_y))+
  geom_point(data=cluster2,color="green",aes(cluster2_x,cluster2_y))+
  geom_point(data=cluster3,color="blue",aes(cluster3_x,cluster3_y))+
  labs(x="x",y="y")
