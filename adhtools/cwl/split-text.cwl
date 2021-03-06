#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
baseCommand: ["python", "-m", "adhtools.split_text"]

doc: |
  Split text in parts -> Not used anymore, so can be deleted?

requirements:
  EnvVarRequirement:
    envDef:
      LC_ALL: C.UTF-8
      LANG: C.UTF-8

inputs:
  in_file:
    type: File
    inputBinding:
      position: 1
  regex:
    type:
      type: array
      items: string
      inputBinding:
        prefix: --regex=
        separate: False
    inputBinding:
      position: 2

outputs:
  out_files:
    type: File[]
    outputBinding:
      glob: "*.txt"
