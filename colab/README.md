# Workbooks for Curvatures of Stiefel manifolds
* This directory contains the workbooks explaining some results in the paper *Curvatures of Stiefel manifolds with deformation metrics*

* The csv file could be opened in Excel or Google sheet and viewed. It could be used as input for any scripts.

* The workbooks can be opened in colab. Click on "Open in colab". It will open in your own colab session in your browser (best used with Google Chrome, and you need a Google account). See the [FAQ](https://research.google.com/colaboratory/faq.html) for colab and [basic features](https://colab.research.google.com/notebooks/basic_features_overview.ipynb). You can run the codes yourself or can just read the notebooks without running.

* [StiefelCurvature.ipynb](https://github.com/dnguyend/MiscCollection/blob/main/colab/StiefelCurvature.ipynb) contains the calculations for the sectional curvature range.
* [EinsteinRicciSON.ipynb](https://github.com/dnguyend/MiscCollection/blob/main/colab/EinsteinRicciSON.ipynb) contains the codes implementing the Ricci curvature formula for the diagonal metrics and the cost function to solve the Einstein equations. It contains two of new Einstein metrics for $SO(9)$
It also explains the output file [ricci_coeff_so20.csv](https://github.com/dnguyend/MiscCollection/blob/main/colab/ricci_coeff_so20.csv) for the group $SO(20)$, which we obtain by more extensive runs off-line. 
* [EinsteinRicciStiefel.ipynb](https://github.com/dnguyend/MiscCollection/blob/main/colab/EinsteinRicciStiefel.ipynb) contains the implementation the Ricci curvature formula for the diagonal metrics on the Stiefel manifold, and also the optimization code to solve the Einstein equations, in a similar format to [EinsteinRicciSON.ipynb](https://github.com/dnguyend/MiscCollection/blob/main/colab/EinsteinRicciSON.ipynb). We also found a new Einstein metric for $St_{5,7}$.


