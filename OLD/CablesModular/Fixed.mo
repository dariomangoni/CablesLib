within CablesLib.OLD.CablesModular;
model Fixed
  parameter Real attachPos = 0;
  parameter Boolean setCableLength = false;
  parameter Real pos[3] = zeros(3);
  Interfaces.Cable_a cable_a annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,100})));
initial equation
  if setCableLength then
    cable_a.len = 0;
  end if;
equation
  cable_a.pos = pos;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Line(points={{0,96},{0,20}}, color={28,108,200}),
        Line(points={{-80,22}}, color={28,108,200}),
        Line(points={{-80,20},{80,20}}, color={28,108,200}),
        Line(points={{-60,20},{-80,0}}, color={28,108,200}),
        Line(points={{0,20},{-20,0}}, color={28,108,200}),
        Line(points={{60,20},{40,0}}, color={28,108,200})}), Diagram(coordinateSystem(preserveAspectRatio=false)));
end Fixed;
