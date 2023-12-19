within CablesLib.OLD.Cables.TESTS.CablesModular;
model FixedWeightTest
  CablesLib.OLD.CablesModular.Fixed fixed(setCableLength=false) annotation (Placement(transformation(extent={{-88,-16},{-68,4}})));
  CablesLib.OLD.CablesModular.Weight weight annotation (Placement(transformation(extent={{-36,-34},{-16,-14}})));
  inner Modelica.Mechanics.MultiBody.World world(enableAnimation=false) annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
equation
  connect(fixed.cable_a, weight.cable_b) annotation (Line(points={{-78,4},{-26,4},{-26,-14}}, color={28,108,200}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end FixedWeightTest;
