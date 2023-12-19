within CablesLib.TESTS.Pulley3DTests;
model Pulley3DTest2
  inner Modelica.Mechanics.MultiBody.World world(n={0,0,-1}, nominalLength=0.1)
                                                                 annotation (
    Placement(transformation(extent = {{-100, 80}, {-80, 100}})));
  CablesFlange.Pulley3D pulley3D(enableFriction=false) annotation (Placement(transformation(extent={{-10,-30},{10,-10}})));
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed1(animation=false,
                                                  r = {0.5, 0, 0}) annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {0, 16})));
  Modelica.Mechanics.MultiBody.Forces.WorldForce myForceR(resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameB.world, color={0,0,255}) annotation (Placement(transformation(extent={{92,-80},{72,-60}})));
  Math.RealVectorExpression realVectorExpression1(out={866,250,-500})   annotation (Placement(transformation(extent={{128,-80},{108,-60}})));
  Modelica.Mechanics.MultiBody.Forces.WorldForce myForceL(resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameB.world, color={255,0,0})
                                                                                                                                                   annotation (Placement(transformation(extent={{38,-54},{18,-34}})));
  Math.RealVectorExpression realVectorExpression2(out={-866,250,-500})  annotation (Placement(transformation(extent={{74,-54},{54,-34}})));
equation
  connect(fixed1.frame_b, pulley3D.support) annotation (Line(
      points={{-1.77636e-15,6},{0,6},{0,-10}},
      color={95,95,95},
      thickness=0.5));
  connect(myForceR.force, realVectorExpression1.out) annotation (Line(points={{94,-70},{107,-70}}, color={0,0,127}));
  connect(myForceL.force,realVectorExpression2. out) annotation (Line(points={{40,-44},{53,-44}},   color={0,0,127}));
  connect(myForceL.frame_b, pulley3D.frame_a) annotation (Line(
      points={{18,-44},{-10,-44},{-10,-20}},
      color={95,95,95},
      thickness=0.5));
  connect(myForceR.frame_b, pulley3D.frame_b) annotation (Line(
      points={{72,-70},{42,-70},{42,-20},{10,-20}},
      color={95,95,95},
      thickness=0.5));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)));
end Pulley3DTest2;
