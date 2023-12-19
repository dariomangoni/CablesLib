within CablesLib.Math;
function logistic2
  input Real u "Signal in";
  input Real transitionU[2] = {-0.1, 0.1} "Range in which the transition from transitionY[1] and transitionY[2] happens";
  input Real transitionY[2] = {-1, 1} "Range spaced when u passes from transitionU[1] to transitionU[2]";
  input Real tol = 1e-3 "Accepted tolerance at range limits e.g. logistic(transitionU[1]) is almost as transitionY[1] except for tol";
  output Real y "Signal out";
protected
  Real u0 = (transitionU[1] + transitionU[2]) / 2;
  Real L = 2 * (transitionY[2] - transitionY[1]);
  Real y0 = 2 * transitionY[1] - transitionY[2];
  Real k = 2 * log((transitionY[2] - transitionY[1]) / tol - 1.0) / (transitionU[2] - transitionU[1]);
algorithm
  y := y0 + L / (1 + exp(-k * (u - u0) .^ 2));
end logistic2;
