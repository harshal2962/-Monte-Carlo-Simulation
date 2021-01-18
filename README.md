# -Monte-Carlo
Monte Carlo-An application in power generation system
Monte Carlo methods, or Monte Carlo experiments, are a broad class of computational algorithms that rely on repeated random sampling 
to obtain numerical results. The underlying concept is to use randomness to solve problems that might be deterministic in principle.(WIKI)

This stochastic process is useful to achieve objective measures for all parts of the system so that better and more informed decision making and risk analysis is possible. 
The most important additional principle associated with the MCS approach is that it can provide the probability distributions and histograms associated with the various reliability indices which, in consequence, can provide additional and more informative data about the behavior of a system.
%
The IEEE Subcommittee on the Application of Probability
Methods has developed a Reliability Test System(RTS) which includes both generation and major transmission facilities. The main objective was to provide a
basic model which could be used to test or compare methods for reliability analysis of power systems. The generating capacity, load model data and other 
common terminology are presented in the code.
%
Results
The power generation system is modelled to randomly create absence of some portion of it's generation capacity
therefore, failing to cater the agreed load demand and presenting instances of unreliability. This scenario is used to assess reliability indices.
Upon running the code, the prompt asks user to enter sample years. The execution returns indices and a histogram.

What to infer? Suppose you enter 5000 as sample years-
1)The results do not imply that 5000 years have been studied because this would have no physical or real meaning; instead the same year has been
  sampled 5000 times, thus creating an understanding of not only what may happen to the real system in that time but also the likelihood of these
  alternative scenarios.
2)On this basis, the results indicate that the most likely outcome (approx. prob = 2600/5000 = 0.52) is to encounter no trouble, but at the other extreme 
  it is possible to encounter two hundred days of trouble with a probability of 1/5000 = 0.0002.
3)An alternative interpretation of the same results could indicate that, if 5000 identical systems were operated under the same conditions. 
  2500 would experience no trouble, 200 would experience one day of trouble, etc.
4) For highly reliable systems if a probability density function is plotted it shows that, because of its extreme skewedness, the average value is
   very small and almost insignificant but that extremely high values can occur. This type of effect, which can easily occur in real systems, can be masked 
   or ignored if only average values (or even standard deviations) are evaluated.
   
*The results are subject to using only one season as constant for hourly load variation instead of three seasons. 
* Roy Billinton and Ronald N. Allan- Reliability Evaluation of Power Systems gives deeper insights.
