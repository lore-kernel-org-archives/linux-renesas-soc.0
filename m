Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <laurent.pinchart@ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH 3/5] gen-image: Implement option to parse an input crop
Date: Fri, 10 Feb 2017 10:19:16 +0200
Message-ID: <2579500.6Q9t9i0aOC@avalon>
In-Reply-To: <779339669aa90ec156aaa8f9052369f2c8f4899f.1486562055.git-series.kieran.bingham@ideasonboard.com>
References: <cover.381fcf0d4db5fa66965cf3d2fca214970f22122b.1486562055.git-series.kieran.bingham@ideasonboard.com> <779339669aa90ec156aaa8f9052369f2c8f4899f.1486562055.git-series.kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

Thank you for the patch.

On Wednesday 08 Feb 2017 14:03:58 Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham@ideasonboard.com>
> 
> Allow the user to specify an input crop in the form (X,Y)/WxH
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>  src/gen-image.c | 106 +++++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 106 insertions(+)
> 
> diff --git a/src/gen-image.c b/src/gen-image.c
> index 9aabefa8389c..2f370e7a8ebd 100644
> --- a/src/gen-image.c
> +++ b/src/gen-image.c
> @@ -97,6 +97,13 @@ struct format_info {
>  	struct format_yuv_info yuv;
>  };
> 
> +struct image_rect {
> +	int left;
> +	int top;
> +	unsigned int width;
> +	unsigned int height;
> +};
> +
>  struct image {
>  	const struct format_info *format;
>  	unsigned int width;
> @@ -136,6 +143,8 @@ struct options {
>  	struct params params;
>  	enum histogram_type histo_type;
>  	uint8_t histo_areas[12];

I'd like to merge this series in the near future, could you rebase it on top 
of the master branch instead of the histogram branch ?

> +	bool crop;
> +	struct image_rect inputcrop;
>  };
> 
>  /* ------------------------------------------------------------------------
> @@ -1085,6 +1094,26 @@ static void image_flip(const struct image *input,
> struct image *output, }
> 
>  /* ------------------------------------------------------------------------
>   + * Image Cropping
> + */
> +
> +static void image_crop(const struct image *input, const struct image
> *output,
> +		       const struct image_rect *crop)
> +{
> +	const uint8_t *idata = input->data;
> +	uint8_t *odata = output->data;
> +	unsigned int y;
> +
> +	for (y = 0; y < output->height; ++y) {
> +		unsigned int offset = (crop->top * input->width + crop->left) 
* 3;

This variable doesn't depend on the value of y, you can compute it outside of 
the loop.

> +		memcpy(odata + y * output->width * 3,
> +		       idata + y * input->width * 3 + offset,
> +		       output->width * 3);

Instead of having to multiply the stride by y in every iteration of the loop, 
you could do

	const uint8_t *idata = input->data + offset;

...
		memcpy(odata, idata, output->width * 3);
		odata += output->width * 3;
		idata += input->width * 3;

But in addition to that, not all formats have 3 bytes per pixel :-)

> +	}
> +}
> +
> +/* ------------------------------------------------------------------------
>   * Look Up Table
>   */
> 
> @@ -1539,6 +1568,22 @@ static int process(const struct options *options)
>  		input = rgb;
>  	}
> 
> +	if (options->crop) {
> +		struct image *cropped;
> +
> +		cropped = image_new(input->format, options->inputcrop.width,
> +				options->inputcrop.height);
> +

I'd remove this blank line to keep the test logically grouped with the 
image_new() call.

> +		if (!cropped) {
> +			ret = -ENOMEM;
> +			goto done;
> +		}
> +
> +		image_crop(input, cropped, &options->inputcrop);
> +		image_delete(input);
> +		input = cropped;
> +	}
> +
>  	/* Scale */
>  	if (options->output_width && options->output_height) {
>  		output_width = options->output_width;
> @@ -1773,6 +1818,7 @@ static void usage(const char *argv0)
>  	printf("				or percentages ([0%% -
>  	100%%]). Defaults to 1.0\n");
>  	printf("-c, --compose n			Compose n copies of the image
>  	offset by (50,50)
> over a black background\n"); printf("-C, --no-chroma-average	Disable
> chroma averaging for odd pixels on output\n");
> +	printf("    --crop (X,Y)/WxH            Crop the input image\n");
>  	printf("-e, --encoding enc		Set the YCbCr encoding method.
> Valid values are\n");
> printf("				BT.601, REC.709, BT.2020 and
> SMPTE240M\n");
>  	printf("-f, --format format		Set the output image 
format\n");
> @@ -1813,11 +1859,13 @@ static void list_formats(void)
>  #define OPT_VFLIP		257
>  #define OPT_HISTOGRAM_TYPE	258
>  #define OPT_HISTOGRAM_AREAS	259
> +#define OPT_CROP		260
> 
>  static struct option opts[] = {
>  	{"alpha", 1, 0, 'a'},
>  	{"clu", 1, 0, 'L'},
>  	{"compose", 1, 0, 'c'},
> +	{"crop", 1, 0, OPT_CROP},
>  	{"encoding", 1, 0, 'e'},
>  	{"format", 1, 0, 'f'},
>  	{"help", 0, 0, 'h'},
> @@ -1836,6 +1884,58 @@ static struct option opts[] = {
>  	{0, 0, 0, 0}
>  };
> 
> +static int parse_crop(struct options *options, char *optarg)

I think you should pass an image_crop pointer to this function, to make it 
reusable should we add other crop options later.

> +{
> +	char * endptr;

s/* /*/

> +
> +	/* (X,Y)/WxH */
> +	endptr = optarg;
> +	if (*endptr != '(') {
> +		printf("Invalid crop argument '%s', expected '(', got '%c'\n", 
optarg,
> *endptr);

Could you split the line after the format string to avoid going over the 80 
characters limit ? It's not as hard a limit in gen-image as it is in the 
kernel, but it's a good practice nonetheless.

> +		return 1;
> +	}
> +
> +	options->inputcrop.left = strtol(endptr + 1, &endptr, 10);
> +	if (*endptr != ',' || endptr == optarg) {
> +		printf("Invalid crop position '%s', expected ',', got '%c'\n",
> optarg, *endptr);

How about using something similar to media_print_streampos() (from media-ctl) 
to parse error messages ? You could then shorten the messages as the tool 
would show the location where the error happened.

> +		return 1;
> +	}
> +
> +	options->inputcrop.top = strtol(endptr + 1, &endptr, 10);
> +	if (*endptr != ')' || endptr == optarg) {
> +		printf("Invalid crop position '%s', expected ')', got '%c'\n",
> optarg, *endptr);
> +		return 1;
> +	}
> +
> +	if (*endptr != ')') {
> +		printf("Invalid crop argument '%s', expected x, got '%c'\n",
> optarg, *endptr);
> +		return 1;
> +	}
> +
> +	endptr++;

Shouldn't you test for '/' here ?

> +
> +	options->inputcrop.width = strtol(endptr + 1, &endptr, 10);
> +	if (*endptr != 'x' || endptr == optarg) {
> +		printf("Invalid crop size '%s', expected x, got '%c'\n",
> optarg, *endptr);
> +		return 1;
> +	}
> +
> +	options->inputcrop.height = strtol(endptr + 1, &endptr, 10);
> +	if (*endptr != 0) {
> +		printf("Invalid crop size '%s'\n", optarg);
> +		return 1;
> +	}
> +
> +	if (options->inputcrop.left < 0 || options->inputcrop.top < 0) {
> +		printf("Invalid negative crop position '%s'\n", optarg);
> +		return 1;
> +	}
> +
> +	options->crop = true;

If you pass a crop rectangle pointer to the function, this line should be 
moved out to the caller.
> +
> +	return 0;
> +}
> +
>  static int parse_args(struct options *options, int argc, char *argv[])
>  {
>  	char *endptr;
> @@ -2024,6 +2124,12 @@ static int parse_args(struct options *options, int
> argc, char *argv[]) break;
>  		}
> 
> +		case OPT_CROP:
> +			if (parse_crop(options, optarg))
> +				return 1;
> +
> +			break;
> +
>  		default:
>  			printf("Invalid option -%c\n", c);
>  			printf("Run %s -h for help.\n", argv[0]);

-- 
Regards,

Laurent Pinchart
