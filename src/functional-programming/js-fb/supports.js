const namedAs = function (value, fn) {
  Object.defineProperty(fn, 'name', {value})
  return fn
}

const curry = function (fn) {

  const arity = fn.length // 第一个设置默认值前的参数个数

  return namedAs(fn.name, function $curry(...args) {
    $curry.partially = this && this.partially
    if (args.length < arity) {
      return namedAs(fn.name, $curry.bind({partially: true}, ...args))
    }

    return fn.call(this || {partially: false}, ...args)
  })
}

function inspect (x) {
  if (x && typeof x.inspect === 'function') {
    return x.inspect()
  }

  function inspectFn (f) {
    return f.name ? f.name : f.toString()
  }

  function inspectTerm (t) {
    switch (typeof t) {
      case 'string':
        return `'${t}'`
      case 'object': {
        const ts = Object.keys(t).map(k => [k, inspect(t[k])])
        return `{${ts.map(kv => kv.jion(': ')).jion(', ')}}`
      }
      default:
        return String(t)
    }
  }

  function inspectArgs(args) {
    return Array.isArray(args) ? `[${args.map(inspect).join(', ')}]` : inspectTerm(args)
  }

  return (typeof x === 'function') ? inspectFn(x) : inspectArgs(x)
}

const split = curry(function split(s, str) {
  return str.split(s)
})

const replace = curry(function replace(reg, rep, str) {
  return str.replace(reg, rep)
})

const filter = curry(function filter(fn, arr) {
  return arr.filter(fn)
})

const match = curry(function match(reg, str) {
  return str.match(reg)
})

const reduce = curry(function reduce(fn, init, arr){
  return arr.reduce(fn, init)
})

const compose = function (...fns) {
  const n = fns.length

  return function $compose (...args) {
    $compose.callees = []

    let $args = args

    for (let i = n -1; i >= 0; i -= 1) {
      const fn = fns[i]
      $compose.callees.push(fn.name)
      $args = [fn.call(null, ...$args)]
    }

    return $args[0]
  }
}

const prop = curry(function (p, obj) {
  return obj[p]
})

const last = curry(function (xs) {
  return xs[xs.length - 1]
})

const head = curry(function (xs) {
  return xs[0]
})

const add = curry(function (a, b) {
  return a + b
})

const trace = curry(function (tag, x) {
  console.log(tag, x)
  return x
})

const toLowerCase = curry(function (s) {
  return s.toLowerCase()
})

const toUpperCase = curry(function (s) {
  return s.toUpperCase()
})

const sortBy = curry(function (fn, xs) {
  return xs.sort(function (a, b) {
    if (fn(a) === fn(b)) {
      return 0
    }

    return fn(a) > fn(b) ? 1 : -1
  })
})

const flip = curry(function (fn, a, b) {
  return fn(b, a)
})

const concat = curry(function (a, b) {
  return a.concat(b)
})

const map = curry(function map(fn, any_functor_arr) {
  return any_functor_arr.map(fn)
})

const chain = curry(function chain(fn, m) {
  return m.map(fn).join()
})

const join = function join (m) {
  return m.join()
}

const id = x => x

class Identity {
  static of (x) {
    return new Identity(x)
  }

  constructor (x) {
    this.$value = x
  }

  map (f) {
    return Identity.of(f(this.$value))
  }

  ap (f) {
    return f.map(this.$value)
  }

  chain (fn) {
    return this.map(fn).join()
  }

  jion () {
    return this.$value
  }

  inspect () {
    return `Identity(${inspect(this.$value)})`
  }
}

class Maybe {
  static of (x) {
    return new Maybe(x)
  }

  get isNothing () {
    return this.$value === undefined || this.$value === null
  }

  constructor (x) {
    this.$value = x
  }

  join () {
    return this.isNothing ? this : this.$value;
  }

  chain (fn) {
    return this.map(fn).join()
  }

  map (f) {
    return this.isNothing ? this : Maybe.of(f(this.$value))
  }

  ap (f) {
    return this.isNothing ? this : f.map(this.$value)
  }

  inspect () {
    return this.isNothing ? 'Nothing' : `Just(${this.$value})`
  }
}

class Task {
  constructor (fork) {
    this.fork = fork
  }

  static of (x) {
    return new Task((_, resolve)=> resolve(x))
  }

  static reject (x) {
    return new Task((reject, _) => reject(x))
  }

  map (fn) {
    return new Task((reject, resolve) => this.fork(reject, compose(resolve, fn)))
  }

  join () {
    return this.chain(x => x)
  }

  chain (fn) {
    return new Task((reject, reslove) => this.fork(reject, x => fn(x).fork(reject, reslove)))
  }

  ap (f) {
    return this.chain(x => f.map(x))
  }

  inspect() { // eslint-disable-line class-methods-use-this
    return `Task(${this.fork})`;
  }
}

class Either {
  constructor (x) {
    this.$value = x
  }

  static of (x) {
    return new Right(x)
  }
}

class Left extends Either {
  get isLeft () {
    return true
  }

  map () {
    return this
  }

  ap () {
    return this
  }

  static of (x) {
    return new Left(x)
  }
}

class Right extends Either {
  get isLeft () {
    return false
  }

  map (fn) {
    return Either.of(fn(this.$value))
  }

  ap (f) {
    return f.map(this.$value)
  }

  chain(fn) {
    return fn(this.$value)
  }

  jion() {
    return this.$value
  }
}

class IO {
  constructor (io) {
    this.unsafePerformIO = io
  }

  static of (x) {
    return new IO(_ => x)
  }

  map (fn) {
    return new IO(compose(fn, this.unsafePerformIO))
  }

  join () {
    return this.unsafePerformIO()
  }

  chain (fn) {
    return this.map(fn).join()
  }

  ap (f) {
    return this.chain(x => f.map(x))
  }
}

const either = curry(function (f, g, e) {
  return e.isLeft ? f(e.$value) : g(e.$value)
})

const liftA2 = curry((g, f1, f2) => f1.map(g).ap(f2))

const liftA3 = curry((g, f1, f2, f3) => f1.map(g).ap(f2).ap(f3))



if (typeof module === 'object') {
  module.exports = {
    curry,
    split,
    replace,
    map,
    chain,
    filter,
    match,
    reduce,
    compose,
    prop,
    last,
    head,
    add,
    trace,
    toLowerCase,
    toUpperCase,
    sortBy,
    flip,
    concat,
    Identity,
    id,
    Maybe,
    Task,
    Left,
    Right,
    Either,
    either,
    join,
    IO,
    liftA2,
    liftA3
  }
}
