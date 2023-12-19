within CablesLib.TESTS.CableDecoupledTests;
model CableDecoupled
  extends Modelica.Mechanics.Translational.Interfaces.PartialCompliantWithRelativeStates;
  import Modelica.Mechanics.MultiBody.Types;
  import SI = Modelica.SIunits;
  parameter Boolean animation = true "= true, if animation shall be enabled";
  parameter SI.TranslationalSpringConstant k(final min = 0) = 2.5e6 "Spring constant";
  parameter SI.TranslationalDampingConstant c(final min = 0) = 2.5e5 "Damping constant";
  SI.Velocity v "Relative velocity (= der(s_rel))";
  Boolean tension "=true, if tension, otherwise no tension";
  Modelica.Mechanics.Translational.Interfaces.Flange_a flangeCable_a annotation (Placement(transformation(extent={{-110,80},{-90,100}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_b flangeCable_b annotation (Placement(transformation(extent={{90,80},{110,100}})));

  Real cableLength;
protected
  Modelica.SIunits.Force f_k "Spring force";
  Modelica.SIunits.Force f_c2 "Linear damping force";
  Modelica.SIunits.Force f_c "Linear damping force which is limited by spring force (|f_c| <= |f_k|)";
equation
  cableLength = flangeCable_b.s - flangeCable_a.s;

  v = der(s_rel);
  // Modify tension force, so that it is only "pushing" and not "pulling/sticking" and that it is continuous
  tension = s_rel > cableLength;
  f_k = smooth(1, noEvent(if tension then k * abs(cableLength - s_rel) else 0));
  f_c2 = if tension then c * v else 0;
  f_c = smooth(0, noEvent(if tension then if f_c2 > f_k then f_k else if f_c2 < (-f_k) then -f_k else f_c2 else 0));
  f = f_k + f_c;

  flangeCable_b.f = f;
  flangeCable_a.f = -f;
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio = false)),
    Icon(coordinateSystem(initialScale = 0.1), graphics={  Line(points = {{-98, 0}, {-48, 0}}, color = {0, 127, 0}), Line(points = {{-12, -38}, {-12, 36}}, color = {0, 127, 0}, thickness = 1), Line(points = {{-12, -28}, {70, -28}, {70, 24}}, color = {0, 127, 0}), Line(points = {{70, 0}, {98, 0}}, color = {0, 127, 0}), Line(points = {{-12, 24}, {0, 24}, {6, 34}, {18, 14}, {30, 34}, {42, 14}, {54, 34}, {60, 24}, {70, 24}}, color = {0, 127, 0}), Rectangle(lineColor = {0, 127, 0}, fillColor = {192, 192, 192},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, extent = {{10, -6}, {50, -50}}), Line(points = {{-52, -70}, {28, -70}}, color = {95, 127, 95}), Polygon(lineColor = {95, 127, 95}, fillColor = {95, 127, 95},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, points = {{58, -70}, {28, -60}, {28, -80}, {58, -70}}), Text(lineColor = {0, 0, 255}, extent = {{-150, 100}, {150, 60}}, textString = "%name"), Text(extent = {{-150, -125}, {150, -95}}, textString = "c=%c"), Text(extent = {{-150, -160}, {150, -130}}, textString = "d=%d"), Line(visible = false, points = {{-100, -100}, {-100, -44}, {22, -44}, {22, -28}}, color = {191, 0, 0}, pattern = LinePattern.Dot), Line(points = {{0, -50}, {50, -50}, {50, -6}, {0, -6}}, color = {0, 127, 0}), Rectangle(
          origin={-46,-1},
          lineColor={0,127,0},
          fillColor={0,127,0},
          fillPattern=FillPattern.Solid,
          extent={{6,40},{-6,-40}}),
        Line(points={{-100,90},{98,90}}, color={0,127,0})}));
end CableDecoupled;
