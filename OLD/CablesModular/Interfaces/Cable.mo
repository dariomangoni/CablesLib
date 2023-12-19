within CablesLib.OLD.CablesModular.Interfaces;
connector Cable
  Modelica.SIunits.Position pos[3] "Position of the connection point";
  Modelica.SIunits.Position s "Unwounded length of the cable";
  flow Modelica.SIunits.Force f[3] "Force acting on the cable";
  flow Modelica.SIunits.Force T "Tension acting on the cable";
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end Cable;
