Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:38613 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932659AbdLRLgM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Dec 2017 06:36:12 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: kieran.bingham@ideasonboard.com
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/4] kms++util: Add verification module
Date: Mon, 18 Dec 2017 13:36:20 +0200
Message-ID: <1593408.WvHWapkjaJ@avalon>
In-Reply-To: <b8d5db70-0193-49b7-773b-dcebd9c8cb20@ideasonboard.com>
References: <cover.1a04e7d4a0006d06c345704eb5332e82c73312ee.1513206331.git-series.kieran.bingham@ideasonboard.com> <0827e08d-3c42-d878-99da-ed7b77776031@ti.com> <b8d5db70-0193-49b7-773b-dcebd9c8cb20@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

On Saturday, 16 December 2017 18:13:51 EET Kieran Bingham wrote:
> On 15/12/17 13:43, Tomi Valkeinen wrote:
> > On 14/12/17 01:10, Kieran Bingham wrote:
> >> From: Kieran Bingham <kieran.bingham@ideasonboard.com>
> >> 
> >> Provide a util module to provide helpers involved in validation and
> >> verification of data frames.
> >> 
> >> The first addition is a raw frame binary output with bindings to python
> >> modelled on Tomi's implementation in wbcap.
> > 
> > I don't think verification.cpp is a good name for this. A function to save
> > the fb sounds like a generic fb utility.
> 
> Yes, I was originally going to put it in one of the existing framebuffer
> classes - but then realised they were abstracted classes, and it had to use
> the base type :)
> 
> I was looking at verifying frames, so this was the first name that came to
> my head :D
> 
> > In fact, I'd like to have a helper utility function to save as png, as
> > converting a raw image to png is a bit of a hassle. Then again, we'd need
> > a png library for that, and possibly bigger pieces of code to handle all
> > the different pixel formats...
> 
> So would I ! I'm glad you bring the topic up :)
> 
> Are you happy to bring in external libraries to support such functionality?
> 
> I guess we can make it so the configure scripts select the feature if
> libraries are available or such.
> 
> Being able to save directly to easily viewable file formats would certainly
> ease things, (while still being able to save raw files for some manual
> verifications)

The problem with PNG (or any other format really) is that you not only need to 
encode the image into the target format (PNG or JPG would require external 
libraries, simpler formats such as BMP or PNM could be handled internally), 
but you also need to convert the image to a particular RGB or YUV format 
depending on what the output format requires.

If you want to do so, I would like to reuse code from the v4l2convert library. 
The code should be moved to a library that doesn't depend on V4L2, as the 
current API encapsulate conversion in other operations. Other tools such as 
raw2rgbpnm could then be ported to use that library;

> > So, a function to save the raw bits is fine, but how about "fbutils.cpp"
> > or such?
> 
> Yes, that sounds reasonable.
> 
> >> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> >> ---
> >>   kms++util/inc/kms++util/kms++util.h |  2 ++
> >>   kms++util/src/verification.cpp      | 21 +++++++++++++++++++++
> >>   py/pykms/pykmsutil.cpp              |  5 +++++
> >>   3 files changed, 28 insertions(+)
> >>   create mode 100644 kms++util/src/verification.cpp
> >> 
> >> diff --git a/kms++util/inc/kms++util/kms++util.h
> >> b/kms++util/inc/kms++util/kms++util.h
> >> index 8e45b0df3cde..431de0bb159a 100644
> >> --- a/kms++util/inc/kms++util/kms++util.h
> >> +++ b/kms++util/inc/kms++util/kms++util.h
> >> @@ -27,6 +27,8 @@ void draw_text(IFramebuffer& buf, uint32_t x, uint32_t
> >> y,
> >> const std::string& str
> >>   void draw_color_bar(IFramebuffer& buf, int old_xpos, int xpos, int
> >> width); void draw_test_pattern(IFramebuffer &fb, YUVType yuvt =
> >> YUVType::BT601_Lim); +
> >> +void save_raw_frame(IFramebuffer& fb, const char *filename);
> >>   }
> >>     #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
> >> diff --git a/kms++util/src/verification.cpp
> >> b/kms++util/src/verification.cpp new file mode 100644
> >> index 000000000000..3210bb144d2b
> >> --- /dev/null
> >> +++ b/kms++util/src/verification.cpp
> >> @@ -0,0 +1,21 @@
> >> +
> >> +#include <kms++/kms++.h>
> >> +#include <kms++util/kms++util.h>
> >> +
> >> +#include <fstream>
> >> +
> >> +using namespace std;
> >> +
> >> +namespace kms
> >> +{
> >> +
> >> +void save_raw_frame(IFramebuffer& fb, const char *filename)
> >> +{
> >> +    unique_ptr<ofstream> os;
> >> +    os = unique_ptr<ofstream>(new ofstream(filename, ofstream::binary));
> >> +
> >> +    for (unsigned i = 0; i < fb.num_planes(); ++i)
> >> +        os->write((char*)fb.map(i), fb.size(i));
> >> +}
> > 
> > You don't need any of that unique_ptr stuff here. I needed it as the code
> > needed to handle the case where we don't save, i.e. os = null.
> 
> Ah OK - I thought it was providing the hook up to automatically close the
> stream at the end of the function.
> 
> I guess an explicit close would be just as clean :)
> 
> As the commit message suggests, this was a direct copy paste from your
> implementation after I saw it as a better implementation than my previous
> 'C' version. (I don't spend a lot of time in C++ land)
> 
> > And I'm not fond of the function name, "frame" doesn't sound good. Maybe
> > rather save_raw_fb(). Or save_fb_raw(), so in the future we might have
> > also save_fb_png().
> 
> Agreed, sounds fine. I'm definitely looking forward to a save_fb_png().
> 
> >> +
> >> +}
> >> diff --git a/py/pykms/pykmsutil.cpp b/py/pykms/pykmsutil.cpp
> >> index 518d5eaa88f0..2d741751ba75 100644
> >> --- a/py/pykms/pykmsutil.cpp
> >> +++ b/py/pykms/pykmsutil.cpp
> >> @@ -59,4 +59,9 @@ void init_pykmstest(py::module &m)
> >>       } );
> >>       m.def("draw_text", [](Framebuffer& fb, uint32_t x, uint32_t y,
> >> const
> >> string& str, RGB color) {
> >>           draw_text(fb, x, y, str, color); } );
> >> +
> >> +    // Verification and Validation
> >> +    m.def("save_raw_frame", [](Framebuffer& fb, const char * filename) {
> >> +        save_raw_frame(fb, filename);
> >> +    });
> >>   }

-- 
Regards,

Laurent Pinchart
