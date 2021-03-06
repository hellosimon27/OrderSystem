﻿
/*
    jQuery加减数字插件
    作者：metro-liang
    时间：2015-10-16
    版本：v1.0
*/

/*
  参数：value:默认值
        min:允许的最小值    
        max:允许的最大值  
        step:增减度
*/
; (function ($) {
  $.fn.extend({
    spinner: function (options) {
      return this.each(function () {
        var defaults = {
          value: 1,
          min: 1,
          max: 100,
          step: 1
        };
        var _this = $(this);

        var opts = $.extend(defaults, options);

        opts.step = _this.data("step") != null ? _this.data("step") : opts.step;
        opts.min = _this.data("min") != null ? _this.data("min") : opts.min;
        opts.max = _this.data("max") != null ? _this.data("max") : opts.max;
        opts.value = _this.val() != "" ? _this.val() : opts.value;
        if (opts.value > opts.max || opts.value < opts.min) {
          opts.value = opts.max;
        }
        var container = $('<span></span>').addClass('spin-text');
        var textField = _this.addClass('spin-val').css("ime-mode", "Disabled").keypress(function () {
          return (/[\d]/.test(String.fromCharCode(event.keyCode)));
        }).bind("copy cut paste", function (e) {
          return false;
        });
        var decreaseBtn = $('<a href="javascript:void(0)">-</a>').click(function () { changeValue(-1) });
        var increaseBtn = $('<a href="javascript:void(0)">+</a>').click(function () { changeValue(1) });
        textField.before(decreaseBtn).after(increaseBtn);

        textField.add(increaseBtn).add(decreaseBtn).wrapAll(container);

        function changeValue(d) {
          var value = parseInt(textField.val());
          if (isNaN(value)) {
            value = opts.min;
          }
          var _val = value + d * opts.step;

          if (_val <= opts.max && _val >= opts.min) {
            value = _val;
          }
          textField.val(value);
        }
      });
    }
  });

})(jQuery);

