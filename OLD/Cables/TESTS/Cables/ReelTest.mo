within CablesLib.OLD.Cables.TESTS.Cables;
model ReelTest
  CablesLib.OLD.Cables.Reel reel annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Sources.ConstantTorque constantTorque(tau_constant=-1) annotation (Placement(transformation(extent={{-62,-10},{-42,10}})));
equation
  connect(constantTorque.flange, reel.flange_a) annotation (Line(points={{-42,0},{-10,0}}, color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end ReelTest;
