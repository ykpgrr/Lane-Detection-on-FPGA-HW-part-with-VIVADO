# Lane-Detection-SDSoC-FPGA
Realization of Advance Lane Detection Algorithm on Xilinx ZYNQ-7000 using Vivado platform. <br />

This project realized in verilog using with OpenCV and xfOpenCV Libraries. <br />
It is a sub-task of "REALIZATION OF LANE DETECTION ALGORITHMS ON FPGA USING SDSOC AND VIVADO" graduate project at Istanbul Technical University, June 2018. <br />

Project members: <br />
Yakup GÖRÜR (gorury@itu.edu.tr) - Software and SDSoC  Platform <br />
Mehmet Akif AKKAYA (akifakkaya1@gmail.com) - VIVADO Platform <br />
Sıddıka Berna ÖRS YALÇIN (Advisor) <br />

### LANE-DETECTION-ALGORITHMS-ON-FPGA (https://github.com/ykpgrr/LANE-DETECTION-ALGORITHMS-ON-FPGA.git) -Full Project -
1-) Lane Detection (https://github.com/ykpgrr/Lane-Detection.git)<br />
2-) Lane Detection SDSoC FPGA (https://github.com/ykpgrr/Lane-Detection-SDSoC-FPGA.git) <br />
__3-) Lane-Detection VIVADO FPGA (This Repository)  <br />__

## TODO
- Update Readme <br />
-- x Add Summary of REALIZATION OF LANE DETECTION ALGORITHMS ON FPGA USING SDSOC AND VIVADO <br />
-- Add SDSoC software/hardware diagram on Readme <br />
-- Add Results <br />




# REALIZATION OF LANE DETECTION ALGORITHMS ON FPGA USING SDSOC AND VIVADO
## SUMMARY

The usage rate of image processing algorithms has gained a great impetus with the "OpenCV" library, which is implemented as open source. The lane detection algorithms, which are an advanced driver assistance system, are also one of the algorithms that using image processing techniques. Unfortunately, the image processing algorithms are slow on processors because of the processing intensity of image processing techniques. High-priced hardwares such as "Graphics Processing Unit" (GPU) are used to accelerate this slow operation. But the usage of GPU in projects increases the project costs, so the end user is offered as a product at high price. This situation reduces the usability of image processing techniques and applications in daily life. <br />

In this project, the Zedboard FPGA development card of the ZYNQ-7000 series of Xilinx Company is used as “System on Chip” (SoC) to solve this problem. A lane detection algorithm has been developed as an image processing project, and it has been implemented in the FPGA after this developed algorithm was broken down as software and hardware. <br />

The lane detection algorithm is written in “C++” with “OpenCV” library. The algorithm is based on expressing the lines in a lane as second order polynomial equations. It has 3 main parts. The first part is “Preprocessing” function which extracts features from the image. The second part is “Detect Line” function which detects lines in a lane from the extracted features. The final part is “Draw Lane” function which is basically drawing gap between the lines. The gap represents the lane. <br />

According to the time analysis of the lane detection algorithm, the preprocessing part was implemented in hardware. SDSoC and Vivado platforms were used to make implementation of the developed lane detection algorithm on FPGA. Low level code (Verilog) is used in Vivado platform while high level code (C++) is used in SDSoC platform. In SDSoC platform, the "xfOpenCV" library was also used. The “xfOpenCV” library is a set of 50+ kernels, optimized for Xilinx FPGAs and SoCs, based on the OpenCV computer vision library. The kernels in the xfOpenCV library are optimized and supported in the Xilinx SDSoC Tool Suit.<br />
