# __Brough Lecture Notes: Beginning Time Series Topics III__

<br>

Finance 5330: Financial Econometrics <br>
Tyler J. Brough <br>
Last Updated: January 31, 2019 <br>
<br>

___Unit Roots___

<br>

This basic random walk is 

$$
x_{t} = x_{t-1} + \varepsilon_{t}
$$

<br>

with

$$
E_{t-1}(\varepsilon_{t}) = 0
$$

<br>
<br>

Note the property: $E_{t}(x_{t+1}) = x_{t}$

<br>

Because of this property random walks are a popular model for asset prices. 

<br>

Notice: the random walk is a special case of the AR(1) model in which $\phi = 1$

$$
x_{t} = \phi x_{t-1} + \varepsilon_{t}
$$

<br>

__Ex:__ $x_{0}$, the initial value of the series is a real number denoting the starting value of the process. If $x_{t}$ is the log-price of a stock then $x_{0}$ would be the log-price of the stock at its initial public offering (IPO).

<br>

If $\varepsilon_{t}$ has a symmetric distribution (normal, t, etc) around zero, then conditional on $x_{t-1}$, $x_{t}$ has a 50-50 chance to go up or down, implying that $x_{t}$ would go up or down at random.

<br>
<br>

__NB:__ this fits well the economics of the Efficient Markets Hypothesis (EMH). Early tests of the EMH were essentially tests for a random walk.

<br>

Within the AR(1) framework $\phi = 1$, which does not satisfy the weak-stationarity assumption. A Random walk is not weakly stationary, and we call it a unit-root nonstationary time series. 

<br>
<br>

Under the random walk model of (log) stock prices the price is not predictable or mean-reverting.

<br>

We will take a small detour regarding forecasting to show this. 

<br>

__Forecasting__

<br>

Forecasting is an important application of time series analysis. 

<br>

For the AR(p) model:

<br>

Suppose we are at the time index $h$ and interested i n forecasting $x_{h+l}$, where $l \ge 1$. The time index $h$ is called the forecast origin and the positive integer $l$ is called the forecast horizon.

<br>

Let $\hat{x}_{h}(l)$ be the forecast of $x_{h+l}$ using  the minimum squared error loss function and $F_{n}$ be the collection of information available at the forecast origin $h$. Then the forecast $\hat{x}_{h}(l)$ is chosen such that

<br>

$$
E\{[x_{h+l} - \hat{x}_{h}(l)]^{2} | F_{h} \} \le \min_{g} E[(x_{h+l} - g)^{2} | F_{h}]
$$

<br>

where $g$ is a function of the information available at time $h$ (inclusive), that is a function of $F_{h}$.

<br>

We refer to $\hat{x}_{h}(l)$ as the $l$-step ahead forecast of $x_{t}$ at the forecast origin $h$.

<br>
<br>

__$1$-Step Ahead Forecast__

<br>

$$
x_{h+1} = \phi_{0} + \phi_{1} x_{h} + \ldots + \phi_{p} x_{h+1-p} + \varepsilon_{h+1}
$$

<br>

Under the minimum squared error loss function, the point forecast of $x_{h+1}$ given $F_{h} = \{x_{h}, x_{h-1}, \cdots \}$ is

<br>

the conditional expectation

$$
\hat{x}_{h}(1) = E\left(x_{h+1} | x_{h} \right) = \phi_{0} + \sum\limits_{i=1}^{p} \phi_{i} x_{h+1-i}
$$

<br>

and the associated forecast error is

$$
e_{h}(1) = x_{h+1} - \hat{x}_{h}(1) = \varepsilon_{h+1}
$$

<br>

The variance of the $1$-step ahead forecast error is

$$
Var[e_{h}(1)] = Var(\varepsilon_{h+1}) = \sigma_{\varepsilon}^{2}
$$

<br>

<br>

If $\varepsilon_{t}$ is normally distributed, then a $95\%$ $1$-step ahead interval forecast of $x_{h+1}$ is $\hat{x}_{h}(1) \pm 1.96 \sigma_{\varepsilon}$

<br>

In econometrics $\varepsilon_{t+1}$ is often referred to as the shock to the series at time $t+1$

<br>

__$2$-Step Ahead__

<br>

Next consider $x_{h+2}$ at the forecast origin $h$. From the AR(p) model we have 

$$
x_{h+2} = \phi_{0} + \phi_{1} x_{h+1} + \cdots + \phi_{p} x_{h+2-p} + \varepsilon_{h+2}
$$

<br>

Taking conditional expectation, we get

<br>

$$
\hat{x}_{h}(2) = E\left(x_{h+2} | F_{h} \right) = \phi_{0} + \phi_{1} \hat{x}_{h}(l) + \phi_{2} x_{h} + \cdots + \phi_{p} x_{h+2-p}
$$

<br>

and forecast error

$$
e_{h}(2) = x_{h+2} - \hat{x}_{h}(2) - \phi_{1}[x_{h+1} - \hat{x}_{h}(1)] + \varepsilon_{h+2} = \varepsilon_{h+2} + \phi_{1} \varepsilon_{h+1}
$$

<br>

The variance of the forecast error is

$$
\begin{aligned}
Var[e_{h}(2)] &= Var(\varepsilon_{h+2} + \phi \varepsilon_{h+1}) \\
              &= (1 + \phi_{1}^{2}) \sigma_{\varepsilon}^{2}
\end{aligned}
$$

<br> 

__NB:__ $Var[e_{h}(2)] \ge Var[e_{h}(1)]$

<br>

Common sense tells us we are more uncertain about $x_{h+2}$ than about $x_{h+1}$ at time index $h$.

<br>
<br>

__Multi-Step Ahead__

<br>

In general

<br>

$$
x_{h+l} = \phi_{0} + \phi_{1} x_{h+l-1} + \cdots + \phi_{p} x_{h+l-p} + \varepsilon_{h+l}
$$

<br>

and

$$
\hat{x}_{h}(l) = \phi_{0} + \sum\limits_{i=1}^{p} \phi_{i} \hat{x}_{h}(l - i)
$$

<br>


The $l$-step ahead forecast error is

$$
e_{h}(l) = x_{h+l} - \hat{x}_{h}(l)
$$

<br>

It can be shown that for a stationary AR(p) model, $\hat{x}_{h}(l)$ converges to $E(x_{t})$ as $l \rightarrow \infty$, meaning that for such a series the long-term point forecast approaches the unconditional mean.

<br>

__Forecasting with MA Models__

<br>

__$1$-Step Ahead (for MA(1))__

<br>

$$
x_{h+1} = \mu + \varepsilon_{h+1} - \theta_{1} \varepsilon_{h}
$$

<br>

Taking the conditional expectation we have

$$
\hat{x}_{h}(l = 1) = E\left( x_{h+1} | F_{h}\right) = \mu - \theta_{1} \varepsilon_{h}
$$

$$
e_{h}(1) = x_{h+1} - \hat{x}_{h}(1) = \varepsilon_{h+1}
$$

$$
Var[e_{h}(1)] = \sigma_{\varepsilon}^{2}
$$

<br>

__$2$-Step Ahead__

<br>

$$
x_{h+2} = \mu + \varepsilon_{h+2} - \phi \varepsilon_{h+1}
$$

<br>

We have

$$
\hat{x}_{h}(l = 2) = E\left( x_{h+2} | F_{h}\right) = \mu 
$$

$$
e_{h}(2) = x_{h+2} - \hat{x}_{h}(2) = \varepsilon_{h+2} - \theta \varepsilon_{h+1}
$$

$$
Var[e_{h}(2)] = (1 + \theta_{1}^{2}) \sigma_{\varepsilon}^{2}
$$

<br>

__NB:__ $\varepsilon_{h+1} = x_{h+1} - \mu + \theta_{1} \varepsilon_{h}$

<br>

__NB:__ $E(x_{h+1}) = \mu - \theta_{1} \varepsilon_{t} - \mu + \theta_{1} \varepsilon_{h} = 0$

Note: The $2$-step ahead forecast is simply the unconditional mean of the model. This is true for any forecast origin $h$.

<br>

More generally, $\hat{x}_{h}(l) = \mu$ for $l \ge 2$. Thus for any MA(1) mean reversion take only $1$ time period.

<br>

Similarly for an MA(2) we have

$$
x_{h+l} = \mu + \varepsilon_{h+l} - \theta_{1} \varepsilon_{h+l-1} - \theta_{2} \varepsilon_{h+l-2}
$$

<br>

And we obtain

<br>

$$
\hat{x}_{h}(1) = \mu - \theta_{1} \varepsilon_{h} - \theta_{2} \varepsilon_{h+l-2}
$$

$$
\hat{x}_{h}(2) = \mu - \theta_{2} \varepsilon_{h}
$$

$$
\hat{x}_{h}(l) = \mu \quad \mbox{for} \quad l \ge 2
$$

<br>

Now back to the random walk model:

$$
x_{t} = x_{t-1} + \varepsilon_{t}
$$

<br>


__$1$-Step Ahead Forecast__

<br>

$$
\hat{x}_{h}(1) = E\left[x_{h+1} | x_{h}, x_{h-1}, \ldots \right] = x_{h}
$$

<br>

which is the log stock price at the forecast origin, or in other words the best guess for tomorrow's closing stock price is today's closing stock price. Or the current stock price contains all relevant information regarding the firm. 

<br>

__NB:__ $F_{h} = \{x_{h}\}$

<br>

__$2$-Step Forecast__

<br>

$$
\begin{aligned}
\hat{x}_{h}(2) &= E\left[x_{h+2} | x_{h}, x_{h-1}, \ldots \right] = E\left[x_{h+1} + \varepsilon_{h+2} | x_{h}, x_{h-1}, \ldots \right] \\
               &= E\left[x_{h+1} | x_{h}, x_{h-1}, \ldots \right] = \hat{x}_{h}(1) = x_{h}
\end{aligned}
$$

<br>

This is true for any forecast horizon

$$
\hat{X}_{h}(l) = x_{h}
$$

<br>

The MA representation of the random walk model is

$$
x_{t} = \varepsilon_{t} + \varepsilon_{t-1} + \varepsilon_{t-2} + \cdots
$$

<br>

The representation has several important implications.

1. The $l$-step ahead forecast error is

$$
e_{h}(l) = \varepsilon_{h+1} + \cdots + \varepsilon_{h+1}
$$

so that

$$
Var[e_{h}(l)] = l \sigma_{\varepsilon}^{2}
$$

which diverges to infinity as $l \rightarrow \infty$

<br>

2. The uncondtional variance of $x_{t}$ is unbounded because $Var[e_{h}(l)]$ approaches infinity as $l$ increases.

<br>

__Random Walk with Drift__

<br>

$$
x_{t} = \mu + x_{t-1} + \varepsilon_{t}
$$

where

$$
\mu = E\left(x_{t} - x_{t-1} \right)
$$

<br>

In finance (and macro) $\mu$ can be important. It is called the drift. 

<br>

To see this

$$
\begin{aligned}
x_{1}  &= \mu + x_{0} + \varepsilon_{1} \\
x_{2}  &= \mu + x_{1} + \varepsilon_{2} = 2\mu + x_{0} + \varepsilon_{2} + \varepsilon_{1} \\
\vdots &= \quad \vdots \\
x_{t}  &= t\mu + x_{0} + \varepsilon_{t} + \varepsilon_{t-1} + \cdots + \varepsilon_{1} 
\end{aligned}
$$

<br>