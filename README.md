# Goal

RadialIntensityProfile is a FIJI and ImageJ macro to analyse the radial distribution of a fluorescent signal of interest in relation to a cell's nucleus. It can be used to quantify the perinuclear localisation of a protein of Interest.

# Usage
The Macro can be downloaded here or conveniently added to your FIJI installation via our RadialIntensityProfile update site (more information on how to follow an update site can be found here: https://imagej.net/Following_an_update_site).

The macro takes RGB images of a cell with a Nuclear staining (crop the image to contain only one cell) in the blue channel (DAPI or similar) and a signal of interest in the red channel. It will find the center of the nucleus by thresholding the blue channel followed by measureing the signal intensity of annular bands of increasing radii around the center of mass of the nucleus. These results can then be analysed to quantify the signal distribution in respect to the center of the nucleus.



# Citation

Please note that this macro is based on a publication. If you use it successfully for your research please be so kind to cite our work:

Filipek, P. A., de Araujo, M. E. G., Vogel, G. F., De Smet, C. H., Eberharter, D., Rebsamen, M., … Huber, L. A. (2017). *LAMTOR/Ragulator is a negative regulator of Arl8b- and BORC-dependent late endosomal positioning*. The Journal of Cell Biology, jcb.201703061. [doi.org/10.1083/jcb.201703061](http://doi.org/10.1083/jcb.201703061)
