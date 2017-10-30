#$ LOFARROOT=/usr /usr/bin/calibrate-stand-alone
#calibrate-stand-alone (top-level calibration script, stand-alone version) Mon Oct 30 14:22:41 SAST 2017
#
#usage:
#  calibrate-stand-alone [options] <observation> <parset> [catalog]
#
#arguments:
#  <observation>        observation (MS)
#  <parset>             parset describing the reduction strategy
#  [catalog]            catalog file (in makesourcedb format)
#                         either catalog or --sourcedb must be specified
#
#options:
#  -h, --help           print usage information and exit
#  -v, --verbose        be verbose
#  -f, --force          expands to --replace-parmdb, --replace-sourcedb
#  -n, --no-columns     do not add CASA imaging columns to the MS
#  --dry-run            print commands but do not start any processes
#  --sourcedb           path to a user specified source database
#                       (implies --replace-sourcedb)
#  --sourcedb-name      basename for the source database (default: sky)
#  --replace-sourcedb   replace the source database
#  --parmdb             path to a user specified parameter database
#                       (implies --replace-parmdb)
#  --parmdb-name        basename for the parameter database (default:
#                       instrument)
#  --replace-parmdb     replace the parameter database
#  -t OR --numthreads   set the number of threads to use (default: 1)

cwlVersion: v1.0
class: CommandLineTool
baseCommand: [/usr/bin/calibrate-stand-alone]
requirements:
  EnvVarRequirement:
    envDef:
      LOFARROOT: /usr
requirements:
  - class: InlineJavascriptRequirement

inputs:
  observation:
    type: Directory
    inputBinding:
      position: 1

  parset:
    type: File
    inputBinding:
      position: 2

  catalog:
    type: File
    inputBinding:
      position: 3

  numthreads:
    type: int?
    inputBinding:
      prefix: --numthreads

outputs:
  msout:
    type: Directory
    outputBinding:
      glob: "$( inputs.observation.basename )"