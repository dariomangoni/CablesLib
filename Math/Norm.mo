within CablesLib.Math;
model Norm
  parameter Integer n = 3;
  Modelica.Blocks.Interfaces.RealInput u[n] annotation (
    Placement(transformation(extent = {{-120, -20}, {-80, 20}})));
  Modelica.Blocks.Interfaces.RealOutput y annotation (
    Placement(transformation(extent = {{90, -10}, {110, 10}})));
equation
  y = Modelica.Math.Vectors.norm(u);
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)));
end Norm;
