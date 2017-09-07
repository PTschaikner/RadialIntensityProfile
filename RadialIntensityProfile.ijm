getPixelSize(unit, pixelw, pixelh) 			// gets the pixel dimensions
run("Set Measurements...", "area mean min center integrated display redirect=None decimal=4"); 
imageTitle=getTitle();
red=imageTitle +" (red)";					
blue=imageTitle +" (blue)";					// sets the names for the channels

run("Split Channels");
selectWindow(red);
run("Subtract Background...", "rolling=50"); // performs rolling ball background substraction 

selectWindow(blue);							
setAutoThreshold("Li dark");
setOption("BlackBackground", false);
run("Convert to Mask");
run("Analyze Particles...", "size=0.20-Infinity show=Nothing display"); 
for(i=0; i<nResults; i++) {
        rowId = getResultLabel(i);
        if(rowId==blue) {
        CenterofMassDapiX=getResult("XM", i);
		CenterofMassDapiY=getResult("YM", i);
        }
} 											//DAPI Channel Thresholding to obtain center of mass of the nucleus
 		



  
x = CenterofMassDapiX/pixelw; 				
y = CenterofMassDapiY/pixelw;				// X and Y position of the Center of Mass of the Nucleus
radius= 20;  								// radius of the first circle (pixel)
width = 20; 								// increase of the radius for each iteration

selectWindow(red);							// switch to red channel

makeOval(x-radius, y-radius, radius*2, radius*2);
run("Measure");								// measures the first circle

for (i = 1; i < 25; i++) {  				
	radiusb = (radius + (width*i));
	makeOval(x-radiusb, y-radiusb, radiusb*2, radiusb*2);
  	radiusb -= width;
  	setKeyDown("alt");
  	makeOval(x-radiusb, y-radiusb, radiusb*2, radiusb*2);
  	setKeyDown("none");
  	run("Measure");
}											// draws concentric bands around the DAPI center and measures them

radiusc = radiusb+(width*2)
makeOval(x-radiusc, y-radiusc, radiusc*2, radiusc*2);	
run("Measure");								// last circle to get total intensity values

