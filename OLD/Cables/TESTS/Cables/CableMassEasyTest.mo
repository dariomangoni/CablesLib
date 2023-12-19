within CablesLib.OLD.Cables.TESTS.Cables;
model CableMassEasyTest
  inner Modelica.Mechanics.MultiBody.World world(n(displayUnit="1") = {0,0,-1}) annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed(animation=false, r={1.5,0,0}) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={10,-10})));
  CablesLib.OLD.Cables.CableMass_easy cableMass_easy(unstretchedLength=2) annotation (Placement(transformation(extent={{-48,-10},{-28,10}})));
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed1(animation=false, r={0,0,0}) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-70,-10})));
equation
  connect(cableMass_easy.frame_b, fixed.frame_b) annotation (Line(
      points={{-28,0},{10,0}},
      color={95,95,95},
      thickness=0.5));
  connect(cableMass_easy.frame_a, fixed1.frame_b) annotation (Line(
      points={{-48,0},{-70,0}},
      color={95,95,95},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end CableMassEasyTest;
