// Converted to vanilla JS
// For original ES6 code, see: https://codepen.io/tutsplus/pen/BaVyNaw
"use strict";

function _createForOfIteratorHelper(r, e) { var t = "undefined" != typeof Symbol && r[Symbol.iterator] || r["@@iterator"]; if (!t) { if (Array.isArray(r) || (t = _unsupportedIterableToArray(r)) || e && r && "number" == typeof r.length) { t && (r = t); var _n = 0, F = function F() {}; return { s: F, n: function n() { return _n >= r.length ? { done: !0 } : { done: !1, value: r[_n++] }; }, e: function e(r) { throw r; }, f: F }; } throw new TypeError("Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); } var o, a = !0, u = !1; return { s: function s() { t = t.call(r); }, n: function n() { var r = t.next(); return a = r.done, r; }, e: function e(r) { u = !0, o = r; }, f: function f() { try { a || null == t["return"] || t["return"](); } finally { if (u) throw o; } } }; }
function _unsupportedIterableToArray(r, a) { if (r) { if ("string" == typeof r) return _arrayLikeToArray(r, a); var t = {}.toString.call(r).slice(8, -1); return "Object" === t && r.constructor && (t = r.constructor.name), "Map" === t || "Set" === t ? Array.from(r) : "Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t) ? _arrayLikeToArray(r, a) : void 0; } }
function _arrayLikeToArray(r, a) { (null == a || a > r.length) && (a = r.length); for (var e = 0, n = Array(a); e < a; e++) n[e] = r[e]; return n; }
var tableWrapper = document.querySelector(".table-wrapper");
var switchInputs = document.querySelectorAll(".switch-wrapper input");
var prices = tableWrapper.querySelectorAll(".price");
var descriptions = tableWrapper.querySelectorAll(".description");
var toggleClass = "hide";
var _iterator = _createForOfIteratorHelper(switchInputs),
  _step;
try {
  var _loop = function _loop() {
    var switchInput = _step.value;
    switchInput.addEventListener("input", function () {
      var _iterator2 = _createForOfIteratorHelper(prices),
        _step2;
      try {
        for (_iterator2.s(); !(_step2 = _iterator2.n()).done;) {
          var price = _step2.value;
          price.classList.add(toggleClass);
        }
      } catch (err) {
        _iterator2.e(err);
      } finally {
        _iterator2.f();
      }
      var activePrices = tableWrapper.querySelectorAll(".price.".concat(switchInput.id));
      var _iterator3 = _createForOfIteratorHelper(activePrices),
        _step3;
      try {
        for (_iterator3.s(); !(_step3 = _iterator3.n()).done;) {
          var activePrice = _step3.value;
          activePrice.classList.remove(toggleClass);
        }
      } catch (err) {
        _iterator3.e(err);
      } finally {
        _iterator3.f();
      }
      var _iterator4 = _createForOfIteratorHelper(descriptions),
        _step4;
      try {
        for (_iterator4.s(); !(_step4 = _iterator4.n()).done;) {
          var description = _step4.value;
          description.classList.add(toggleClass);
        }
      } catch (err) {
        _iterator4.e(err);
      } finally {
        _iterator4.f();
      }
      var activeDescriptions = tableWrapper.querySelectorAll(".description.".concat(switchInput.id));
      var _iterator5 = _createForOfIteratorHelper(activeDescriptions),
        _step5;
      try {
        for (_iterator5.s(); !(_step5 = _iterator5.n()).done;) {
          var activeDescription = _step5.value;
          activeDescription.classList.remove(toggleClass);
        }
      } catch (err) {
        _iterator5.e(err);
      } finally {
        _iterator5.f();
      }
    });
  };
  for (_iterator.s(); !(_step = _iterator.n()).done;) {
    _loop();
  }
} catch (err) {
  _iterator.e(err);
} finally {
  _iterator.f();
}
