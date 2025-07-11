#!/usr/bin/env julia
using Pkg
Pkg.activate(joinpath(@__DIR__, ".."))      # activate the Project.toml one level up

using ArgParse, YAML, ImageProcessingPipeline

# 1. Define CLI args
s = ArgParseSettings()
@add_arg_table s begin
  "--input";  arg_type = String; required=true; help="input image path"
  "--output"; arg_type = String; required=true; help="output image path"
  "--config"; arg_type = String; default="config/default.yaml"; help="config YAML"
end
args = parse_args(s)

# 2. Load config
cfg = YAML.load_file(args["config"])
# e.g. if cfg["resize"] exists, you could call imresize(img, cfg["resize"])

# 3. Run the pipeline
process_image(args["input"], args["output"])
