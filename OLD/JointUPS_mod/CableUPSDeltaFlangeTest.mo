within CablesLib.OLD.JointUPS_mod;
model CableUPSDeltaFlangeTest
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed annotation (Placement(transformation(extent={{-100,-30},{-80,-10}})));
  Modelica.Mechanics.MultiBody.Parts.Body body(r_CM={0,0,0}, m=1,
    r_0(fixed=true, start={1,0,0}),
    v_0(fixed=true),
    angles_fixed=true,
    w_0_fixed=true,
    useQuaternions=false)                                         annotation (Placement(transformation(extent={{60,-30},{80,-10}})));
  Modelica.Blocks.Sources.Sine     sine(
    amplitude=0.5,
    freqHz=1,
    offset=1)                                   annotation (Placement(transformation(extent={{-158,68},{-138,88}})));
  JointUPS_mod.JointUPSDeltaFlange jointUPSDeltaFlange(
    n1_a={0,1,0},
    nAxis_ia={0,0,1},
    axisColor=if noEvent(bumpstopCable.tension) then {255,0,0} else {0,255,0}) annotation (Placement(transformation(extent={{-24,-40},{16,0}})));
  CablesUPS.Cable1D bumpstopCable(
    stateSelect=StateSelect.prefer,
    s_nominal=1,
    s_rel(start=0.1, fixed=false)) annotation (Placement(transformation(extent={{-12,50},{8,70}})));
  Modelica.Mechanics.Translational.Components.Mass mass(m=0.01)
                                                             annotation (Placement(transformation(extent={{-92,68},{-72,88}})));
  Modelica.Mechanics.Translational.Sources.Position position(useSupport=false)
                                                             annotation (Placement(transformation(extent={{-120,68},{-100,88}})));
  Modelica.Mechanics.Translational.Components.Mass mass1(m=0.01)
                                                             annotation (Placement(transformation(extent={{46,68},{66,88}})));
  Modelica.Mechanics.Translational.Sensors.RelPositionSensor relPositionSensor annotation (Placement(transformation(extent={{-42,68},{-22,88}})));
protected
  parameter Real cableLength0(fixed=false);
initial equation
  cableLength0 =Modelica.Math.Vectors.norm(jointUPSDeltaFlange.frame_b.r_0 - jointUPSDeltaFlange.frame_a.r_0);
equation
  connect(jointUPSDeltaFlange.frame_a, fixed.frame_b) annotation (Line(
      points={{-24,-20},{-80,-20}},
      color={95,95,95},
      thickness=0.5));
  connect(jointUPSDeltaFlange.frame_b, body.frame_a) annotation (Line(
      points={{16,-20},{60,-20}},
      color={95,95,95},
      thickness=0.5));
  connect(mass.flange_a, position.flange) annotation (Line(points={{-92,78},{-100,78}}, color={0,127,0}));
  connect(position.s_ref, sine.y) annotation (Line(points={{-122,78},{-137,78}}, color={0,0,127}));
  connect(bumpstopCable.flange_a, jointUPSDeltaFlange.bearing) annotation (Line(points={{-12,60},{-12,0}}, color={0,127,0}));
  connect(bumpstopCable.flange_b, jointUPSDeltaFlange.axis) annotation (Line(points={{8,60},{8,0},{4,0}}, color={0,127,0}));
  connect(mass.flange_b, relPositionSensor.flange_a) annotation (Line(points={{-72,78},{-42,78}}, color={0,127,0}));
  connect(relPositionSensor.flange_b, mass1.flange_a) annotation (Line(points={{-22,78},{46,78}}, color={0,127,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end CableUPSDeltaFlangeTest;
