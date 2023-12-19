within CablesLib.OLD.Cables.TESTS.CablesModular;
model PulleyTest
  CablesLib.OLD.CablesModular.Fixed fixed annotation (Placement(transformation(extent={{-62,-60},{-42,-40}})));
  CablesLib.OLD.CablesModular.Pulley pulley annotation (Placement(transformation(extent={{-50,62},{-30,82}})));
  inner Modelica.Mechanics.MultiBody.World world annotation (Placement(transformation(extent={{-100,40},{-80,60}})));
equation
  connect(world.frame_b, pulley.support) annotation (Line(
      points={{-80,50},{-40,50},{-40,62}},
      color={95,95,95},
      thickness=0.5));
  connect(pulley.cable_a, fixed.cable_a) annotation (Line(points={{-50,72},{-52,72},{-52,-40}}, color={28,108,200}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end PulleyTest;
