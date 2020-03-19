# Different Backbones for YOLO-v3
Yolo v3 tiny &amp; improvements. We developed this project based on https://github.com/ultralytics/yolov3, with significant modifications to use VOC dataset and to change the backbone network to ResNet and MobileNet.

## Get dataset
### COCO
- Go to https://drive.google.com/drive/folders/1ZYwN1OfMjTK4_Bn5LGEbrGP5EDg-jekz?usp=sharing and download `coco_small.zip`.
- Unzip the file with name `coco_small`, and put the directory **outside** of this project directory

The dataset is a subset of `coco_2017`, and contains 8000 training images, 1000 validation and 1000 test images, randomly from the whole COCO dataset with bounding box labels. The procedure of generating these images is in `get_data.ipynb`, but mostly likely you wouldn't not need to run this notebook again.

### VOC
- GO to https://drive.google.com/file/d/12D1oHUVl2tHLFx45QPNVAIKyG4MUoQWJ/view?usp=sharing  and download all the files. 
- Unzip all the files and put images and labels under CSE253Final/data/VOC and three txt files under CSE253Final/data


The dataset is VOC 2012, i use the training set of VOC and split the validation set of VOC to our validation and test set, because of no annotations of VOC test set. 

## Train YOLO-v3 with `coco_small` dataset

```
python train.py --data data/coco2017_small.data --batch-size 128 --accumulate 1 --img-size 416 --epochs 1 --cfg "cfg/yolov3-tiny.cfg" --weights ''
```

- With some (very limited) experiments, batch size greater than 256 would lead to gradients being NaN. This issue could be investigated with closer scrunity
- The running results would be saved in the `runs` directory and the resultant weights would be stored in `weights` directory

## Test Yolo-v3 on the best model from training

To get evaluation metrics, run

```
python test.py --data data/coco2017_small.data --save-json --img-size 416 --cfg "cfg/yolov3-tiny.cfg" --weights 'weights/best.pt'
```

Where `--cfg` defines the network structure, and `--weights` specifies which set of weights to use for evaluation.

## Get bounding box example

```
python detect.py --cfg "cfg/yolov3-tiny.cfg" --weights 'weights/best.pt'
```

Which will generate bounding box for images in `data/samples` and put the results in `outputs` directory.

## Plot loss curves

Training would generate a `results.txt` with metrics. The methods `plot_results` looks at all local file with `results*.txt` and generate plots based on the contents. To get plots, run

```
python -c "from utils import utils; utils.plot_results()"
```
## Resnet as backbonenet
`--cfg "cfg/resnet.cfg"` will replace Darknet with Resnet18 as backbonenet.
