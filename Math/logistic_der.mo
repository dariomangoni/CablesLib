within CablesLib.Math;
function logistic_der
  input Real u "Signal in";
  input Real transitionU[2] = {-0.1, 0.1} "Range in which the transition from transitionY[1] and transitionY[2] happens";
  input Real transitionY[2] = {-1, 1} "Range spaced when u passes from transitionU[1] to transitionU[2]";
  input Real tol = 1e-3 "Accepted tolerance at range limits e.g. logistic(transitionU[1]) is almost as transitionY[1] except for tol";
  input Real der_u;
  output Real der_y;
protected
  Real u0 = (transitionU[1] + transitionU[2]) / 2;
  Real L = transitionY[2] - transitionY[1];
  Real y0 = transitionY[1];
  Real k = 2 * log((transitionY[2] - transitionY[1]) / tol - 1.0) / (transitionU[2] - transitionU[1]);
algorithm
  der_y := k * L * der_u * exp(k * (u + u0)) / exp(2 * k * (u + u0));
  annotation (
    derivative(zeroDerivative = transitionU, zeroDerivative = transitionY, zeroDerivative = tol) = CrtVehicle.Utilities.Math.logistic_der2);
end logistic_der;
