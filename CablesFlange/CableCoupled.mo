within CablesLib.CablesFlange;
model CableCoupled
  import Modelica.Mechanics.MultiBody.Types;
  import SI = Modelica.SIunits;
  parameter Boolean fix_a = false;
  parameter Boolean fix_b = false;
  parameter StateSelect stateSelect=StateSelect.avoid "Priority to use s_rel and v_rel as states" annotation (HideResult=true, Dialog(tab="Advanced"));
  parameter SI.Distance s_nominal=1e-4 "Nominal value of s_rel (used for scaling)" annotation (Dialog(tab="Advanced"));

  SI.Position s_rel(start=0, stateSelect=stateSelect, nominal=s_nominal) "Relative distance (= flange_b.s - flange_a.s)";
  SI.Velocity v_rel(start=0, stateSelect=stateSelect) "Relative velocity (= der(s_rel))";

  SI.Force f "Forces between flanges (= flange_b.f)";
  Modelica.Mechanics.Translational.Interfaces.Flange_a flange_a "Left flange of compliant 1-dim. translational component" annotation (
      Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_b flange_b "Right flange of compliant 1-dim. translational component" annotation (
      Placement(transformation(extent={{90,-10},{110,10}})));

  parameter Boolean animation = true "= true, if animation shall be enabled";
  parameter SI.TranslationalSpringConstant k(final min = 0) = 2.5e6 "Spring constant";
  parameter SI.TranslationalDampingConstant c(final min = 0) = 2.5e5 "Damping constant";
  Boolean tension "=true, if tension, otherwise no tension";
  Modelica.Mechanics.Translational.Interfaces.Flange_a flangeCable_a annotation (Placement(transformation(extent={{-110,80},{-90,100}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_b flangeCable_b annotation (Placement(transformation(extent={{90,80},{110,100}})));

  Real s_rel0;
  SI.Velocity v_rel0(start=0, stateSelect=stateSelect) "Relative velocity (= der(s_rel))";
protected
  Modelica.SIunits.Force f_k "Spring force";
  Modelica.SIunits.Force f_c2 "Linear damping force";
  Modelica.SIunits.Force f_c "Linear damping force which is limited by spring force (|f_c| <= |f_k|)";
equation
  assert(s_rel0>0, "Cable length is negative");

  s_rel = flange_b.s - flange_a.s;
  v_rel = der(s_rel);
  s_rel0 = flangeCable_b.s - flangeCable_a.s;
  v_rel0 = der(s_rel0);

  // Modify tension force, so that it is only "pushing" and not "pulling/sticking" and that it is continuous
  tension = s_rel > s_rel0;
  f_k = smooth(1, noEvent(if tension then k * abs(s_rel-s_rel0) else 0));
  f_c2 = if tension then c * (v_rel - v_rel0) else 0; // TODO: check sign
  f_c = smooth(0, noEvent(if tension then if f_c2 > f_k then f_k else if f_c2 < (-f_k) then -f_k else f_c2 else 0));
  f = f_k + f_c;

  flange_b.f = f;
  flange_a.f = -f;
  if fix_a then
    flangeCable_a.f = 0;
  else
    - flangeCable_a.f = -f;
  end if;
  if fix_b then
    flangeCable_b.f = 0;
  else
    - flangeCable_b.f = f;
  end if;

  annotation (
    Diagram(coordinateSystem(preserveAspectRatio = false)),
    Icon(coordinateSystem(initialScale = 0.1), graphics={  Line(points = {{-98, 0}, {-48, 0}}, color = {0, 127, 0}), Line(points={{-12,-40},{-12,44}},      color = {0, 127, 0}, thickness = 1), Line(points = {{-12, -28}, {70, -28}, {70, 24}}, color = {0, 127, 0}), Line(points = {{70, 0}, {98, 0}}, color = {0, 127, 0}), Line(points = {{-12, 24}, {0, 24}, {6, 34}, {18, 14}, {30, 34}, {42, 14}, {54, 34}, {60, 24}, {70, 24}}, color = {0, 127, 0}), Rectangle(lineColor = {0, 127, 0}, fillColor = {192, 192, 192},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, extent = {{10, -6}, {50, -50}}), Line(points = {{-52, -70}, {28, -70}}, color = {95, 127, 95}), Polygon(lineColor = {95, 127, 95}, fillColor = {95, 127, 95},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, points = {{58, -70}, {28, -60}, {28, -80}, {58, -70}}), Text(lineColor = {0, 0, 255}, extent = {{-150, 100}, {150, 60}}, textString = "%name"), Text(extent = {{-150, -125}, {150, -95}}, textString = "c=%c"), Text(extent = {{-150, -160}, {150, -130}}, textString = "d=%d"), Line(visible = false, points = {{-100, -100}, {-100, -44}, {22, -44}, {22, -28}}, color = {191, 0, 0}, pattern = LinePattern.Dot), Line(points = {{0, -50}, {50, -50}, {50, -6}, {0, -6}}, color = {0, 127, 0}), Rectangle(
          origin={-46,-9},
          lineColor={0,127,0},
          fillColor={0,127,0},
          fillPattern=FillPattern.Solid,
          extent={{6,40},{-6,-40}}),
        Line(
          points={{-100,90},{-80,90},{-80,20},{-46,20}},
          color={0,128,0},
          pattern=LinePattern.Dash),
        Line(
          points={{100,90},{80,90},{80,20},{70,20}},
          color={0,128,0},
          pattern=LinePattern.Dash),                                                                                 Line(points={{-12,44},{-66,44}},       color = {0, 127, 0}, thickness = 1),
                                                                                                                     Line(points={{-66,26},{-66,44}},       color = {0, 127, 0}, thickness = 1)}));
end CableCoupled;
