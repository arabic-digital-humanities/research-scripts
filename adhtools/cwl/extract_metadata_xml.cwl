#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
baseCommand: ["python", "-m", "adhtools.extract_metadata_xml"]
requirements:
  EnvVarRequirement:
    envDef:
      LC_ALL: C.UTF-8
      LANG: C.UTF-8

inputs:
  in_dir:
    type: Directory
    inputBinding:
      position: 0

outputs:
  out_file:
    type: File
    outputBinding:
      glob: "metadata.csv"

