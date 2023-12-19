within CablesLib.OLD.JointUPS_mod;
model JointUPSDeltaFlangeTest
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-88,52})));
  Modelica.Mechanics.MultiBody.Parts.Body body(r_CM={0,0,0},
    m=5,
    r_0(fixed=true, start={0,0,-1}),
    v_0(fixed=true),
    angles_fixed=true,
    w_0_fixed=true,
    useQuaternions=false)                                         annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-56,-86})));
  JointUPS_mod.JointUPSDeltaFlange jointUPSDeltaFlange(n1_a={0,1,0}, nAxis_ia={0,0,1}) annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={-58,-38})));
  Modelica.Mechanics.Translational.Components.SpringDamper springDamper(c=100, d=10,
    s_rel0=1)                                                                        annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-12,-38})));
  Modelica.Mechanics.Translational.Components.Fixed fixed1 annotation (Placement(transformation(extent={{-56,22},{-36,42}})));
  inner Modelica.Mechanics.MultiBody.World world(enableAnimation=true, n(displayUnit="1") = {0,0,-1})
                                                 annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  Modelica.Blocks.Sources.Constant const(k=-Modelica.Constants.g_n) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={22,-34})));
  Modelica.Mechanics.Translational.Sources.Force force annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={22,-90})));
  Modelica.Mechanics.Translational.Components.Mass mass(m=10) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-18,-94})));
protected
  parameter Real cableLength0(fixed=false);
initial equation
  cableLength0 =Modelica.Math.Vectors.norm(jointUPSDeltaFlange.frame_b.r_0 - jointUPSDeltaFlange.frame_a.r_0);
equation
  connect(jointUPSDeltaFlange.frame_a, fixed.frame_b) annotation (Line(
      points={{-58,-18},{-58,42},{-88,42}},
      color={95,95,95},
      thickness=0.5));
  connect(fixed1.flange, springDamper.flange_a) annotation (Line(points={{-46,32},{-22,32},{-22,-28},{-12,-28}}, color={0,127,0}));
  connect(const.y, force.f) annotation (Line(points={{22,-45},{22,-78}}, color={0,0,127}));
  connect(springDamper.flange_b, jointUPSDeltaFlange.axis) annotation (Line(points={{-12,-48},{-24,-48},{-24,-46},{-38,-46}}, color={0,127,0}));
  connect(jointUPSDeltaFlange.bearing, springDamper.flange_a) annotation (Line(points={{-38,-30},{-26,-30},{-26,-28},{-12,-28}}, color={0,127,0}));
  connect(force.flange, mass.flange_a) annotation (Line(points={{22,-100},{2,-100},{2,-104},{-18,-104}}, color={0,127,0}));
  connect(springDamper.flange_b, mass.flange_b) annotation (Line(points={{-12,-48},{-12,-67},{-18,-67},{-18,-84}}, color={0,127,0}));
  connect(jointUPSDeltaFlange.frame_b, body.frame_a) annotation (Line(
      points={{-58,-58},{-56,-58},{-56,-76},{-56,-76}},
      color={95,95,95},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end JointUPSDeltaFlangeTest;
