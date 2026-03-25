[![Moose version](https://img.shields.io/badge/Moose-10-%23aac9ff.svg)](https://modularmoose.org/)
[![Moose version](https://img.shields.io/badge/Moose-11-%23aac9ff.svg)](https://github.com/moosetechnology/Moose)
![Build Info](https://github.com/moosetechnology/Famix-ExecutionFlow/workflows/CI/badge.svg)
[![Coverage Status](https://coveralls.io/repos/github/moosetechnology/Famix-ExecutionFlow/badge.svg?branch=main)](https://coveralls.io/github/moosetechnology/Famix-ExecutionFlow?branch=main)

# Famix-ExecutionFlow

Metamodel to represent static or dynamic callgraphs.
- Travel the graph along XPath axes: ancestors, descendants, preceding and following siblings.
- Represent indirect calls, where the path between two calls is unknown.
- Represent values used in calls with [Famix-Value](https://github.com/moosetechnology/Famix-Value): receiver, arguments, and result.


## Installation

Standalone:
```st
Metacello new
  githubUser: 'moosetechnology' project: 'Famix-ExecutionFlow' commitish: 'main' path: 'src';
  baseline: 'FamixExecutionFlow';
  onConflictUseIncoming;
  load
```

As a dependency:
```st
spec
  baseline: 'FamixExecutionFlow'
  with: [ spec repository: 'github://moosetechnology/Famix-ExecutionFlow:main/src' ]
```

### With Values

Standalone:
```st
Metacello new
  githubUser: 'moosetechnology' project: 'Famix-ExecutionFlow' commitish: 'main' path: 'src';
  baseline: 'FamixExecutionFlow';
  onConflictUseIncoming;
  load: 'value'
```

As a dependency:
```st
spec baseline: 'FamixExecutionFlow' with: [
  spec
    repository: 'github://moosetechnology/Famix-ExecutionFlow:main/src';
    loads: 'value' ]
```
