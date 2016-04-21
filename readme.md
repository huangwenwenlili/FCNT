##Note: This branch is modified from the original [FCNT](https://github.com/scott89/FCNT) code before it was published on GitHub. If you intend to repeat the results from the [ICCV 2015 paper](http://202.118.75.4/lu/Paper/ICCV2015/iccv15_lijun.pdf), please visit the original repository.


###Originally written by Lijun Wang. Modified by Kai Kang (myfavouritekk@gmail.com).

#Installation
1. Clone the repository, and let `$FCNT_ROOT` represents the root directory.
    
    ```bash
        $ git clone --recursive -b T-CNN https://github.com/myfavouritekk/FCNT fcn_tracker_matlab
    ```

2. Compile the corresponding `caffe-fcn_tracking`.

    ```bash
        $ cd $FCNT_ROOT/caffe-fcn_tracking
        $ # modify Makefile.config and compile with matcaffe
        $ make all && make matcaffe
        $ # copy compiled +caffe folder in to root folder
        $ cp -r matlab/+caffe $FCNT_ROOT
    ```

3. Compile the `mexResize` code in `DSST_code`. Copy the compiled mex function to `$FCNT_ROOT`.

    ```matlab
        >> cd 'DSST_code'
        >> compilemex
    ```

4. Compile and copy [`gradientMex`](https://github.com/pdollar/toolbox/blob/master/channels/private/gradientMex.cpp) fucntion from Piotr Dollar's [toolbox](https://github.com/pdollar/toolbox) into `$FCNT_ROOT`. Some pre-compiled functions for Linux, OSX and Windows are included.

3. Download `ImageNet` pre-trained `VGG` models from [here](https://gist.github.com/ksimonyan/211839e770f7b538e2d8) and put it in `$FCNT_ROOT`.

    ```bash
        $ cd $FCNT_ROOT
        $ wget http://www.robots.ox.ac.uk/%7Evgg/software/very_deep/caffe/VGG_ILSVRC_16_layers.caffemodel -O VGG_ILSVRC_16_layers.caffemodel
    ```

4. Run the demo code in `Matlab`.

    ```matlab
        >> demo
    ```