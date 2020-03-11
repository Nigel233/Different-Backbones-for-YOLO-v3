cd ~
mkdir voc
cd voc
curl -L http://pjreddie.com/media/files/VOCtrainval_11-May-2012.tar -o VOC12trainval.tar 
curl -L http://pjreddie.com/media/files/VOC2012test.tar -o VOC12test.tar
tar xvf VOC12trainval.tar 
tar xvf VOC12test.tar 

