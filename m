Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:38653 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758074AbdLRLug (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Dec 2017 06:50:36 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: kieran.bingham@ideasonboard.com, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/4] kms++util: Add verification module
Date: Mon, 18 Dec 2017 13:50:46 +0200
Message-ID: <4127740.6d2LxRg6UI@avalon>
In-Reply-To: <1c133f3a-1619-a23c-03cb-eee0ea52b64b@ti.com>
References: <cover.1a04e7d4a0006d06c345704eb5332e82c73312ee.1513206331.git-series.kieran.bingham@ideasonboard.com> <1593408.WvHWapkjaJ@avalon> <1c133f3a-1619-a23c-03cb-eee0ea52b64b@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Tomi,

On Monday, 18 December 2017 13:46:22 EET Tomi Valkeinen wrote:
> On 18/12/17 13:36, Laurent Pinchart wrote:
> > The problem with PNG (or any other format really) is that you not only
> > need to encode the image into the target format (PNG or JPG would require
> > external libraries, simpler formats such as BMP or PNM could be handled
> > internally), but you also need to convert the image to a particular RGB
> > or YUV format depending on what the output format requires.
> 
> Yes, that's the "hassle" part I was referring to =).
> 
> Maybe we need to invent a new file format that can store all kinds of
> formats? (https://xkcd.com/927/)
> 
> > If you want to do so, I would like to reuse code from the v4l2convert
> > library. The code should be moved to a library that doesn't depend on
> > V4L2, as the current API encapsulate conversion in other operations.
> > Other tools such as raw2rgbpnm could then be ported to use that library;
> 
> Yep, so I agree that doing color format conversions shouldn't really be
> kms++'s job, but at the same time I'd like to be able to export
> framebuffers.
> 
> And I'm fine with adding dependencies to kms++, as long as all those are
> optional.
> 
> Aren't there "big" image conversion libraries that would do the job?
> Imagemagick? Or something? I have used "convert" command to do some
> conversions, that comes from ImageMagick.

That's an option too. I had a look at the code once to find out how 
ImageMagick was performing scaling and gave up with a headache soon 
afterwards. We need more formats than what ImageMagick currently supports 
(it's mostly focused on image file formats instead of raw image formats), with 
all kind of RGB, YUV (and ideally Bayer) formats, and I don't think extending 
ImageMagick would be the way to go.

-- 
Regards,

Laurent Pinchart
