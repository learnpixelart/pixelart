package main

import (
    "flag"
    "fmt"
    "image"
    // "image/color"
    "image/png"
		"image/draw"
    "log"
    "os"
    "strconv"
		"sort"
		"path/filepath"
)


// check if divod exists built-in - different name or such ??
func divmod(numerator, denominator int) (quotient, remainder int) {
	quotient  = numerator / denominator   // integer division, decimals are truncated
	remainder = numerator % denominator
	return
}



func main() {

	flag.Parse()
	args := flag.Args()

	glob            := args[0]
	cols, _         := strconv.Atoi( args[1] )
	rows, _         := strconv.Atoi( args[2] )
	width, _        := strconv.Atoi( args[3] )
	height, _       := strconv.Atoi( args[4] )

	outpath         := args[5]

  fmt.Println( glob, cols, rows, width, height, outpath )

	// check if returns sorted by default????
	//   make sure always sort - sort ourself for now
	//    return []string -> matches
  files, _ := filepath.Glob( glob + "/*.png" )

	fmt.Printf( "%d file(s)\n", len( files ) )
  // note - sorting is in-place!!!
  sort.Strings( files )


	composite := image.NewRGBA( image.Rect( 0, 0, cols*width,
		                                            rows*height ) )


	for i, file := range files {

		fmt.Printf( "==> reading [%d] %s...\n", i, file )

		f, err := os.Open( file )
    if err != nil {
        log.Fatal(err)
    }
    defer f.Close()

    img, err := png.Decode( f )
    if err != nil {
        log.Fatal(err)
    }

    bounds := img.Bounds()
    fmt.Println( bounds )     // e.g. (0,0)-(12000,12000)

		y, x := divmod( i, cols )
		fmt.Printf( "x/y - %d/%d @ %d/%d\n", x, y, x*width, y*height )

		sp := image.Point{x*width,y*height}
		rect := image.Rectangle{sp, sp.Add(img.Bounds().Size())}

		draw.Draw( composite, rect, img, image.Point{0,0}, draw.Src )
  }


	fmt.Printf( "saving %s...\n", outpath )
	fout, _ := os.Create( outpath )
	png.Encode( fout, composite )

	fmt.Println( "bye" )
}
