# Workbooks for Curvatures of Stiefel manifolds
* This directory contains the workbooks explaining some results in the paper *Curvatures of Stiefel manifolds with deformation metrics*

* The workbooks can be opened in colab. Click on "Open in colab". It will open in your own colab session in your browser (best used with Google Chrome, and you need a Google account). See the [FAQ](https://research.google.com/colaboratory/faq.html) for colab and [basic features](https://colab.research.google.com/notebooks/basic_features_overview.ipynb). You can run the codes yourself or can just read the notebooks without running. In that case you do not need colab.

* [StiefelCurvature.ipynb](https://github.com/dnguyend/MiscCollection/blob/main/colab/StiefelCurvature.ipynb) contains the calculations for the sectional curvature range.

* [DerivingTheMetricInProposition54.ipynb](https://github.com/dnguyend/MiscCollection/blob/main/colab/DerivingTheMetricInProposition54.ipynb) Workbook containing the symbolic code in Proposition 5.4, in SymPy. We prove a little more in the workbook, showing $F(x)$ has one only one positive root, $t_1 \geq t_2 \geq 1$ and the parameters are distinct when $d\geq 2$.

* [EinsteinRicciSON.ipynb](https://github.com/dnguyend/MiscCollection/blob/main/colab/EinsteinRicciSON.ipynb) contains the codes implementing the Ricci curvature formula for the diagonal metrics. It contains two of new Einstein metrics for $SO(9)$ and explanations of the output file [ricci_coeff_so20.csv](https://github.com/dnguyend/MiscCollection/blob/main/colab/ricci_coeff_so20.csv) for the group $SO(20)$, which we obtain by more extensive runs off-line, with classification.

* [EinsteinRicciStiefel.ipynb](https://github.com/dnguyend/MiscCollection/blob/main/colab/EinsteinRicciStiefel.ipynb) contains the implementation the Ricci curvature formula for the diagonal metrics on the Stiefel manifold. We show a new Einstein metric for $St_{5,7}$.

*  The csv file [ricci_coeff_so20.csv](https://github.com/dnguyend/MiscCollection/blob/main/colab/ricci_coeff_so20.csv) could be opened in Excel or Google sheet and viewed. It could be used as input for any scripts. Github cannot display it but you can download, or view raw. It contains a large number of metrics classified to partition and additional relations. It is not exhaustive and may contain duplications, but it has a large number of examples which we hope will be useful for researchers.


