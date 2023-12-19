within CablesLib.OLD;
model CableUPS
  extends Modelica.Mechanics.MultiBody.Interfaces.PartialTwoFrames;
  parameter Boolean isConstantLength = false;
  parameter Boolean freeLength_fixed = false annotation (
    Evaluate = true);
  parameter Modelica.SIunits.Length freeLength_start = distance_start annotation (
    Dialog(enable = freeLength_fixed),
    Evaluate = true);
  parameter Boolean fix_a = false;
  parameter Boolean fix_b = false;
  parameter Modelica.SIunits.LinearDensity linDensity(displayUnit="g/m") = 30e-3;
  parameter Boolean s_a_fixed = false;
  parameter Boolean s_b_fixed = false;
  parameter Boolean v_a_fixed = false;
  parameter Boolean v_b_fixed = false;

  OLD.JointUPS_mod.JointUPSDeltaFlange jointUPSDeltaFlange(
    n1_a={0,1,0},
    nAxis_ia={0,0,1},
    axisColor=if noEvent(bumpstopCableCoupled.tension) then {255,0,0} else {0,255,0}) annotation (Placement(transformation(extent={{-20,-20},{20,20}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_a flange_a if not fix_a annotation (Placement(transformation(extent={{-110,70},{-90,90}}), visible=not fix_a));
  Modelica.Mechanics.Translational.Interfaces.Flange_b flange_b if not fix_b annotation (Placement(transformation(extent={{90,70},{110,90}}), visible=not fix_b));
  Modelica.SIunits.Length freeLength(start = freeLength_start, fixed=if fix_a and fix_b then true else false);
  CablesFlange.MassVariable massVariable_a(s(start=0, fixed=if fix_a then true else s_a_fixed), v(fixed=if fix_a then true else v_a_fixed)) annotation (Placement(transformation(extent={{-72,70},{-52,90}})));
  CablesFlange.MassVariable massVariable_b(s(start=freeLength_start, fixed=if fix_b then true else s_b_fixed), v(fixed=if fix_b then true else v_b_fixed)) annotation (Placement(transformation(extent={{40,70},{60,90}})));
  Modelica.Blocks.Math.Gain gain(k=linDensity/2) annotation (Placement(transformation(extent={{-20,104},{0,124}})));
  CablesFlange.CableCoupled bumpstopCableCoupled(
    fix_a=fix_a,
    fix_b=fix_b,
    k=1e3,
    c=1e2) annotation (Placement(transformation(extent={{-8,62},{12,82}})));

  Modelica.Mechanics.Translational.Sensors.RelPositionSensor cableLength annotation (Placement(transformation(extent={{-62,124},{-42,144}})));
protected
  parameter Real distance_start(fixed=false);
//   parameter Real s_a_start(fixed=false);
//   parameter Real s_b_start(fixed=false);
initial equation
  if fix_b or fix_a and not (fix_a and fix_b) then
    massVariable_b.s = massVariable_a.s + freeLength_start;
  end if;
  distance_start = Modelica.Math.Vectors.norm(frame_b.r_0 - frame_a.r_0);
equation
  jointUPSDeltaFlange.bearing.s = 0;
  freeLength = cableLength.s_rel;
  assert(freeLength>0, "Cable stuck into Joint");
  connect(frame_a, jointUPSDeltaFlange.frame_a) annotation (Line(
      points={{-100,0},{-20,0}},
      color={95,95,95},
      thickness=0.5));
  connect(jointUPSDeltaFlange.frame_b, frame_b) annotation (Line(
      points={{20,0},{100,0}},
      color={95,95,95},
      thickness=0.5));
  connect(gain.y, massVariable_b.m) annotation (Line(points={{1,114},{50,114},{50,90}},  color={0,0,127}));
  connect(gain.y, massVariable_a.m) annotation (Line(points={{1,114},{26,114},{26,92},{-62,92},{-62,90}},    color={0,0,127}));
  connect(cableLength.s_rel, gain.u) annotation (Line(points={{-52,123},{-52,114},{-22,114}}, color={0,0,127}));
  connect(cableLength.flange_a, massVariable_a.flange_a) annotation (Line(points={{-62,134},{-80,134},{-80,80},{-72,80}}, color={0,127,0}));
  connect(flange_a, massVariable_a.flange_a) annotation (Line(points={{-100,80},{-72,80}}, color={0,127,0}));
  connect(cableLength.flange_b, massVariable_b.flange_b) annotation (Line(points={{-42,134},{60,134},{60,80}}, color={0,127,0}));
  connect(flange_b, massVariable_b.flange_b) annotation (Line(points={{100,80},{60,80}}, color={0,127,0}));
  connect(jointUPSDeltaFlange.bearing, bumpstopCableCoupled.flange_a) annotation (Line(points={{-8,20},{-8,72}}, color={0,127,0}));
  connect(bumpstopCableCoupled.flange_b, jointUPSDeltaFlange.axis) annotation (Line(points={{12,72},{12,20},{8,20}}, color={0,127,0}));
  connect(massVariable_a.flange_b, bumpstopCableCoupled.flangeCable_a) annotation (Line(points={{-52,80},{-30,80},{-30,81},{-8,81}}, color={0,127,0}));
  connect(bumpstopCableCoupled.flangeCable_b, massVariable_b.flange_a) annotation (Line(points={{12,81},{26,81},{26,80},{40,80}}, color={0,127,0}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false), graphics={  Rectangle(lineColor = {28, 108, 200}, extent = {{-100, 100}, {100, -100}}), Text(
          extent={{-100,-60},{100,-100}},
          lineColor={0,0,0},
          textString="%name")}),
    Diagram(coordinateSystem(preserveAspectRatio = false)));
end CableUPS;
