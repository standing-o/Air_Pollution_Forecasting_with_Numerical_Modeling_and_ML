# Air pollution forecasting with Numerical modeling and ML (20200902 ~ 20201008)
- This project is designed to predict the levels of air pollution in South Korea by using numerical modeling and machine learning techniques.
- Convection-diffusion model, LSTM

### Scientific computing lab project for academic conference
- This repo is maintained by 오서영, [신영민](https://github.com/young3984)

[[Summary]](https://github.com/OH-Seoyoung/Air_pollution_forecasting_with_Numerical_modeling_and_ML/blob/master/summary.pdf)  
[[Presentation]](https://github.com/OH-Seoyoung/Air_pollution_forecasting_with_Numerical_modeling_and_ML/blob/master/presentation.pdf)  

## Process
#### **1**. Refining location (latitude/longitude), wind (directional/speed) and air pollution dataset | [[Code]](https://github.com/OH-Seoyoung/Forecasting_on_air_pollution_with_Numerical_analysis_and_ML/blob/master/1_Make_location%2Cwind%2C%2Cair_pollution_dataset/Make_location_and_wind_directional%2Cspeed_dataset.ipynb)  
#### **2**. Visualization with MATLAB, Simple implementaion of numerical modeling with refined dataset | [[Code]](https://github.com/OH-Seoyoung/Forecasting_on_air_pollution_with_Numerical_analysis_and_ML/tree/master/2_Visualization_and_Simple_numerical_modeling)  

<div align="center">
<img src="https://github.com/OH-Seoyoung/Forecasting_on_air_pollution_with_Numerical_analysis_and_ML/blob/master/figure/fig2.jpg?raw=True" width="40%">
<img src="https://github.com/OH-Seoyoung/Forecasting_on_air_pollution_with_Numerical_analysis_and_ML/blob/master/figure/fig4.jpg?raw=True" width="35%"> <br>
</div>  

It is realistically impossible to obtain wind and air pollution data at all points due to problems such as cost and time.  
So we come up with a way to get empty space data through **interpolation**.

#### **3**. Cubic Interpolation and Inverse Distance Weighted (IDW) | [[Code]](https://github.com/OH-Seoyoung/Air_pollution_forecasting_with_Numerical_modeling_and_ML/tree/master/3_Vector_interpolation_with_wind_and_air_pollution_dataset)  
<div align="center">
<img src="https://github.com/OH-Seoyoung/Forecasting_on_air_pollution_with_Numerical_analysis_and_ML/blob/master/figure/fig6.jpg?raw=True" width="45%">
<img src="https://github.com/OH-Seoyoung/Forecasting_on_air_pollution_with_Numerical_analysis_and_ML/blob/master/figure/fig5.jpg?raw=True" width="40%"> <br>
</div>  
  
We apply **cubic** interpolation to wind vector dataset by using scipy. It returns the value determined from a peicewise cubic, continuously differentiable and approximately curvature-minimizing polynomial surface.  
Also, We use **IDW** to air pollution dataset. IDW is an interpolation method that computes the score of query points based on the scores of their k-nearest neighbours, weighted by the inverse of their distances.  

#### **4**. Convection-diffusion equation with interpolated dataset | [[Code]](https://github.com/OH-Seoyoung/Air_pollution_forecasting_with_Numerical_modeling_and_ML/blob/master/4_Convection-diffusion_equation/convection_diffusion_eqs.m)  
Central difference method, Neumann boundary condition  
  
Convection-diffusion equation and discretized one  
<div align="center">
<img src="https://github.com/OH-Seoyoung/Forecasting_on_air_pollution_with_Numerical_analysis_and_ML/blob/master/figure/cde1.jpg?raw=True" width="50%">
<img src="https://github.com/OH-Seoyoung/Forecasting_on_air_pollution_with_Numerical_analysis_and_ML/blob/master/figure/cde2.jpg?raw=True" width="45%">
</div>
  
#### **5**. Long Short Term Memory (LSTM) | [[Code]](https://github.com/OH-Seoyoung/Air_pollution_forecasting_with_Numerical_modeling_and_ML/blob/master/5_Long_short_term_memory_(LSTM)/Forecasting_air_pollution_with_RNNs.ipynb)  
Simple RNN, Simple LSTM, Stacked LSTM  

## Results - Visualization
> 1. Mathematical Modeling - Convection-diffusion equation  
<div align="center">
<img src="https://github.com/OH-Seoyoung/Forecasting_on_air_pollution_with_Numerical_analysis_and_ML/blob/master/figure/mesh.gif?raw=True" width="40%">
<img src="https://github.com/OH-Seoyoung/Forecasting_on_air_pollution_with_Numerical_analysis_and_ML/blob/master/figure/contour.gif?raw=True" width="40%"> <br>
</div>  
  
  
> 2. Machine Learning - LSTM
<div align="center">
<img src="https://github.com/OH-Seoyoung/Forecasting_on_air_pollution_with_Numerical_analysis_and_ML/blob/master/figure/Real1.jpg?raw=True" width="40%">
<img src="https://github.com/OH-Seoyoung/Forecasting_on_air_pollution_with_Numerical_analysis_and_ML/blob/master/figure/LSTM1.jpg?raw=True" width="40%"> <br>  
</div>
<div align="center">
<img src="https://github.com/OH-Seoyoung/Forecasting_on_air_pollution_with_Numerical_analysis_and_ML/blob/master/figure/Real2.jpg?raw=True" width="40%">
<img src="https://github.com/OH-Seoyoung/Forecasting_on_air_pollution_with_Numerical_analysis_and_ML/blob/master/figure/LSTM2.jpg?raw=True" width="40%"> <br>
</div>  
  
## Dataset  
```
[1] 기상자료개방포털, https://data.kma.go.kr/cmmn/main.do  
[2] 에어코리아, https://www.airkorea.or.kr/index
```
