within CablesLib.OLD.CablesModular;
model Reel
  parameter Real pos[3] = zeros(3);
  Interfaces.Cable_a cable_a annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,100}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={100,0})));
  Modelica.Blocks.Interfaces.RealInput u annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));
equation
  cable_a.len = u;
  cable_a.pos = pos;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Line(points={{-80,22}}, color={28,108,200})}),       Diagram(coordinateSystem(preserveAspectRatio=false)));
end Reel;
