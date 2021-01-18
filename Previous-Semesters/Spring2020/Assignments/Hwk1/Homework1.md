# __Assignment 1__

<br>

Finance 5330: Financial Econometrics <br>
Tyler J. Brough <br>
Due Date: January 29, 2019 <br>
<br>

Consider the daily stock returns of American Express (AXP), Caterpillar (CAT), and Starbucks (SBUX) from January 1999 to December 2008. The data are daily prices in the file _stock-data-hwk1.txt_. 

* (a) Calculate simple returns for the three series.

* (b) Express the simple returns in percentages. Compute the sample mean, standard deviation, skewness, excess kurtosis, minimum, and maximum of the percentage simple returns. 

* (c) Transform the simple returns to log returns. 

* (d) Express the log returns in percentages. Compute the sample mean, standard deviation, skewness, excess kurtosis, minimum, and maximum of the percentage log returns. 

* (e) Test the null hypothesis that the mean of the log returns of each stock is zero. That is, perform three separate tests. Use 5% significance level to draw your conclusion. 

* (f) Plot histograms for each of the three series (both simple and log returns - so six graphs total).

* (g) Test the null hypothesis that the lag-$2$ autocorrelation is zero for log returns.

Here is some code to extract the price time series from the raw data in Python:


```python
import numpy as np
import pandas as pd
```


```python
rawData = pd.read_csv("stock-data-hwk1.csv")
```


```python
rawData.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>PERMNO</th>
      <th>date</th>
      <th>TICKER</th>
      <th>PRC</th>
      <th>vwretd</th>
      <th>ewretd</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>18542</td>
      <td>19990104</td>
      <td>CAT</td>
      <td>47.3750</td>
      <td>-0.000822</td>
      <td>0.011409</td>
    </tr>
    <tr>
      <th>1</th>
      <td>18542</td>
      <td>19990105</td>
      <td>CAT</td>
      <td>47.2500</td>
      <td>0.011879</td>
      <td>0.009512</td>
    </tr>
    <tr>
      <th>2</th>
      <td>18542</td>
      <td>19990106</td>
      <td>CAT</td>
      <td>48.5000</td>
      <td>0.021143</td>
      <td>0.014866</td>
    </tr>
    <tr>
      <th>3</th>
      <td>18542</td>
      <td>19990107</td>
      <td>CAT</td>
      <td>48.9375</td>
      <td>-0.000798</td>
      <td>0.003560</td>
    </tr>
    <tr>
      <th>4</th>
      <td>18542</td>
      <td>19990108</td>
      <td>CAT</td>
      <td>51.0000</td>
      <td>0.004602</td>
      <td>0.009410</td>
    </tr>
  </tbody>
</table>
</div>




```python
tickers = ['AXP', 'CAT', 'SBUX']

ind = rawData.TICKER == tickers[0]
axpData = rawData[ind]

ind = rawData.TICKER == tickers[1]
catData = rawData[ind]

ind = rawData.TICKER == tickers[2]
sbuxData = rawData[ind]
```


```python
axpData.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>PERMNO</th>
      <th>date</th>
      <th>TICKER</th>
      <th>PRC</th>
      <th>vwretd</th>
      <th>ewretd</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>2515</th>
      <td>59176</td>
      <td>19990104</td>
      <td>AXP</td>
      <td>101.5000</td>
      <td>-0.000822</td>
      <td>0.011409</td>
    </tr>
    <tr>
      <th>2516</th>
      <td>59176</td>
      <td>19990105</td>
      <td>AXP</td>
      <td>99.5625</td>
      <td>0.011879</td>
      <td>0.009512</td>
    </tr>
    <tr>
      <th>2517</th>
      <td>59176</td>
      <td>19990106</td>
      <td>AXP</td>
      <td>103.6250</td>
      <td>0.021143</td>
      <td>0.014866</td>
    </tr>
    <tr>
      <th>2518</th>
      <td>59176</td>
      <td>19990107</td>
      <td>AXP</td>
      <td>104.8750</td>
      <td>-0.000798</td>
      <td>0.003560</td>
    </tr>
    <tr>
      <th>2519</th>
      <td>59176</td>
      <td>19990108</td>
      <td>AXP</td>
      <td>108.0625</td>
      <td>0.004602</td>
      <td>0.009410</td>
    </tr>
  </tbody>
</table>
</div>




```python
axpData.tail()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>PERMNO</th>
      <th>date</th>
      <th>TICKER</th>
      <th>PRC</th>
      <th>vwretd</th>
      <th>ewretd</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>5025</th>
      <td>59176</td>
      <td>20081224</td>
      <td>AXP</td>
      <td>17.97</td>
      <td>0.004514</td>
      <td>0.005042</td>
    </tr>
    <tr>
      <th>5026</th>
      <td>59176</td>
      <td>20081226</td>
      <td>AXP</td>
      <td>17.91</td>
      <td>0.007191</td>
      <td>0.011107</td>
    </tr>
    <tr>
      <th>5027</th>
      <td>59176</td>
      <td>20081229</td>
      <td>AXP</td>
      <td>17.70</td>
      <td>-0.004365</td>
      <td>-0.015163</td>
    </tr>
    <tr>
      <th>5028</th>
      <td>59176</td>
      <td>20081230</td>
      <td>AXP</td>
      <td>18.00</td>
      <td>0.024764</td>
      <td>0.021418</td>
    </tr>
    <tr>
      <th>5029</th>
      <td>59176</td>
      <td>20081231</td>
      <td>AXP</td>
      <td>18.55</td>
      <td>0.017404</td>
      <td>0.034456</td>
    </tr>
  </tbody>
</table>
</div>




```python
catData.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>PERMNO</th>
      <th>date</th>
      <th>TICKER</th>
      <th>PRC</th>
      <th>vwretd</th>
      <th>ewretd</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>18542</td>
      <td>19990104</td>
      <td>CAT</td>
      <td>47.3750</td>
      <td>-0.000822</td>
      <td>0.011409</td>
    </tr>
    <tr>
      <th>1</th>
      <td>18542</td>
      <td>19990105</td>
      <td>CAT</td>
      <td>47.2500</td>
      <td>0.011879</td>
      <td>0.009512</td>
    </tr>
    <tr>
      <th>2</th>
      <td>18542</td>
      <td>19990106</td>
      <td>CAT</td>
      <td>48.5000</td>
      <td>0.021143</td>
      <td>0.014866</td>
    </tr>
    <tr>
      <th>3</th>
      <td>18542</td>
      <td>19990107</td>
      <td>CAT</td>
      <td>48.9375</td>
      <td>-0.000798</td>
      <td>0.003560</td>
    </tr>
    <tr>
      <th>4</th>
      <td>18542</td>
      <td>19990108</td>
      <td>CAT</td>
      <td>51.0000</td>
      <td>0.004602</td>
      <td>0.009410</td>
    </tr>
  </tbody>
</table>
</div>




```python
catData.tail()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>PERMNO</th>
      <th>date</th>
      <th>TICKER</th>
      <th>PRC</th>
      <th>vwretd</th>
      <th>ewretd</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>2510</th>
      <td>18542</td>
      <td>20081224</td>
      <td>CAT</td>
      <td>41.91</td>
      <td>0.004514</td>
      <td>0.005042</td>
    </tr>
    <tr>
      <th>2511</th>
      <td>18542</td>
      <td>20081226</td>
      <td>CAT</td>
      <td>42.72</td>
      <td>0.007191</td>
      <td>0.011107</td>
    </tr>
    <tr>
      <th>2512</th>
      <td>18542</td>
      <td>20081229</td>
      <td>CAT</td>
      <td>42.34</td>
      <td>-0.004365</td>
      <td>-0.015163</td>
    </tr>
    <tr>
      <th>2513</th>
      <td>18542</td>
      <td>20081230</td>
      <td>CAT</td>
      <td>43.66</td>
      <td>0.024764</td>
      <td>0.021418</td>
    </tr>
    <tr>
      <th>2514</th>
      <td>18542</td>
      <td>20081231</td>
      <td>CAT</td>
      <td>44.67</td>
      <td>0.017404</td>
      <td>0.034456</td>
    </tr>
  </tbody>
</table>
</div>




```python
sbuxData.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>PERMNO</th>
      <th>date</th>
      <th>TICKER</th>
      <th>PRC</th>
      <th>vwretd</th>
      <th>ewretd</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>5030</th>
      <td>77702</td>
      <td>19990104</td>
      <td>SBUX</td>
      <td>53.8750</td>
      <td>-0.000822</td>
      <td>0.011409</td>
    </tr>
    <tr>
      <th>5031</th>
      <td>77702</td>
      <td>19990105</td>
      <td>SBUX</td>
      <td>52.0000</td>
      <td>0.011879</td>
      <td>0.009512</td>
    </tr>
    <tr>
      <th>5032</th>
      <td>77702</td>
      <td>19990106</td>
      <td>SBUX</td>
      <td>51.5625</td>
      <td>0.021143</td>
      <td>0.014866</td>
    </tr>
    <tr>
      <th>5033</th>
      <td>77702</td>
      <td>19990107</td>
      <td>SBUX</td>
      <td>51.7500</td>
      <td>-0.000798</td>
      <td>0.003560</td>
    </tr>
    <tr>
      <th>5034</th>
      <td>77702</td>
      <td>19990108</td>
      <td>SBUX</td>
      <td>52.8750</td>
      <td>0.004602</td>
      <td>0.009410</td>
    </tr>
  </tbody>
</table>
</div>




```python
sbuxData.tail()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>PERMNO</th>
      <th>date</th>
      <th>TICKER</th>
      <th>PRC</th>
      <th>vwretd</th>
      <th>ewretd</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>7540</th>
      <td>77702</td>
      <td>20081224</td>
      <td>SBUX</td>
      <td>9.34</td>
      <td>0.004514</td>
      <td>0.005042</td>
    </tr>
    <tr>
      <th>7541</th>
      <td>77702</td>
      <td>20081226</td>
      <td>SBUX</td>
      <td>9.35</td>
      <td>0.007191</td>
      <td>0.011107</td>
    </tr>
    <tr>
      <th>7542</th>
      <td>77702</td>
      <td>20081229</td>
      <td>SBUX</td>
      <td>9.03</td>
      <td>-0.004365</td>
      <td>-0.015163</td>
    </tr>
    <tr>
      <th>7543</th>
      <td>77702</td>
      <td>20081230</td>
      <td>SBUX</td>
      <td>9.36</td>
      <td>0.024764</td>
      <td>0.021418</td>
    </tr>
    <tr>
      <th>7544</th>
      <td>77702</td>
      <td>20081231</td>
      <td>SBUX</td>
      <td>9.46</td>
      <td>0.017404</td>
      <td>0.034456</td>
    </tr>
  </tbody>
</table>
</div>



You can access the price time series as (for example for AXP):


```python
axpData.PRC
```




    2515    101.5000
    2516     99.5625
    2517    103.6250
    2518    104.8750
    2519    108.0625
    2520    106.2500
    2521    102.3750
    2522     98.6875
    2523     96.0000
    2524    104.3750
    2525    100.5000
    2526    102.0000
    2527    102.5000
    2528     98.5000
    2529    101.5000
    2530    101.7500
    2531     99.4375
    2532    100.4375
    2533    102.8750
    2534    100.7500
    2535     99.6875
    2536    100.5000
    2537    100.2500
    2538     98.1250
    2539     97.0625
    2540     95.9375
    2541     96.7500
    2542    101.0000
    2543     99.9375
    2544    102.1875
              ...   
    5000     19.3800
    5001     18.7400
    5002     17.2300
    5003     18.6900
    5004     21.1800
    5005     21.3700
    5006     22.3000
    5007     23.3100
    5008     19.6400
    5009     20.7600
    5010     21.8700
    5011     20.8400
    5012     21.7800
    5013     24.4400
    5014     23.2900
    5015     21.5600
    5016     20.1300
    5017     20.3400
    5018     19.3400
    5019     20.0600
    5020     19.8100
    5021     18.9000
    5022     19.4300
    5023     18.4200
    5024     17.9600
    5025     17.9700
    5026     17.9100
    5027     17.7000
    5028     18.0000
    5029     18.5500
    Name: PRC, Length: 2515, dtype: float64




```python

```
