within CablesLib.OLD.Cables.TESTS.CablesModular;
model FixedCableWeightTest
  CablesLib.OLD.CablesModular.Fixed fixed(setCableLength=false) annotation (Placement(transformation(extent={{-88,-16},{-68,4}})));
  CablesLib.OLD.CablesModular.Weight weight annotation (Placement(transformation(extent={{18,-8},{38,12}})));
  CablesLib.OLD.CablesModular.CableMassless cableMassless annotation (Placement(transformation(extent={{-38,8},{-18,28}})));
  inner Modelica.Mechanics.MultiBody.World world annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
equation
  connect(cableMassless.cable_a, fixed.cable_a) annotation (Line(points={{-38,18},{-78,18},{-78,4}}, color={28,108,200}));
  connect(cableMassless.cable_b, weight.cable_b) annotation (Line(points={{-18,18},{28,18},{28,12}}, color={28,108,200}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end FixedCableWeightTest;
