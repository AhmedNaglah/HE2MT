HE2MT: Generative AI - GANs based digital trichrome stained histology 
----------------------------------------------------------------------------------------------------------------------
Conditional GANs based system for fibrosis detection and quantification in Hematoxylin and Eosin whole slide images. 
*Medical Image Analysis*

<img src="static/logo.png" width="400px" align="right" />


Manuscript: https://www.sciencedirect.com/science/article/pii/S1361841522001840

Interactive Demo: Coming Back Soon

Cite: Naglah, A., Khalifa, F., El-Baz, A. and Gondim, D., 2022. Conditional GANs based system for fibrosis detection and quantification in Hematoxylin and Eosin whole slide images. Medical Image Analysis, 81, p.102537.


## Abstract

Assessing the degree of liver fibrosis is fundamental for the management of patients with chronic liver disease, in 
liver transplants procedures, and in general liver disease research. The fibrosis stage is best assessed by histo
pathologic evaluation, and Masson’s Trichrome stain (MT) is the stain of choice for this task in many laboratories 
around the world. However, the most used stain in histopathology is Hematoxylin Eosin (HE) which is cheaper, 
has a faster turn-around time and is the primary stain routinely used for evaluation of liver specimens. In this 
paper, we propose a novel digital pathology system that accurately detects and quantifies the footprint of fibrous 
tissue in HE whole slide images (WSI). The proposed system produces virtual MT images from HE using a deep 
learning model that learns deep texture patterns associated with collagen fibers. The training pipeline is based on 
conditional generative adversarial networks (cGAN), which can achieve accurate pixel-level transformation. Our 
comprehensive training pipeline features an automatic WSI registration algorithm, which qualifies the HE/MT 
training slides for the cGAN model. Using liver specimens collected during liver transplantation procedures, we 
conducted a range of experiments to evaluate the detected footprint of selected anatomical features. Our eval
uation includes both image similarity and semantic segmentation metrics. The proposed system achieved 
enhanced results in the experiments with significant improvement over the state-of-the-art CycleGAN learning 
style, and over direct prediction of fibrosis in HE without having the virtual MT step.  

## Dependencies

Linux

Python 3.7

See requirements.txt for python packages

## Usage

This repository containes the codebase for model training, based on TensorFlow implementations of Conditional GANs and Cycle GANs using a range of image sizes (inputs/outputs) to be used for an ensemble learning pipeline similar to what is described in the manuscript.

Step 1: Prepare the data folder (./path/to/data/folder/) as per the following structure

For ConditionalGAN (Paired images for training), each image is horizontally concatenated input/output (side by side)

```bash
ROOT/
    ├──DATASET/
        ├── train
                ├── patch_001.jpg
                ├── patch_002.jpg
                └── ...
        └── val
                ├── patch_001.jpg
                ├── patch_002.jpg
                └── ...
        └── test
                ├── patch_001.jpg
                ├── patch_002.jpg
                └── ...
        └── monitor
                ├── patch_001.jpg
                ├── patch_002.jpg
                └── ...
```

For CycleGAN (UnPaired images for training), unpaired images are stored in trainA and trainB folder

```bash
ROOT/
    ├──DATASET/
        ├── trainA
                ├── patch_001.png
                ├── patch_002.png
                └── ...
        ├── trainB
                ├── patch_001.png
                ├── patch_002.png
                └── ...
        └── val
                ├── patch_001.jpg
                ├── patch_002.jpg
                └── ...
        └── test
                ├── patch_001.jpg
                ├── patch_002.jpg
                └── ...
        └── monitor
                ├── patch_001.jpg
                ├── patch_002.jpg
                └── ...
```

Step 2: Run the following command and adjust the hyper-parameters according to your dataset

``` shell
python3 ./runHE2MT.py \
    --model condGAN1024 \
    --epochs 6 \
    --lamda 130 \
    --monitor_freq 1epoch  \
    --dataroot ./path/to/data/folder/ \
    --experiment_id exp1 \
    --modelsave_freq 1 \
    --checkpoint_freq 1 
```

## SLURM Shell Script

Please see runSlurm.sh to run using SLURM and ANACONDA Env on Compute Cluster

## Contact

Please contact me for any additional questions: ahmed.naglah@gmail.com


## References

Naglah, A., Khalifa, F., El-Baz, A. and Gondim, D., 2022. Conditional GANs based system for fibrosis detection and quantification in Hematoxylin and Eosin whole slide images. Medical Image Analysis, 81, p.102537.

```
@article{naglah2022conditional,
  title={Conditional GANs based system for fibrosis detection and quantification in Hematoxylin and Eosin whole slide images},
  author={Naglah, Ahmed and Khalifa, Fahmi and El-Baz, Ayman and Gondim, Dibson},
  journal={Medical Image Analysis},
  volume={81},
  pages={102537},
  year={2022},
  publisher={Elsevier}
}
```
