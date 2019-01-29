# __Brough Lecture Notes: Beginning Time Series Topics II__

<br>

Finance 5330: Financial Econometrics <br>
Tyler J. Brough <br>
Last Updated: January 25, 2019 <br>
<br>

___Time Series Continued___

<br>

Summary of allowed lag polynomial manipulations

1. We can multiply them

$$
a(L)b(L) = (a_{0} + a_{1} L + \cdots) (b_{0} + b_{1} L + \cdots) = a_{0}b_{0} + (a_{0}b_{1} + b_{0}a_{1}) L + \cdots
$$

2. They commute

$$
a(L)b(L) = b(L)a(L)
$$

3. We can raise them to positive integer powers

$$
a(L)^{2} = a(L)a(L)
$$

4. We can invert them, by factoring them and inverting each term

$$
\begin{aligned}
a(L)      &= (1 - \lambda_{1} L) (1 - \lambda_{2} L) \quad \cdots \\
a(L)^{-1} &= (1 - \lambda_{1} L)^{-1} (1 - \lambda_{2} L)^{-1} \\
          &= \sum\limits_{j=0}^{\infty} \lambda_{1}^{j} L^{j} \sum\limits_{j=0}^{\infty} \lambda_{2}^{j} L^{j} \\
          & = c_{1} (1 - \lambda_{1} L)^{-1} + c_{2} (1 - \lambda_{2} L)^{-1} \quad \cdots \\
\end{aligned}
$$

<br>
<br>

We'll look at roots greater than and/or equal to one, fractional powers, and non-polynomial functions of lag operators later. 

<br>

___Multivariate ARMA Models___

<br>

The multivariate case is similar, reinterpreting our variables as vectors and matrices:

$$
x_{t} = \begin{bmatrix} y_{t} \\ z_{t} \end{bmatrix}
$$

<br>

The building block is the multivariate white noise process, $\varepsilon_{t} \sim iid N(0, \Sigma)$, which we write as follows

<br>

$$
\varepsilon_{t} = \begin{bmatrix} \delta_{t} \\ \nu_{t} \end{bmatrix}
$$

<br>

with 

$$
\begin{aligned}
E(\varepsilon_{t}) &= 0 \\
E(\varepsilon_{t} \varepsilon_{t}^{\prime}) &= \Sigma = \begin{bmatrix} \sigma_{\delta}^{2} & \sigma_{\delta \nu}^{2} \\ \sigma_{\nu \delta}^{2} & \sigma_{\nu}^{2} \end{bmatrix}
\end{aligned}
$$

<br>

and

$$
E(\varepsilon_{t} \varepsilon_{t-j}^{\prime}) = 0
$$

<br>

The AR(1) is $x_{t} = \phi x_{t-1} + \varepsilon_{t}$, or 

<br>

$$
\begin{bmatrix} y_{t} \\ z_{t} \end{bmatrix} = \begin{bmatrix} \phi_{yy} & \phi_{yz} \\ \phi_{zy} & \phi_{zz} \end{bmatrix} \begin{bmatrix} y_{t-1} \\ z_{t-1} \end{bmatrix} + \begin{bmatrix} \delta_{t} \\ \nu_{t} \end{bmatrix}
$$

<br>
<br>

Or

$$
\begin{aligned}
y_{t} &= \phi_{yy} y_{t-1} + \phi_{yz} z_{t-1} + \delta_{t} \\
z_{t} &= \phi_{zy} y_{t-1} + \phi_{zz} z_{t-1} + \nu_{t}
\end{aligned}
$$

<br>

__NB:__ this is a Vector autoregressive model of order 1, or a VAR(1) model.

<br>
<br>

__NB:__ both lagged $y$ and lagged $z$ appear in each equation. 

<br>

Thus, the VAR(1) captures cross-variable dynamics. 

<br>
<br>

__Ex:__ It could capture the fact that if volume is higher in one trading period, volatility tends to be higher the following trading period; as well as the fact theat if volatility is high one period volume tends to be high the next period. 

<br>

We can write the VAR(1) in lag operator notation:

<br>

$$
(I - \Phi L) x_{t} = \varepsilon_{t}
$$

or 

$$
A(L) x_{t} = B(L) \varepsilon_{t}
$$

<br>

where: 

* $A(L) = I - \Phi_{1} L - \Phi_{2} L^{2} - \cdots$

* $B(L) = I + \Theta_{1} L + \Theta_{2} L^{2} + \cdots$

<br>
<br>
<br>

__NB:__ $\Phi_{j} = \begin{bmatrix} \phi_{j,yy} & \phi_{j, yz} \\ \phi_{j,zy} & \phi_{j,zz} \end{bmatrix}$ and similarly for $\Theta_{j}$.

<br>

We can invert multivariate ARMA models. 

<br>

For example, the MA($\infty$) representation can be obtained from the VAR(1) as

$$
(I - \Phi L) x_{t} = \varepsilon_{t}  \quad \Leftrightarrow \quad (I - \Phi L)^{-1} \varepsilon_{t} = \sum\limits_{j=0}^{\infty} \Phi^{j} \varepsilon_{t-j}
$$

<br>

___Autocorrelation and Autocovariance Functions___

<br>
<br>

__Autocovariance__ of a series $x_{t}$ is

<br>

$$
\gamma_{j} = Cov(x_{t}, x_{t-j})
$$

<br>

Hence, 

$$
\gamma_{j} = E(x_{t} x_{t-j})
$$

<br>

__NB:__ $\gamma_{0} = Var(x_{t})$

<br>

__NB:__ Recall $Cov(x_{t}, x_{t-j}) = E[(x_{t} - E(x_{t}))(x_{t-j} - E(x_{t-j}))]$ but $E(x_{t}) = 0$ for our purposes.

<br>

__Autocorrelation__ is:

$$
\rho_{j} = \frac{\gamma_{j}}{Var(x_{t})} = \frac{\gamma_{j}}{\gamma_{0}}
$$

<br>
<br>

___Autocovariance and Autocorrelation of ARMA Processes___

<br>

White noise: since we assume $\varepsilon_{t} \sim N(0,\sigma_{\varepsilon}^{2})$, it's clear  that

$$
\gamma_{0} = \sigma_{\varepsilon_{t}}^{2}, \quad \gamma_{j} = 0 \quad \mbox{for all} \quad j \ne 0
$$

<br>

$$
\rho_{0} = 1, \quad \rho_{j} = 0 \quad \mbox{for all} \quad j \ne 0
$$

<br>

__MA(1)__

<br>

$$
x_{t} = \varepsilon_{t} + \theta \varepsilon_{t-1}
$$

<br>

Autocovariance:

<br>

$$
\begin{aligned}
\gamma_{0} &= Var(x_{t}) = Var(\varepsilon_{t} + \theta \varepsilon_{t-1}) \\
           &= \sigma_{\varepsilon}^{2} + \theta^{2} \sigma_{\varepsilon}^{2} \\ 
           &= (1 + \theta^{2}) \sigma_{\varepsilon}^{2} \\
\gamma_{1} &= E(x_{t} x_{t-1}) = E[(\varepsilon_{t} + \theta \varepsilon_{t-1}) (\varepsilon_{t-1} + \theta \varepsilon_{t-2})] \\
           &= E[\theta \varepsilon_{t-1}^{2}] \\
           &= \theta \sigma_{\varepsilon}^{2} \\
\gamma_{2} &= E(x_{t} x_{t-2}) = E[(\varepsilon_{t} + \theta \varepsilon_{t-1}) (\varepsilon_{t-1} + \theta \varepsilon_{t-3})] = 0 \\
\gamma_{3} &= 0
\end{aligned}
$$

<br>

Autocorrelation

$$
\begin{aligned}
\rho_{1} &= \frac{\theta}{1 + \theta^{2}} \\
\rho_{2} &= 0
\end{aligned}
$$

<br>

__MA(2)__

<br>

$$
x_{t} = \varepsilon_{t} + \theta_{1} \varepsilon_{t-1} + \theta_{2} \varepsilon_{t-2}
$$

<br>

Autocovariance:

$$
\begin{aligned}
\gamma_{0} &= E[(\varepsilon_{t} + \theta_{1} \varepsilon_{t-1} + \theta_{2} \varepsilon_{t-2})(\varepsilon_{t} + \theta_{1} \varepsilon_{t-1} + \theta_{2} \varepsilon_{t-2})] \\
           &= (1 + \theta_{1}^{2} + \theta_{2}^{2}) \sigma_{\varepsilon}^{2} \\
\gamma_{1} &= E[(\varepsilon_{t} + \theta_{1} \varepsilon_{t-1} + \theta_{2} \varepsilon_{t-2})(\varepsilon_{t-1} + \theta_{1} \varepsilon_{t-2} + \theta_{2} \varepsilon_{t-3})] \\
           &= (\theta_{1} + \theta_{1}\theta_{2}) \sigma_{\varepsilon}^{2}
\end{aligned}
$$

<br>

$\gamma_{3}, \gamma_{4}, \ldots = 0$

<br>

Autocorrelation: 

$$
\begin{aligned}
\rho_{0} &= 1 \\
\rho_{1} &= \frac{\theta_{1} + \theta_{1} \theta_{2}}{(1 + \theta_{1}^{2} + \theta_{2}^{2})} \\
\rho_{2} &= \frac{\theta_{2}}{(1 + \theta_{1}^{2} + \theta_{2}^{2})}
\end{aligned}
$$

<br>

$\rho_{3}, \rho_{4}, \ldots = 0$

<br>

__MA(q), MA($\infty$)__

<br>

By now the pattern is clear: MA(q) processes have q autocorrelations different from zero. Also, if

<br>

$$
x_{t} = \theta(L) \varepsilon_{t} = \sum\limits_{j=0}^{\infty} (\theta_{j} L^{j}) \varepsilon_{t}
$$

<br>

then 

$$
\begin{aligned}
\gamma_{0} &= Var(x_{t}) = \left( \sum\limits_{j=0}^{\infty} \theta_{j}^{2} \right) \sigma_{\varepsilon}^{2} \\
\gamma_{k} &= \sum\limits_{j=0}^{\infty} \theta_{j} \theta_{j+k} \sigma_{\varepsilon}^{2}
\end{aligned}
$$

<br>

__NB:__ $\theta_{0} = 1$

<br>

__NB:__ The lesson is that calculation of 2nd moments for MA processes is easy. Because covariance terms
$E(\varepsilon_{j} \varepsilon_{k})$ drop out!

<br>

__AR(1)__

<br>

Two ways to proceed: 

1. Invert the MA($\infty$) and use the above

$$
(1 - \phi L) x_{t} = \varepsilon_{t} \Rightarrow x_{t} = (1 - \phi L)^{-1} \varepsilon_{t} = \sum\limits_{j=0}^{\infty} \phi^{j} \varepsilon_{t-j} 
$$

<br>

$$
\begin{aligned}
\gamma_{0} &= \left(\sum\limits_{j=0}^{\infty} \phi^{2j}\right) \sigma_{\varepsilon}^{2} = \frac{1}{1 - \phi^{2}} \sigma_{\varepsilon}^{2}; \quad \rho_{0} = 1 \\
\gamma_{1} &= \left(\sum\limits_{j=0}^{\infty} \phi^{j} \phi^{j+1} \right) \sigma_{\varepsilon}^{2} = \phi \left( \sum\limits_{j=0}^{\infty} \phi^{2j} \right) \sigma_{\varepsilon}^{2}  = \frac{\phi}{1 - \phi^{2}}\sigma_{\varepsilon}^{2}; \quad \rho_{1} = \phi \\
\mbox{and continuing} \\
\gamma_{k} &= \frac{\phi^{k}}{1 - \phi^{2}} \sigma_{\varepsilon}^{2}; \quad \rho_{k} = \phi^{k}
\end{aligned}
$$

<br>

2. Another way useful in it's own right

$$
\begin{aligned}
\gamma_{1} &= E(x_{t} x_{t-1}) = E[(\phi x_{t-1} + \varepsilon_{t}) (x_{t-1})] = \phi \sigma_{x}^{2}; \quad \rho = \phi \\
\gamma_{2} &= E(x_{t} x_{t-2}) = E[(\phi^{2} x_{t-2} + \phi \varepsilon_{t-1} + \varepsilon_{t}) (x_{t-2})] = \phi^{k} \sigma_{x}^{2}; \quad \rho_{k} = \phi^{k} 
\end{aligned}
$$

<br>
<br>

__AR(p) Yule-Walker Equations__

<br>

This latter method is the easiest way to proceed for AR(p)'s. 

<br>

Let's look at an AR(3), then you can generalize.

<br>

Multiplying both sides by $x_{t}, x_{t-1}, \cdots$ taking expectations, then dividing by $\gamma_{0}$ we obtain

$$
\begin{aligned}
1 &= \phi \rho_{1} + \phi_{2} \rho_{2} + \phi_{3} \rho_{3} + \frac{\sigma_{\varepsilon}^{2}}{\gamma_{0}} \\
\rho_{1} &= \phi_{1} + \phi_{2} \rho_{1} + \phi_{3} \rho_{2}             \\
\rho_{2} &= \phi_{1}\rho_{1} + \phi_{2} + \phi_{3} \rho_{1}              \\
\rho_{3} &= \phi_{1}\rho_{2} + \phi_{2}\rho_{1} + \phi_{3}               \\
\rho_{k} &= \phi_{1}\rho_{k-1} + \phi_{2}\rho_{k-2} + \phi_{3}\rho_{k-3} \\
\end{aligned}
$$

<br>

The 2nd, 3rd, and 4th equations can be solved for $\rho_{1}$, $\rho_{2}$, $\rho_{3}$.

<br>

Then each remaining equation gives $\rho_{k}$ in terms of $\rho_{k-1}$ and $\rho_{k-2}$, so we can solve for all of the $\rho$'s.

<br>

__NB:__ The $\rho$'s follow the same difference equation as the original $x$'s

<br>

The first equation can be solved for the variance

$$
\sigma_{x}^{2} = \gamma_{0} = \frac{\sigma_{\varepsilon}^{2}}{1 - [\phi_{1} \rho_{1} + \phi_{2} \rho_{2} + \phi_{3} \rho_{3}]}
$$

<br>

___Stationarity___

<br>

In calculating the moments of ARMA processes, the moments did not depend on calendar time

$$
\begin{aligned}
E(x_{t})         &= E(x_{s}) \quad \quad \mbox{for all $t$ and $s$}         \\
E(x_{t} x_{t-j}) &= E(x_{s} x_{s-j}) \quad \mbox{for all $t$ and $s$} \\
\end{aligned}
$$

<br>

These properties are true for the invertible ARMA models, but they reflect a deeper property.

<br>

A process $\{x_{t}\}$ is __strongly stationary__ or __strictly stationary__ if the joint probability distribution function of $\{x_{t-s}, \cdots, x_{t}, \cdots, x_{t+s}\}$ is independent of $t$ for all $s$.

<br>

A process $\{x_{t}\}$ is __weakly stationary__ or __covariance stationary__ if $E(x_{t})$, $E(x_{t}^{2})$ are finite and $E(x_{t} x_{t-j})$ depends only on $j$ and not on $t$.

<br>

__NB:__

<br>

1. Strong stationary does not imply weak stationarity. $E(x_{t}^{2})$ must be finite.
    - Ex: on iid Cauchy process is strongly, but not covariance stationary. 
    
2. Strong stationarity plus $E(x_{t}), E(x_{t}^{2}) < \infty \Rightarrow$ weak stationarity

3. Weak stationarity does not $\Rightarrow$ strong stationarity. If the process is not normal, other
   moments $\left(E(x_{t} x_{t-j} x_{t-k})\right)$ _might_ depend on $t$, so the process might not be 
   strongly stationary.
   
4. Weak stationarity plus normality $\Rightarrow$ strong stationarity