within CablesLib.CablesFlange;
model ReelLength
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a annotation (Placement(transformation(
        extent={{-16,-16},{16,16}},
        rotation=90,
        origin={0,-100})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b annotation (Placement(transformation(extent={{84,-16},{116,16}})));
  Modelica.Blocks.Interfaces.RealInput u annotation (Placement(transformation(extent={{-120,50},{-80,90}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_b flange_b annotation (Placement(transformation(extent={{90,60},{110,80}})));
  Modelica.Mechanics.Translational.Sources.Position position(useSupport=false, v(fixed=true)) annotation (Placement(transformation(extent={{-8,60},{12,80}})));
  Modelica.Blocks.Math.Gain gain(k=-1) annotation (Placement(transformation(extent={{-40,60},{-20,80}})));
equation
  connect(frame_b, frame_a) annotation (Line(
      points={{100,0},{0,0},{0,-100}},
      color={95,95,95},
      thickness=0.5));
  connect(position.s_ref, gain.y) annotation (Line(points={{-10,70},{-19,70}}, color={0,0,127}));
  connect(u, gain.u) annotation (Line(points={{-100,70},{-42,70}}, color={0,0,127}));
  connect(position.flange, flange_b) annotation (Line(points={{12,70},{100,70}}, color={0,127,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={Rectangle(extent={{-100,100},{100,-100}}, lineColor={28,108,200})}), Diagram(coordinateSystem(preserveAspectRatio=false)));
end ReelLength;
