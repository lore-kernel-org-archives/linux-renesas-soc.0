Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from fllnx209.ext.ti.com ([198.47.19.16]:14883 "EHLO
        fllnx209.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756573AbdLOOJn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Dec 2017 09:09:43 -0500
Subject: Re: [PATCH 4/4] kms++util: Add frame compare functionality
To: Kieran Bingham <kbingham@kernel.org>,
        <linux-renesas-soc@vger.kernel.org>
CC: <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <cover.1a04e7d4a0006d06c345704eb5332e82c73312ee.1513206331.git-series.kieran.bingham@ideasonboard.com>
 <29f0046ac6a6e4f9337aa66c912d99fa4a30d592.1513206331.git-series.kieran.bingham@ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <a4aeb31d-ea8a-0a75-1332-e1caa726f6c9@ti.com>
Date: Fri, 15 Dec 2017 16:09:02 +0200
MIME-Version: 1.0
In-Reply-To: <29f0046ac6a6e4f9337aa66c912d99fa4a30d592.1513206331.git-series.kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

On 14/12/17 01:10, Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham@ideasonboard.com>
> 
> Provide a means to compare two identically sized framebuffers.
> 
> This basic implementation expects the two buffers to have the same
> formats and sizes, and will return zero for identical frames, or a
> positive float representing and average difference otherwise.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>   kms++util/inc/kms++util/kms++util.h |  1 +-
>   kms++util/src/verification.cpp      | 31 ++++++++++++++++++++++++++++++-
>   py/pykms/pykmsutil.cpp              |  2 ++-
>   3 files changed, 34 insertions(+)
> 
> diff --git a/kms++util/inc/kms++util/kms++util.h b/kms++util/inc/kms++util/kms++util.h
> index 431de0bb159a..753cee189451 100644
> --- a/kms++util/inc/kms++util/kms++util.h
> +++ b/kms++util/inc/kms++util/kms++util.h
> @@ -29,6 +29,7 @@ void draw_color_bar(IFramebuffer& buf, int old_xpos, int xpos, int width);
>   void draw_test_pattern(IFramebuffer &fb, YUVType yuvt = YUVType::BT601_Lim);
>   
>   void save_raw_frame(IFramebuffer& fb, const char *filename);
> +float compare_framebuffers(IFramebuffer& a, IFramebuffer& b);
>   }
>   
>   #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
> diff --git a/kms++util/src/verification.cpp b/kms++util/src/verification.cpp
> index 3210bb144d2b..a46d6f924095 100644
> --- a/kms++util/src/verification.cpp
> +++ b/kms++util/src/verification.cpp
> @@ -18,4 +18,35 @@ void save_raw_frame(IFramebuffer& fb, const char *filename)
>   		os->write((char*)fb.map(i), fb.size(i));
>   }
>   
> +float compare_framebuffers(IFramebuffer& a, IFramebuffer& b)

I think this needs a short comment above to explain the return value.

> +{
> +	unsigned int i;
> +	unsigned int pixels = a.width() * a.height();
> +	uint8_t *pa = a.map(0);
> +	uint8_t *pb = b.map(0);

This is only checking plane 0, you need to go through all the planes.

Also, it's much nicer to introduce the locals near where they are 
needed, instead of having them all in the beginning of the function.

> +
> +	float diff = 0;
> +
> +	if (a.format() != b.format())
> +		throw std::invalid_argument("Pixel formats differ...");
> +
> +	if ((a.width() != b.width() ||
> +	    (a.height() != b.height())))
> +		throw std::invalid_argument("Frame sizes differ...");
> +
> +	// Formats are identical, so num_planes are already identical
> +	for (i = 0; i < a.num_planes(); i++) {
> +		if ((a.offset(i) != b.offset(i)) ||
> +		    (a.stride(i) != b.stride(i)))
> +			throw std::invalid_argument("Planes differ...");
> +	}
> +
> +	// Simple byte comparisons to start.
> +	// This expects a frame to be identical, including non-visible data.
> +	for (i = 0; i < a.size(0) && i < b.size(0); i++)
> +		diff += abs(pa[i] - pb[i]);

I don't think it's a good idea compare the non-valid pixels. They could 
as well contain random data.

Better to do the check properly, using the pixels inside width and 
height only, without making assumptions about the buffer layout. And 
that way you can drop the check for offset and stride, as they don't 
have to be the same, as long as width & height are the same.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. 
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
