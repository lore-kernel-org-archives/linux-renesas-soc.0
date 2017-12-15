Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from fllnx210.ext.ti.com ([198.47.19.17]:45250 "EHLO
        fllnx210.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756329AbdLONnt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Dec 2017 08:43:49 -0500
Subject: Re: [PATCH 3/4] kms++util: Add verification module
To: Kieran Bingham <kbingham@kernel.org>,
        <linux-renesas-soc@vger.kernel.org>
CC: <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <cover.1a04e7d4a0006d06c345704eb5332e82c73312ee.1513206331.git-series.kieran.bingham@ideasonboard.com>
 <2804f59b2ecafc22abb57428f38a9b2d267ff0b7.1513206331.git-series.kieran.bingham@ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <0827e08d-3c42-d878-99da-ed7b77776031@ti.com>
Date: Fri, 15 Dec 2017 15:43:40 +0200
MIME-Version: 1.0
In-Reply-To: <2804f59b2ecafc22abb57428f38a9b2d267ff0b7.1513206331.git-series.kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

On 14/12/17 01:10, Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham@ideasonboard.com>
> 
> Provide a util module to provide helpers involved in validation and verification
> of data frames.
> 
> The first addition is a raw frame binary output with bindings to python modelled
> on Tomi's implementation in wbcap.

I don't think verification.cpp is a good name for this. A function to 
save the fb sounds like a generic fb utility.

In fact, I'd like to have a helper utility function to save as png, as 
converting a raw image to png is a bit of a hassle. Then again, we'd 
need a png library for that, and possibly bigger pieces of code to 
handle all the different pixel formats...

So, a function to save the raw bits is fine, but how about "fbutils.cpp" 
or such?

> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>   kms++util/inc/kms++util/kms++util.h |  2 ++
>   kms++util/src/verification.cpp      | 21 +++++++++++++++++++++
>   py/pykms/pykmsutil.cpp              |  5 +++++
>   3 files changed, 28 insertions(+)
>   create mode 100644 kms++util/src/verification.cpp
> 
> diff --git a/kms++util/inc/kms++util/kms++util.h b/kms++util/inc/kms++util/kms++util.h
> index 8e45b0df3cde..431de0bb159a 100644
> --- a/kms++util/inc/kms++util/kms++util.h
> +++ b/kms++util/inc/kms++util/kms++util.h
> @@ -27,6 +27,8 @@ void draw_text(IFramebuffer& buf, uint32_t x, uint32_t y, const std::string& str
>   void draw_color_bar(IFramebuffer& buf, int old_xpos, int xpos, int width);
>   
>   void draw_test_pattern(IFramebuffer &fb, YUVType yuvt = YUVType::BT601_Lim);
> +
> +void save_raw_frame(IFramebuffer& fb, const char *filename);
>   }
>   
>   #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
> diff --git a/kms++util/src/verification.cpp b/kms++util/src/verification.cpp
> new file mode 100644
> index 000000000000..3210bb144d2b
> --- /dev/null
> +++ b/kms++util/src/verification.cpp
> @@ -0,0 +1,21 @@
> +
> +#include <kms++/kms++.h>
> +#include <kms++util/kms++util.h>
> +
> +#include <fstream>
> +
> +using namespace std;
> +
> +namespace kms
> +{
> +
> +void save_raw_frame(IFramebuffer& fb, const char *filename)
> +{
> +	unique_ptr<ofstream> os;
> +	os = unique_ptr<ofstream>(new ofstream(filename, ofstream::binary));
> +
> +	for (unsigned i = 0; i < fb.num_planes(); ++i)
> +		os->write((char*)fb.map(i), fb.size(i));
> +}

You don't need any of that unique_ptr stuff here. I needed it as the 
code needed to handle the case where we don't save, i.e. os = null.

And I'm not fond of the function name, "frame" doesn't sound good. Maybe 
rather save_raw_fb(). Or save_fb_raw(), so in the future we might have 
also save_fb_png().

> +
> +}
> diff --git a/py/pykms/pykmsutil.cpp b/py/pykms/pykmsutil.cpp
> index 518d5eaa88f0..2d741751ba75 100644
> --- a/py/pykms/pykmsutil.cpp
> +++ b/py/pykms/pykmsutil.cpp
> @@ -59,4 +59,9 @@ void init_pykmstest(py::module &m)
>   	} );
>   	m.def("draw_text", [](Framebuffer& fb, uint32_t x, uint32_t y, const string& str, RGB color) {
>   		draw_text(fb, x, y, str, color); } );
> +
> +	// Verification and Validation
> +	m.def("save_raw_frame", [](Framebuffer& fb, const char * filename) {
> +		save_raw_frame(fb, filename);
> +	});
>   }
> 

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. 
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
