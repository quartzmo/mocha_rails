mocha.setup('bdd');
chai.should(); // Adds should method to Object's prototype.
expect = chai.expect;
onload = function() {
  var runner = mocha.run();
  //runner.globals(['testExports']);
};