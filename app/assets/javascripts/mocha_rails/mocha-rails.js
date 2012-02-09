mocha.setup('bdd');
onload = function() {
  var runner = mocha.run();
  runner.globals(['testExports']);
};