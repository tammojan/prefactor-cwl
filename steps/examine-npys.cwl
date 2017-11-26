cwlVersion: v1.0
class: CommandLineTool
baseCommand: [singularity, exec, docker://kernsuite/base:3, python, /usr/lib/prefactor/scripts/examine_npys.py]

inputs:
  calsource:
    type: string
    inputBinding:
      position: 1

outputs:
  dtec:
    type: File
    outputBinding:
      glob: dtec_allsols.png

  dclock:
    type: File
    outputBinding:
      glob: dclock_allsols.png

  amp:
    type: File
    outputBinding:
      glob: amp_allsols.png


$namespaces:
  s: http://schema.org/
$schemas:
  - https://schema.org/docs/schema_org_rdfa.html


s:license: "https://mit-license.org/"
s:author:
  s:person.url: "http://orcid.org/0000-0002-6136-3724"
