within CablesLib.OLD.CablesUPS;
model ReelLength
  Modelica.Blocks.Interfaces.RealOutput y annotation (Placement(transformation(extent={{90,60},{110,80}}), iconTransformation(extent={{90,60},{110,80}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a annotation (Placement(transformation(
        extent={{-16,-16},{16,16}},
        rotation=90,
        origin={0,-100})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b annotation (Placement(transformation(extent={{84,-16},{116,16}})));
  Modelica.Blocks.Interfaces.RealInput u annotation (Placement(transformation(extent={{-120,50},{-80,90}})));
equation
  connect(frame_b, frame_a) annotation (Line(
      points={{100,0},{0,0},{0,-100}},
      color={95,95,95},
      thickness=0.5));
  connect(u, y) annotation (Line(points={{-100,70},{100,70},{100,70}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={Rectangle(extent={{-100,100},{100,-100}}, lineColor={28,108,200})}), Diagram(coordinateSystem(preserveAspectRatio=false)));
end ReelLength;
