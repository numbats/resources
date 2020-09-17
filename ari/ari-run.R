source("ari/ari-secret.R")

# Set up your keys and your region here.
aws.polly::list_voices("en-AU")

ari_narrate(script = "ari/ari-example.Rmd",
            slides = "ari/ari-example.html",
            output = "ari/ari-video-nicole.mp4",
            voice = "Nicole",
            # voice = "Russell",
            subtitles = TRUE,
            # this needs to be "iterative" or it won't advance the slides
            # also each slide needs to have a script or the video will be out
            # of sync. Including the title slide!
            capture_method = "iterative")

# Perhaps add a function to help check if there are comments for each slide

path <- "ari/ari-example.Rmd"
xfun::with_ext(path, "html")


ari_narrate_auto <- function(slides, render = TRUE, voice = "Nicole"){
  
  if (render) {
    rmarkdown::render(input = slides)
  }
  
  ari_narrate(script = slides,
              slides = xfun::with_ext(slides, "html"),
              output =xfun::with_ext(slides, "mp4"),
              voice = voice,
              subtitles = TRUE,
              # this needs to be "iterative" or it won't advance the slides
              # also each slide needs to have a script or the video will be out
              # of sync. Including the title slide!
              capture_method = "iterative")
}

ari_narrate_auto("ari/ari-example.Rmd") 
