Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from fllnx210.ext.ti.com ([198.47.19.17]:43890 "EHLO
        fllnx210.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751775AbdLRLq2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Dec 2017 06:46:28 -0500
Subject: Re: [PATCH 3/4] kms++util: Add verification module
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        <kieran.bingham@ideasonboard.com>
CC: <linux-renesas-soc@vger.kernel.org>
References: <cover.1a04e7d4a0006d06c345704eb5332e82c73312ee.1513206331.git-series.kieran.bingham@ideasonboard.com>
 <0827e08d-3c42-d878-99da-ed7b77776031@ti.com>
 <b8d5db70-0193-49b7-773b-dcebd9c8cb20@ideasonboard.com>
 <1593408.WvHWapkjaJ@avalon>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <1c133f3a-1619-a23c-03cb-eee0ea52b64b@ti.com>
Date: Mon, 18 Dec 2017 13:46:22 +0200
MIME-Version: 1.0
In-Reply-To: <1593408.WvHWapkjaJ@avalon>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 18/12/17 13:36, Laurent Pinchart wrote:

> The problem with PNG (or any other format really) is that you not only need to
> encode the image into the target format (PNG or JPG would require external
> libraries, simpler formats such as BMP or PNM could be handled internally),
> but you also need to convert the image to a particular RGB or YUV format
> depending on what the output format requires.

Yes, that's the "hassle" part I was referring to =).

Maybe we need to invent a new file format that can store all kinds of 
formats? (https://xkcd.com/927/)

> If you want to do so, I would like to reuse code from the v4l2convert library.
> The code should be moved to a library that doesn't depend on V4L2, as the
> current API encapsulate conversion in other operations. Other tools such as
> raw2rgbpnm could then be ported to use that library;

Yep, so I agree that doing color format conversions shouldn't really be 
kms++'s job, but at the same time I'd like to be able to export 
framebuffers.

And I'm fine with adding dependencies to kms++, as long as all those are 
optional.

Aren't there "big" image conversion libraries that would do the job? 
Imagemagick? Or something? I have used "convert" command to do some 
conversions, that comes from ImageMagick.

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. 
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
