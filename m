Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:49659 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751176AbdECPFH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 May 2017 11:05:07 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: jmondi <jacopo@jmondi.org>
Cc: magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC v2 1/2] media: platform: Add SH CEU camera interface driver
Date: Wed, 03 May 2017 18:06:19 +0300
Message-ID: <3619773.tH6RBRIP39@avalon>
In-Reply-To: <20170503095236.GD5814@w540>
References: <1493282548-27673-1-git-send-email-jacopo@jmondi.org> <2468637.9LR39KYxFA@avalon> <20170503095236.GD5814@w540>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,

On Wednesday 03 May 2017 11:52:36 jmondi wrote:
> On Thu, Apr 27, 2017 at 02:47:14PM +0300, Laurent Pinchart wrote:
> > Hi Jacopo,
> > 
> > Thank you for the patch.
> 
> [snip]
> 
> >> +/**
> >> + * Collect formats supported by CEU and sensor subdevice
> >> + */
> >> +static int sh_ceu_init_active_formats(struct sh_ceu_dev *pcdev)
> >> +{
> >> +	struct v4l2_subdev *sensor = pcdev->sensor;
> >> +	struct sh_ceu_fmt *active_fmts;
> >> +	unsigned int n_active_fmts;
> >> +	struct sh_ceu_fmt *fmt;
> >> +	unsigned int i;
> >> +
> >> +	struct v4l2_subdev_mbus_code_enum mbus_code = {
> >> +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
> >> +		.index = 0,
> >> +	};
> >> +
> >> +	/* Count how may formats are supported by CEU and sensor subdevice */
> >> +	n_active_fmts = 0;
> >> +	while (!v4l2_subdev_call(sensor, pad, enum_mbus_code,
> >> +				 NULL, &mbus_code)) {
> >> +		mbus_code.index++;
> >> +
> >> +		fmt = get_ceu_fmt_from_mbus(mbus_code.code);
> > 
> > This is not correct. You will get one one pixel format per media bus
> > format supported by the sensor. The CEU supports
> > 
> > 1. converting packed YUV 4:2:2 (YUYV) to YUV 4:2:2 planar (CAMCR.JPG = 00)
> > or capturing raw data (CAMCR.JPG = 01)
> > 
> > 2. outputting YUV 4:2:2 planar to memory (CDOCR.CDS = 1) or downsampling
> > it to YUV 4:2:0 planar (CDOCR.CDS = 0)
> > 
> > 3. swapping bytes, words and long words at the output (CDOCR.COLS,
> > CDOCR.COWS and CDOCR.COBS fields)
> > 
> > This effectively allows to
> > 
> > - capture the raw data produced by the sensor
> > - capture YUV images produced by the sensor in packed YUV 4:2:2 format,
> > from any Y/U/V order to any Y/U/V order
> > - capture YUV images produced by the sensor in planar YUV 4:2:2 or planar
> > YUV 4:2:0, from any Y/U/V order to any Y/U/V order
> > 
> > The list of formats you create needs to reflect that. This means that
> > 
> > - if the sensor can produce a packed YUV 4:2:2 format, the CEU will be
> > able to output YUYV, UYVY, YVYU, VYUY, NV12, NV21, NV16 and NV16
> > 
> > - for every non-YUV format produced by the sensor, the CEU will be able to
> > output raw data
> > 
> > The former is easy. You just need to list the formats produced by the
> > sensor, and if one of them is packed YUV 4:2:2, flag that in the
> > sh_ceu_dev structure, and allow all the above output YUV formats. You
> > don't need to create an instance-specific list of those formats in the
> > sh_ceu_dev structure, as they will be either all available or all
> > non-available.
> > 
> > The latter is a bit more complex, you need a list of media bus code to
> > pixel format in the driver. I'd recommend counting the non-YUV packed
> > formats produced by the sensor, allocating an array of sh_ceu_fmt
> > pointers with that number of entries, and make each entry point to the
> > corresponding entry in the global sh_ceu_fmts array. The global
> > sh_ceu_fmts needs to be extended with common sensor formats (raw Bayer
> > and JPEG come to mind).
> > 
> > If all sensors currently used with the CEU can produce packed YUV, you
> > could implement YUV support only to start with, leaving raw capture
> > support for later.
> 
> Ok, thanks for explaining.
> 
> I have a proposal here, as the original driver only supported "image
> fetch mode" (ie. It accepts data in YUYV with components ordering arbitrary
> swapped) as a first step we may want to replicate this, ignoring data
> synch fetch mode (Chris, you have a driver for this you are already
> using in your BSP so I guess it's less urgent to support it, right?).
> 
> Also, regarding output memory format I am sure we can produce planar formats
> as NV12/21 and NV16/61, but I'm not sure I have found a way to output
> packed YUVY (and its permutations) to memory, if not considering it a
> binary format, as thus using data synch fetch mode.

As I understand it, outputting packed YUV is indeed done using data synch (or 
enable, I'd have to check) fetch mode, and swapping components to convert 
between different YUYV orders is done through the CDOCR.COLS, CDOCR.COWS and 
CDOCR.COBS bits.

> So, as a first step my proposal is the following one:
> Accept any YUYV bus format from sensor, and support planar ones as memory
> output formats with down-sampling support (NV12/21 and NV16/61 then).

You can start with that, but from the same YUV bus format, you should be able 
to output packed YUV easily using data sync fetch mode. That can be 
implemented as a second step, it will just result in extending the hardcoded 
list of YUV pixel formats supported by the driver (as any YUV bus format can 
produce any of the four NV variants and any of the four packed YUV variants).

The third step would be to enumerate the non-YUV formats supported by the 
sensor, and create a list of corresponding pixel formats that can be supported 
in data sync fetch mode. I'd leave that out for now.

So, if you only implement the first two steps, you don't need to create a list 
of supported YUV formats at runtime, you only need to ensure that the sensor 
supports one YUV bus format, and you can hardcode support for all 8 YUV pixel 
formats in the CEU driver.

> The way I am building the supported format list is indeed wrong, and
> as you suggested I should just try to make sure the sensor can output
> a YUV422 bus format. From there I can output planar memory formats.
> 
> One last thing, I am not that sure how I can produce NV21/61 from
> bus formats that do not already present the CbCr components in the
> desired order (which is Cr then Cb for NV61/21)
> Eg. Can I produce NV21 from YUYV though byte/word/long word swapping
> (CDOCR.COLS/CDOCR.COWS/CDOCR.COBS) ? Won't I be swapping the luminance
> components as well (see figure 46.45 in RZ/A1H TRM).

No, the way the accommodate different YUYV orders at the input when outputting 
an NV format is through the CAMCR.DTARY field. The CDOCR.CO[LWB]S fields 
control data swapping at the output, before writing data to memory.

You should set the CAMCR.DTARY field to the order output by the sensor if you 
want to generate NV12 or NV16. For NV21 or NV61, just fool the CEU by 
pretending the sensor swaps U and V. For instance, if the sensor produces YUYV 
but you set CAMCR.DTARY to YVYU, the U and V components will be swapped at the 
input interface, and the NV12 output will become NV21.

> If I cannot do that, I should restrict swapped planar format
> availability based on the ability of the sensor to produce
> chrominance components in the desired order
> (Eg. If the sensor does not support producing YVYU I cannot produce
> NV21 or NV61). Is this ok?

That would be OK if there was no way to swap U and V, but as you can, you can 
output all formats :-)

> > > +		if (!fmt)
> > > +			continue;
> > > +
> > > +		fmt->active = 1;
> > > +		n_active_fmts++;
> > > +	}
> > > +
> > > +	if (n_active_fmts == 0)
> > > +		return -ENXIO;
> > > +
> > > +	pcdev->n_active_fmts = n_active_fmts;
> > > +	pcdev->active_fmts = devm_kcalloc(&pcdev->vdev.dev, n_active_fmts,
> > > +					  sizeof(*pcdev->active_fmts),
> > > +					  GFP_KERNEL);
> > 
> > See my comment about devm_kzalloc() in the probe() function. This one
> > might be harmless, but you'd then need to prove that (and explain the
> > proof in a comment).
> > 
> > > +	if (!pcdev->active_fmts)
> > > +		return -ENOMEM;
> > > +
> > > +	active_fmts = pcdev->active_fmts[0];
> > > +	fmt = &sh_ceu_fmts[0];
> > > +	for (i = 0; i < N_SH_CEU_FMT; i++, fmt++) {
> > 
> > Just use ARRAY_SIZE() directly, it's clearer.
> > 
> > > +		if (!fmt->active)
> > > +			continue;
> > > +
> > > +		active_fmts = fmt;
> > > +		active_fmts++;
> > > +	}
> > > +
> > > +	return 0;
> > > +}

[snip]

-- 
Regards,

Laurent Pinchart
