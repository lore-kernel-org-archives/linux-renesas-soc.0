Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from fllnx210.ext.ti.com ([198.47.19.17]:44394 "EHLO
        fllnx210.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758608AbdLRMEv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Dec 2017 07:04:51 -0500
Subject: Re: [PATCH 3/4] kms++util: Add verification module
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: <kieran.bingham@ideasonboard.com>,
        <linux-renesas-soc@vger.kernel.org>
References: <cover.1a04e7d4a0006d06c345704eb5332e82c73312ee.1513206331.git-series.kieran.bingham@ideasonboard.com>
 <1593408.WvHWapkjaJ@avalon> <1c133f3a-1619-a23c-03cb-eee0ea52b64b@ti.com>
 <4127740.6d2LxRg6UI@avalon>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <99e99d24-6ee3-884d-edf9-570fcbc5ab14@ti.com>
Date: Mon, 18 Dec 2017 14:04:45 +0200
MIME-Version: 1.0
In-Reply-To: <4127740.6d2LxRg6UI@avalon>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 18/12/17 13:50, Laurent Pinchart wrote:

> That's an option too. I had a look at the code once to find out how
> ImageMagick was performing scaling and gave up with a headache soon
> afterwards. We need more formats than what ImageMagick currently supports
> (it's mostly focused on image file formats instead of raw image formats), with
> all kind of RGB, YUV (and ideally Bayer) formats, and I don't think extending
> ImageMagick would be the way to go.

Yep, I can image that ImageMagick can't handle it all. I don't really 
have much experience with it. I did find that it has enough tunables to 
manage rgbx8888 with different byte orders and the "extra" alpha channel:

convert -depth 8 -size $1x$2 -color-matrix "0 0 1 0 1 0 1 0 0" -alpha 
deactivate rgba:$3 png:-

But things like argb1555 or yuv422 might prove to be too difficult for 
ImageMagick.

Where's the source for v4l2convert? What does it do?

I wonder how difficult it would be to create a 
brute-force-no-optimizations style of a function to which you give the 
exact bit definition of the buffer's pixel format, and which gives you 
RGB888 or YUV444, depending on the input format (I presume most image 
encoders would accept RGB888 & YUV444).

I think the function wouldn't even need to care whether the data is RGB 
or YUV, it would just unpack it according to the format definition.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. 
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
