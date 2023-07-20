use GpuDiagnostics;

use GpuTestCommon;


config const start = 1;
config const end = 10;

startGpuDiagnostics();
on here.gpus[0] {
  var a: [start..end] int;
  var value = 20;

  // one array
  forall  elem in a { elem += 10;          } writeln(a);
  forall  elem in a { elem += value;       } writeln(a);
  foreach elem in a { elem += 10;          } writeln(a);
  foreach elem in a { elem += value;       } writeln(a);
}
stopGpuDiagnostics();
verifyLaunches(um=4, aod=5);
