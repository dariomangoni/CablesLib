within CablesLib.Math;
block ConstantVectorOutput "3D Vector Source"
  extends Modelica.Blocks.Icons.Block;
  parameter Real value[:] "value for the output";
  Modelica.Blocks.Interfaces.RealOutput y[size(value, 1)] "Connector of Real output signals" annotation (
    Placement(transformation(extent = {{100, -10}, {120, 10}})));
equation
  y = value;
  annotation (
    Documentation(info = "<html>
  <p>
  The output connector is the <b>concatenation</b> of the three constants cost1, cost2 and cost3 parameters.
  </html>"),
    Icon(coordinateSystem(initialScale = 0.1), graphics={  Line(points = {{8, 0}, {102, 0}}, color = {0, 0, 127}), Line(points = {{-78, 70}, {-60, 70}, {-4, 6}}, color = {0, 0, 127}), Line(points = {{-78, 0}, {-12, 0}}, color = {0, 0, 127}), Line(points = {{-78, -70}, {-62, -70}, {-4, -4}}, color = {0, 0, 127}), Ellipse(lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid, extent = {{-14, 16}, {16, -14}}, endAngle = 360), Rectangle(origin = {-85, 71}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, extent = {{-5, 5}, {7, -7}}), Rectangle(origin = {-85, 1}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, extent = {{-5, 5}, {7, -7}}), Rectangle(origin = {-85, -69}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.CrossDiag, extent = {{-5, 5}, {7, -7}})}),
    Diagram(coordinateSystem(initialScale = 0.1), graphics={  Line(points = {{-80, 70}, {-60, 70}, {-4, 6}}, color = {0, 0, 255}), Line(points = {{-80, -70}, {-62, -70}, {-4, -4}}, color = {0, 0, 255}, pattern = LinePattern.Dash), Line(points = {{8, 0}, {102, 0}}, color = {0, 0, 255}), Ellipse(lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-14, 16}, {16, -14}}, endAngle = 360), Line(points = {{-80, 0}, {-12, 0}}, color = {0, 0, 255}), Rectangle(origin = {-86, 70}, lineColor = {0, 0, 255}, fillColor = {0, 0, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, extent = {{-6, 6}, {6, -6}}), Rectangle(origin = {-86, 0}, lineColor = {0, 0, 255}, fillColor = {0, 0, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, extent = {{-6, 6}, {6, -6}}), Rectangle(origin = {-86, -70}, lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, pattern = LinePattern.None,
            fillPattern =                                                                                                                                                                                                        FillPattern.CrossDiag, extent = {{-6, 6}, {6, -6}})}));
end ConstantVectorOutput;
