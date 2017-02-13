Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <laurent.pinchart@ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/5] gen-image: Implement option to parse an input crop
Date: Mon, 13 Feb 2017 21:48:18 +0200
Message-ID: <9323761.eby1YSBEA7@avalon>
In-Reply-To: <aa9aa0d5-ef74-4ae7-a834-b0648642d9b6@ideasonboard.com>
References: <cover.381fcf0d4db5fa66965cf3d2fca214970f22122b.1486562055.git-series.kieran.bingham@ideasonboard.com> <2579500.6Q9t9i0aOC@avalon> <aa9aa0d5-ef74-4ae7-a834-b0648642d9b6@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

On Friday 10 Feb 2017 11:18:09 Kieran Bingham wrote:
> On 10/02/17 08:19, Laurent Pinchart wrote:
> > On Wednesday 08 Feb 2017 14:03:58 Kieran Bingham wrote:
> >> From: Kieran Bingham <kieran.bingham@ideasonboard.com>
> >> 
> >> Allow the user to specify an input crop in the form (X,Y)/WxH
> >> 
> >> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> >> ---
> >> 
> >>  src/gen-image.c | 106 +++++++++++++++++++++++++++++++++++++++++++++++++-
> >>  1 file changed, 106 insertions(+)
> >> 
> >> diff --git a/src/gen-image.c b/src/gen-image.c
> >> index 9aabefa8389c..2f370e7a8ebd 100644
> >> --- a/src/gen-image.c
> >> +++ b/src/gen-image.c

[snip]

> >> +static void image_crop(const struct image *input, const struct image
> >> *output,
> >> +		       const struct image_rect *crop)
> >> +{
> >> +	const uint8_t *idata = input->data;
> >> +	uint8_t *odata = output->data;
> >> +	unsigned int y;
> >> +
> >> +	for (y = 0; y < output->height; ++y) {
> >> +		unsigned int offset = (crop->top * input->width + crop->left)
> > 
> > * 3;
> > 
> > This variable doesn't depend on the value of y, you can compute it outside
> > of the loop.
> 
> Ah yes, :D
> Done.
> 
> >> +		memcpy(odata + y * output->width * 3,
> >> +		       idata + y * input->width * 3 + offset,
> >> +		       output->width * 3);
> > 
> > Instead of having to multiply the stride by y in every iteration of the
> > loop, you could do
> > 
> > 	const uint8_t *idata = input->data + offset;
> > 
> > ...
> > 
> > 		memcpy(odata, idata, output->width * 3);
> > 		odata += output->width * 3;
> > 		idata += input->width * 3;
> 
> I was replicating from the compose function, - but I'm fine with this.
> Done.
> 
> > But in addition to that, not all formats have 3 bytes per pixel :-)
> 
> Ah, but I thought they do at the point I call this function. This conversion
> only occurs after the formats are converted
> 
> 	/* Convert colorspace */
> 	if (options->input_format->type == FORMAT_YUV) {
> 		... # Image converted to YUV24
> 	} else if (options->input_format->rgb.bpp < 24) {
> 		... # Image converted to RGB24
> 	}
> 
> 	if (options->crop) {
> 		... Actual crop performed, on 24bpp image.
> 	}
> 
> Perhaps it would be useful to declare that this function only operates on
> 24bit images somehow. It is accordingly located next to image_scale,
> image_compose, image_rotate, and image_flip which also operate on 24bpp
> images.

You're right, my bad. The code is thus fine from that point of view.

> We can always make it more generic later if we need to use the code in other
> parts of gen-image

That's fine with me.

> >> +	}
> >> +}

-- 
Regards,

Laurent Pinchart
