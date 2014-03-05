//= require underscore
window.namespace = _.memoize(function(ns) {
  ns = ns || '';
  var parts = ns.split('.');
  var current = window;
  for (var i=0,len=parts.length; i < len; i++) {
    var part = parts[i];
    if (_.isUndefined(current[part])) {
      current[part] = {};
    }
    current = current[part];
  }
  return current;
});