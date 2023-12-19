within CablesLib.OLD.Cables;
model CableTriangle

  parameter Real pulleyRadius = 0.01;

  Modelica.Mechanics.Rotational.Components.BearingFriction bearingFriction(useSupport=true) annotation (Placement(transformation(extent={{-22,14},{-2,34}})));
  Modelica.Mechanics.MultiBody.Parts.Body bodyC(r_CM={0,0,0}, m=1)
                                                annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={34,88})));
  Modelica.Mechanics.MultiBody.Parts.Body bodyAB(r_CM={0,0,0}, m=0.1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={50,-24})));
  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic(s(fixed=true, start=1), v(fixed=true, start=0))
                                                          annotation (Placement(transformation(extent={{-80,-70},{-60,-50}})));
  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic1(useAxisFlange=true, n(displayUnit="1") = {0,1,0},
    s(fixed=true),
    v(fixed=true))                                                                                           annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-34,-36})));
  Modelica.Mechanics.MultiBody.Parts.Mounting1D mounting1D(n(displayUnit="1") = {0,0,1}) annotation (Placement(transformation(extent={{18,-2},{-2,18}})));
  Modelica.Mechanics.Translational.Components.Spring spring1(c=10000, s_rel0=1000) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-54,-36})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J=0.01)
                                                           annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-46,26})));
  Modelica.Mechanics.Translational.Components.IdealGearR2T idealGearR2T(ratio=1/pulleyRadius) annotation (Placement(transformation(extent={{-72,16},{-92,36}})));
  Modelica.Mechanics.Translational.Components.Mass mass(
    m=0.1,
    s(fixed=true),
    v(fixed=true))                                      annotation (Placement(transformation(extent={{-134,16},{-114,36}})));
  inner Modelica.Mechanics.MultiBody.World world annotation (Placement(transformation(extent={{-120,-70},{-100,-50}})));
  Modelica.Mechanics.MultiBody.Forces.Force force(resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
                                                  annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={34,62})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute2(useAxisFlange=false, n(displayUnit="1") = {1,0,0},
    phi(fixed=false))                                                                                       annotation (Placement(transformation(extent={{-18,-34},{2,-14}})));
  Modelica.Mechanics.Translational.Sources.Force force1 annotation (Placement(transformation(extent={{-166,16},{-146,36}})));
  Modelica.Blocks.Sources.Constant const(k=-100) annotation (Placement(transformation(extent={{-212,16},{-192,36}})));
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed(animation=false,
                                                 r={1,1,0}) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={84,66})));
  CrtVehicle.Utilities.Routing.RealVectorExpression realVectorExpression(out={0,-100,0})
                                                                                        annotation (Placement(transformation(extent={{-100,56},{-80,76}})));

equation

  connect(spring1.flange_b, prismatic1.axis) annotation (Line(points={{-54,-26},{-46,-26},{-46,-28},{-40,-28}}, color={0,127,0}));
  connect(spring1.flange_a, prismatic1.support) annotation (Line(points={{-54,-46},{-48,-46},{-48,-40},{-40,-40}}, color={0,127,0}));
  connect(prismatic.frame_b, prismatic1.frame_a) annotation (Line(
      points={{-60,-60},{-34,-60},{-34,-46}},
      color={95,95,95},
      thickness=0.5));
  connect(inertia.flange_b, bearingFriction.flange_a) annotation (Line(points={{-36,26},{-32,26},{-32,24},{-22,24}},
                                                                                                   color={0,0,0}));
  connect(idealGearR2T.flangeR, inertia.flange_a) annotation (Line(points={{-72,26},{-56,26}}, color={0,0,0}));
  connect(mass.flange_b, idealGearR2T.flangeT) annotation (Line(points={{-114,26},{-92,26}}, color={0,127,0}));
  connect(world.frame_b, prismatic.frame_a) annotation (Line(
      points={{-100,-60},{-80,-60}},
      color={95,95,95},
      thickness=0.5));
  connect(bodyC.frame_a, force.frame_b) annotation (Line(
      points={{34,78},{34,72}},
      color={95,95,95},
      thickness=0.5));
  connect(revolute2.frame_a, prismatic1.frame_b) annotation (Line(
      points={{-18,-24},{-34,-24},{-34,-26}},
      color={95,95,95},
      thickness=0.5));
  connect(revolute2.frame_b, bodyAB.frame_a) annotation (Line(
      points={{2,-24},{40,-24}},
      color={95,95,95},
      thickness=0.5));
  connect(mounting1D.flange_b, bearingFriction.support) annotation (Line(points={{-2,8},{-12,8},{-12,14}},  color={0,0,0}));
  connect(force1.flange, mass.flange_a) annotation (Line(points={{-146,26},{-134,26}}, color={0,127,0}));
  connect(force1.f, const.y) annotation (Line(points={{-168,26},{-191,26}}, color={0,0,127}));
  connect(mounting1D.frame_a, revolute2.frame_b) annotation (Line(
      points={{8,-2},{8,-24},{2,-24}},
      color={95,95,95},
      thickness=0.5));
  connect(force.frame_a, bodyAB.frame_a) annotation (Line(
      points={{34,52},{34,-24},{40,-24}},
      color={95,95,95},
      thickness=0.5));
  connect(fixed.frame_b, force.frame_b) annotation (Line(
      points={{74,66},{56,66},{56,72},{34,72}},
      color={95,95,95},
      thickness=0.5));
  connect(realVectorExpression.out, force.force) annotation (Line(points={{-79,66},{-28,66},{-28,56},{22,56}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end CableTriangle;
