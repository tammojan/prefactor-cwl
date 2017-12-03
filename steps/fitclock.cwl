cwlVersion: v1.0
class: CommandLineTool
baseCommand: [python, /usr/lib/prefactor/scripts/fit_clocktec_initialguess_losoto.py]

hints:
  DockerRequirement:
      dockerImageId: kernsuite/prefactor

inputs:
  globaldbname:
    type: File
    doc: "input h5 parm file"
    inputBinding:
      position: 1

arguments:
 # calsource 
 - valueFrom: "fitclock"
   position: 2

 # ncpus
 - valueFrom: $(runtime.cores)
   position: 3

outputs:
  dclock_1st:
    type: File
    outputBinding:
      glob: fitted_data_dclock_fitclock_1st.npy

  dTEC_1st:
    type: File
    outputBinding:
      glob: fitted_data_dTEC_fitclock_1st.npy
        
  dclock_1st_sm:
    type: File
    outputBinding:
      glob: fitted_data_dclock_fitclock_1st.sm.npy

  dTEC_1st_sm:
    type: File
    outputBinding:
      glob: fitted_data_dTEC_fitclock_1st.sm.npy



$namespaces:
  s: http://schema.org/
$schemas:
  - https://schema.org/docs/schema_org_rdfa.html

s:license: "https://mit-license.org/"
s:author:
  s:person.url: "http://orcid.org/0000-0002-6136-3724"
