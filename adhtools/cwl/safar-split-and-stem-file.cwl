#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow
inputs:
  stemmer:
    default: LIGHT10
    type:
      type: enum
      symbols:
      - KHOJA
      - LIGHT10
      - ISRI
      - MOTAZ
      - TASHAPHYNE
  txt_file: File
  cp: string
  split_regex_small:
    default: Milestone300
    type: string
outputs:
  xml_file:
    outputSource: merge-safar-xml-2/out_file
    type: File
steps:
  extract_metadata:
    run: extract_metadata.cwl
    in:
      in_file: txt_file
    out:
    - out_meta
    - out_txt
  split-text:
    run: split-text.cwl
    in:
      in_file: extract_metadata/out_txt
      regex: split_regex_small
    out:
    - out_files
  SafarStem:
    run: SafarStem.cwl
    in:
      cp: cp
      in_files: split-text/out_files
      stemmer: stemmer
    out:
    - out_files
  merge-safar-xml-2:
    run: merge-safar-xml.cwl
    in:
      in_files: SafarStem/out_files
    out:
    - out_file