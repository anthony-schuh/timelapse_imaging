module ImageProcessingPipeline

export process_image

using ImageIO, Images

"""
    process_image(input_path::AbstractString, output_path::AbstractString)

Load an image, apply transforms, and save the result.
"""
function process_image(input_path::AbstractString, output_path::AbstractString)
    img = load(input_path)
    # ▶ here’s where to add resizing, filtering, etc.
    save(output_path, img)
end

end # module
