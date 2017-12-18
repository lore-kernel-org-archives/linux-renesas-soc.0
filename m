Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from lelnx194.ext.ti.com ([198.47.27.80]:26092 "EHLO
        lelnx194.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752858AbdLRPsf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Dec 2017 10:48:35 -0500
Subject: Re: [PATCH 3/4] kms++util: Add verification module
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: <kieran.bingham@ideasonboard.com>,
        <linux-renesas-soc@vger.kernel.org>
References: <cover.1a04e7d4a0006d06c345704eb5332e82c73312ee.1513206331.git-series.kieran.bingham@ideasonboard.com>
 <4127740.6d2LxRg6UI@avalon> <99e99d24-6ee3-884d-edf9-570fcbc5ab14@ti.com>
 <2040658.4j5LHz4jYX@avalon>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <170c3cec-57a3-d57e-d657-cf8a0590bde3@ti.com>
Date: Mon, 18 Dec 2017 17:48:28 +0200
MIME-Version: 1.0
In-Reply-To: <2040658.4j5LHz4jYX@avalon>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 18/12/17 17:41, Laurent Pinchart wrote:
> Hi Tomi,
> 
> On Monday, 18 December 2017 14:04:45 EET Tomi Valkeinen wrote:
>> On 18/12/17 13:50, Laurent Pinchart wrote:
>>> That's an option too. I had a look at the code once to find out how
>>> ImageMagick was performing scaling and gave up with a headache soon
>>> afterwards. We need more formats than what ImageMagick currently supports
>>> (it's mostly focused on image file formats instead of raw image formats),
>>> with all kind of RGB, YUV (and ideally Bayer) formats, and I don't think
>>> extending ImageMagick would be the way to go.
>>
>> Yep, I can image that ImageMagick can't handle it all. I don't really
>> have much experience with it. I did find that it has enough tunables to
>> manage rgbx8888 with different byte orders and the "extra" alpha channel:
>>
>> convert -depth 8 -size $1x$2 -color-matrix "0 0 1 0 1 0 1 0 0" -alpha
>> deactivate rgba:$3 png:-
>>
>> But things like argb1555 or yuv422 might prove to be too difficult for
>> ImageMagick.
>>
>> Where's the source for v4l2convert? What does it do?
> 
> Sorry, it's v4lconvert, not v4l2convert. The library is part of v4l-utils
> (available at git://linuxtv.org/pinchartl/v4l-utils.git) and is found in the
> lib/libv4lconvert directory.
> 
> The purpose of the library is to convert from lots of weird formats supported
> by V4L2 to RGB or YUV. It was initially written to handle vendor-specific
> compression formats used by webcams, has been extended to support Bayer
> formats and different kind of RGB and YUV formats. The code is simple, I think
> it could be a good base.
> 
>> I wonder how difficult it would be to create a brute-force-no-optimizations
>> style of a function to which you give the exact bit definition of the
>> buffer's pixel format, and which gives you RGB888 or YUV444, depending on
>> the input format (I presume most image encoders would accept RGB888 &
>> YUV444).
> 
> Can you come up with a bit definition format that could describe Bayer or
> tiled formats without requiring the definition to be written in an interpreted
> language ? :-)

I have only worked with RGB and YUV, so that should be enough for 
everybody. ;)

But more seriously, I think kms++ is mainly for display. Do we have any 
display devices that support Bayer? And tiled formats sound a bit 
special platform specific cases.

That said, if we have a library that just does it all, that's obviously 
the best option.

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. 
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
