within CablesLib.OLD.JointUPS_mod;
model CableUPSFlangeTest2
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed annotation (Placement(transformation(extent={{-100,-30},{-80,-10}})));
  Modelica.Mechanics.MultiBody.Parts.Body body(r_CM={0,0,0}, m=1,
    r_0(fixed=true, start={1,0,0}),
    v_0(fixed=true),
    angles_fixed=true,
    w_0_fixed=true,
    useQuaternions=false)                                         annotation (Placement(transformation(extent={{192,-30},{212,-10}})));
  Modelica.Blocks.Sources.Sine     sine(
    amplitude=0.5,
    freqHz=1,
    offset=1)                                   annotation (Placement(transformation(extent={{-170,50},{-150,70}})));
  inner Modelica.Mechanics.MultiBody.World world(n(displayUnit="1") = {0,0,-1}) annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  JointUPS_mod.JointUPSDeltaFlange jointUPSDeltaFlange(
    n1_a={0,1,0},
    nAxis_ia={0,0,1},
    axisColor=if noEvent(bumpstopCable.tension) then {255,0,0} else {0,255,0}) annotation (Placement(transformation(extent={{-24,-40},{16,0}})));
  CablesUPS.Cable1D bumpstopCable(
    stateSelect=StateSelect.prefer,
    s_nominal=1,
    s_rel(start=0.1, fixed=false)) annotation (Placement(transformation(extent={{-12,50},{8,70}})));
  Modelica.Mechanics.Translational.Components.Mass mass_a(m=0.01) annotation (Placement(transformation(extent={{-104,50},{-84,70}})));
  Modelica.Mechanics.Translational.Sources.Position position(useSupport=false)
                                                             annotation (Placement(transformation(extent={{-132,50},{-112,70}})));
  Modelica.Mechanics.Translational.Components.Mass mass_b(m=0.01) annotation (Placement(transformation(extent={{46,50},{66,70}})));
  Modelica.Mechanics.Translational.Sensors.RelPositionSensor relPositionSensor annotation (Placement(transformation(extent={{-6,94},{14,74}})));
protected
  parameter Real cableLength0(fixed=false);
initial equation
  cableLength0 =Modelica.Math.Vectors.norm(jointUPSDeltaFlange.frame_b.r_0 - jointUPSDeltaFlange.frame_a.r_0);
//   mass_b.s - mass_a.s = cableLength0;
equation
  connect(jointUPSDeltaFlange.frame_a, fixed.frame_b) annotation (Line(
      points={{-24,-20},{-80,-20}},
      color={95,95,95},
      thickness=0.5));
  connect(jointUPSDeltaFlange.frame_b, body.frame_a) annotation (Line(
      points={{16,-20},{192,-20}},
      color={95,95,95},
      thickness=0.5));
  connect(mass_a.flange_a, position.flange) annotation (Line(points={{-104,60},{-112,60}}, color={0,127,0}));
  connect(position.s_ref, sine.y) annotation (Line(points={{-134,60},{-149,60}}, color={0,0,127}));
  connect(bumpstopCable.flange_b, mass_b.flange_a) annotation (Line(points={{8,60},{46,60}}, color={0,127,0}));
  connect(mass_a.flange_b, bumpstopCable.flange_a) annotation (Line(points={{-84,60},{-12,60}}, color={0,127,0}));
  connect(relPositionSensor.flange_a, bumpstopCable.flange_a) annotation (Line(points={{-6,84},{-12,84},{-12,60}}, color={0,127,0}));
  connect(relPositionSensor.flange_b, bumpstopCable.flange_b) annotation (Line(points={{14,84},{18,84},{18,60},{8,60}}, color={0,127,0}));
  connect(relPositionSensor.s_rel, bumpstopCable.cableLength) annotation (Line(points={{4,95},{4,100},{-20,100},{-20,67},{-12,67}}, color={0,0,127}));
  connect(jointUPSDeltaFlange.bearing, mass_a.flange_b) annotation (Line(points={{-12,0},{-12,12},{-48,12},{-48,60},{-84,60}}, color={0,127,0}));
  connect(jointUPSDeltaFlange.axis, mass_b.flange_a) annotation (Line(points={{4,0},{4,12},{30,12},{30,58},{38,58},{38,60},{46,60}}, color={0,127,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end CableUPSFlangeTest2;
