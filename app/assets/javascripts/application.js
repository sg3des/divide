// Generated by CoffeeScript 1.7.1
var check, chis_array, chis_val, clearinput, countdown, create, cval, get, intervalTime, level, loose, maskznam, numpad, point, reducefun, reduceresult, restart, score, scoretime, shuffle, slogan, start, znam_array, znam_val, zval;

znam_val = 0;

chis_val = 0;

cval = [];

zval = [];

znam_array = [];

chis_array = [];

level = 0;

point = 0;

score = 0;

intervalTime = setInterval('', 1000);

slogan = ['get ready, rookie!', 'ho ho ho, are you sure you`re ready?', 'ok, now welcome to the MATHELL!!!', 'Congratulations! you are on the first circle of MATHELL', 'the second circle! tremble!', 'the third circle! so MATHELLISH!', 'the fourth circle! Uhh it has become too hot!', 'the fifth circle! Are you still so sure?', 'the sixth circle! stop until it`s too late', 'the seventh circle! make yourself mathellishly rageful for surviving', 'Guru of the divine perpetuity of MATHELL!', 'MATHELL is just a game made you godlike! HO HO HO!!!'];

start = function() {
  var actiondiv, actionval, cmin, content, first, fourth, i, second, third, zmax, zmin, _fn, _fn1, _i, _j, _ref, _ref1;
  point = 11;
  scoretime();
  get("content").innerHTML = '';
  get("znamenatel").className = 'input';
  get("znamenatel").value = '';
  get("chislitel").className = 'input';
  get("chislitel").value = '';
  chis_array = [];
  znam_array = [];
  level += 1;
  get('level').innerHTML = level;
  zmin = 4;
  zmax = 10 + level;
  cmin = 2;
  if (level <= 10) {
    znam_val = Math.floor(Math.random() * (zmax - zmin)) + zmin;
    chis_val = Math.floor(Math.random() * (znam_val - cmin)) + cmin;
    first = Math.floor(Math.random() * (chis_val - cmin)) + 1;
    second = chis_val - first;
    cval = [first, second];
    zval = [znam_val, znam_val];
    actionval = ['+'];
    intervalTime = setInterval(scoretime, 1000);
  }
  if ((10 < level && level <= 20)) {
    znam_val = Math.floor(Math.random() * (zmax - zmin)) + zmin;
    chis_val = Math.floor(Math.random() * (znam_val - cmin)) + cmin;
    first = Math.floor(Math.random() * (chis_val - cmin)) + 1;
    second = Math.floor(Math.random() * (first - cmin)) + 1;
    third = chis_val - first - second;
    cval = [first, second, third];
    zval = [znam_val, znam_val, znam_val];
    actionval = ['+', '+'];
    shuffle(cval);
    intervalTime = setInterval(scoretime, 1000);
  }
  if ((20 < level && level <= 30)) {
    znam_val = Math.floor(Math.random() * (zmax - zmin)) + zmin;
    chis_val = Math.floor(Math.random() * (zmax - cmin)) + cmin;
    first = Math.floor(Math.random() * (chis_val - cmin)) + 1;
    second = Math.floor(Math.random() * (first - cmin)) + 1;
    third = chis_val - first - second;
    cval = [first, second, third];
    zval = [znam_val, znam_val, znam_val];
    actionval = ['+', '+'];
    shuffle(cval);
    reducefun(cval, zval);
    intervalTime = setInterval(scoretime, 1000);
  }
  if ((30 < level && level <= 40)) {
    znam_val = Math.floor(Math.random() * (zmax - zmin)) + zmin;
    chis_val = Math.floor(Math.random() * (zmax - cmin)) + cmin;
    first = Math.floor(Math.random() * (chis_val - cmin)) + cmin;
    second = -Math.floor(Math.random() * (chis_val - cmin)) + cmin;
    third = chis_val - first - second;
    cval = [first, second, third];
    zval = [znam_val, znam_val, znam_val];
    actionval = ['+', '+'];
    shuffle(cval);
    reducefun(cval, zval);
    maskznam(cval, zval);
    intervalTime = setInterval(scoretime, 800);
  }
  if ((40 < level && level <= 50)) {
    znam_val = Math.floor(Math.random() * (zmax - zmin)) + zmin;
    chis_val = Math.floor(Math.random() * (zmax - cmin)) + cmin;
    first = Math.floor(Math.random() * (chis_val - cmin)) + cmin;
    second = -Math.floor(Math.random() * (chis_val - cmin)) + cmin;
    third = -Math.floor(Math.random() * (zmax - chis_val - cmin)) + cmin;
    fourth = chis_val - first - second - third;
    cval = [first, second, third, fourth];
    zval = [znam_val, znam_val, znam_val, znam_val];
    actionval = ['+', '+', '+'];
    shuffle(cval);
    reducefun(cval, zval);
    maskznam(cval, zval);
    intervalTime = setInterval(scoretime, 700);
  }
  if (50 < level) {
    znam_val = Math.floor(Math.random() * (zmax - zmin)) + zmin;
    chis_val = Math.floor(Math.random() * (zmax - cmin)) + cmin;
    first = Math.floor(Math.random() * (chis_val - cmin)) + cmin;
    second = -Math.floor(Math.random() * (chis_val - cmin)) + cmin;
    third = -Math.floor(Math.random() * (zmax - chis_val - cmin)) + cmin;
    fourth = chis_val - first - second - third;
    cval = [first, second, third, fourth];
    zval = [znam_val, znam_val, znam_val, znam_val];
    actionval = ['+', '+', '+'];
    shuffle(cval);
    reducefun(cval, zval);
    maskznam(cval, zval);
    intervalTime = setInterval(scoretime, 600);
  }
  console.log(chis_val, znam_val);
  get('slogan').innerHTML = slogan[Math.floor(level / 10)];
  content = get("content");
  actiondiv = create('actiondiv', '');
  content.appendChild(actiondiv);
  reduceresult(chis_val, znam_val);
  _fn = function(i) {
    var action;
    if (cval[i] < 0) {
      actionval[i] = "-";
    }
    action = create('action', actionval[i]);
    return actiondiv.appendChild(action);
  };
  for (i = _i = 0, _ref = actionval.length; 0 <= _ref ? _i < _ref : _i > _ref; i = 0 <= _ref ? ++_i : --_i) {
    _fn(i);
  }
  _fn1 = function(i) {
    var c1, column, z1;
    if (cval[i] < 0) {
      cval[i] = -cval[i];
    }
    column = create('column', '');
    c1 = create('input', cval[i]);
    z1 = create('input', zval[i]);
    content.appendChild(column);
    column.appendChild(c1);
    return column.appendChild(z1);
  };
  for (i = _j = 0, _ref1 = cval.length; 0 <= _ref1 ? _j < _ref1 : _j > _ref1; i = 0 <= _ref1 ? ++_j : --_j) {
    _fn1(i);
  }
};

maskznam = function(cval, zval) {
  var i, _i, _ref, _results;
  _results = [];
  for (i = _i = 0, _ref = cval.length; 0 <= _ref ? _i < _ref : _i > _ref; i = 0 <= _ref ? ++_i : --_i) {
    _results.push((function(i) {
      if (zval[i] === znam_val) {
        zval[i] = zval[i] * Math.floor(level / 20);
        cval[i] = cval[i] * Math.floor(level / 20);
      }
    })(i));
  }
  return _results;
};

scoretime = function() {
  get('point').innerHTML = point -= 1;
  get('time').innerHTML = parseInt(get('time').innerHTML) + 1;
  if (point < 0 && 0 > parseInt(get('score').innerHTML) + point) {
    return loose();
  }
};

loose = function() {
  console.log('loose');
  clearInterval(intervalTime);
  get('loose').className = 'loose1';
  return get('totalscore').innerHTML = get('time').innerHTML;
};

reducefun = function(cval, zval) {
  var i, _i, _ref, _results;
  _results = [];
  for (i = _i = 0, _ref = cval.length; 0 <= _ref ? _i < _ref : _i > _ref; i = 0 <= _ref ? ++_i : --_i) {
    _results.push((function(i) {
      var result;
      result = reduce(cval[i], zval[i]);
      cval[i] = result[0];
      zval[i] = result[1];
    })(i));
  }
  return _results;
};

restart = function() {
  get('time').innerHTML = 0;
  get('score').innerHTML = 0;
  get('loose').className = 'loose';
  znam_val = 0;
  chis_val = 0;
  cval = [];
  zval = [];
  level = 0;
  point = 0;
  score = 0;
  return countdown();
};

shuffle = function(array) {
  var counter, index, temp;
  counter = array.length;
  index = temp = (function() {
    var _results;
    _results = [];
    while (counter > 0) {
      index = Math.floor(Math.random() * counter);
      counter--;
      temp = array[counter];
      array[counter] = array[index];
      _results.push(array[index] = temp);
    }
    return _results;
  })();
  return array;
};

create = function(className, inner) {
  var div;
  div = document.createElement('div');
  div.className = className;
  div.innerHTML = inner;
  return div;
};

reduceresult = function(chis_val, znam_val) {
  var i, result, _fn, _i;
  console.log(chis_val, znam_val);
  result = reduce(chis_val, znam_val);
  _fn = function(i) {
    chis_array.push(result[0] * i);
    return znam_array.push(result[1] * i);
  };
  for (i = _i = 1; _i < 10; i = ++_i) {
    _fn(i);
  }
};

check = function(znam, chis) {
  var checkerror, checktimeout, num, _i, _j, _len, _len1;
  get("chislitel").className = 'input';
  for (_i = 0, _len = chis_array.length; _i < _len; _i++) {
    num = chis_array[_i];
    if (parseInt(chis) === num) {
      get("chislitel").className = 'inputCorrect';
    }
  }
  get("znamenatel").className = 'input';
  for (_j = 0, _len1 = znam_array.length; _j < _len1; _j++) {
    num = znam_array[_j];
    if (parseInt(znam) === num) {
      get("znamenatel").className = 'inputCorrect';
    }
  }
  clearTimeout(checktimeout);
  if (parseInt(znam) === znam_val && parseInt(chis) === chis_val || parseInt(znam) / parseInt(chis) === znam_val / chis_val) {
    clearInterval(intervalTime);
    get('score').innerHTML = parseInt(get('score').innerHTML) + parseInt(get('point').innerHTML);
    setTimeout(start, 500);
    return;
  }
  checkerror = function() {
    console.log('asd');
    get("chislitel").value = '';
    get("chislitel").className = 'inputIncorrect';
    get("znamenatel").value = '';
    get("znamenatel").className = 'inputIncorrect';
  };
  if (znam.length > 0 && chis.length > 0) {
    checktimeout = setTimeout(checkerror, 1000);
    console.log('asd');
  }
};

numpad = function(val) {
  console.log(val, get("chislitel").className);
  if (get("chislitel").className === 'input') {
    get('chislitel').value = get('chislitel').value + parseInt(val);
  } else {
    get('znamenatel').value = get('znamenatel').value + parseInt(val);
  }
  return check(get("znamenatel").value, get("chislitel").value);
};

clearinput = function(id) {
  get(id).value = '';
  return check(get("znamenatel").value, get("chislitel").value);
};

countdown = function() {
  var count, intervalCount;
  get('count').innerHTML = 1;
  get('countdown').className = 'countdown';
  count = function() {
    console.log(get('count').innerHTML);
    get('count').innerHTML = parseInt(get('count').innerHTML) - 1;
    if (parseInt(get('count').innerHTML) < 1) {
      clearInterval(intervalCount);
      get('countdown').className = 'countdown2';
      return start();
    }
  };
  intervalCount = setInterval(count, 1000);
};

window.onload = countdown;

get = function(id) {
  return document.getElementById(id);
};
