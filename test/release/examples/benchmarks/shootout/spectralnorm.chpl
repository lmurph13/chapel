/* The Computer Language Benchmarks Game
   https://salsa.debian.org/benchmarksgame-team/benchmarksgame/

   contributed by Lydia Duncan, Albert Sidelnik, and Brad Chamberlain
   derived from the GNU C version by Sebastien Loisel and the C# version
   by Isaac Gouy
*/

config const n = 500;           // the size of A (n x n), u and v (n-vectors)

proc main() {
  var tmp, u, v: [0..#n] real;

  u = 1.0;

  for 1..10 {
    multiplyAtAv(u, tmp, v);    // v = A^T*A*u
    multiplyAtAv(v, tmp, u);    // u = A^T*A*v
  }

  writef("%.9dr\n", sqrt(+ reduce (u*v) / + reduce (v*v)));
}

//
// Compute A-transpose * A * v ('AtAv').
//
proc multiplyAtAv(v, ref tmp, ref AtAv) {
  multiplyAv(v, tmp);
  multiplyAtv(tmp, AtAv);
}

//
// Compute A * v ('Av').
//
proc multiplyAv(v: [?Dv], ref Av: [?DAv]) {
  forall i in DAv with (ref Av) do
    Av[i] = + reduce (for j in Dv do A[i,j] * v[j]);
}

//
// Compute A-transpose * v ('Atv').
//
proc multiplyAtv(v: [?Dv], ref Atv: [?DAtv]) {
  forall i in DAtv with (ref Atv) do
    Atv[i] = + reduce (for j in Dv do A[j,i] * v[j]);
}

//
// Compute element i,j of the conceptually infinite matrix A.
//
inline proc A(i, j) {
  return 1.0 / ((((i+j) * (i+j+1)) / 2) + i + 1);
}
