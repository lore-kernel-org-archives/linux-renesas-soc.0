Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:37241 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756532AbdLPQNz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 16 Dec 2017 11:13:55 -0500
Subject: Re: [PATCH 3/4] kms++util: Add verification module
To: Tomi Valkeinen <tomi.valkeinen@ti.com>,
        linux-renesas-soc@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <cover.1a04e7d4a0006d06c345704eb5332e82c73312ee.1513206331.git-series.kieran.bingham@ideasonboard.com>
 <2804f59b2ecafc22abb57428f38a9b2d267ff0b7.1513206331.git-series.kieran.bingham@ideasonboard.com>
 <0827e08d-3c42-d878-99da-ed7b77776031@ti.com>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reply-To: kieran.bingham@ideasonboard.com
Message-ID: <b8d5db70-0193-49b7-773b-dcebd9c8cb20@ideasonboard.com>
Date: Sat, 16 Dec 2017 16:13:51 +0000
MIME-Version: 1.0
In-Reply-To: <0827e08d-3c42-d878-99da-ed7b77776031@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Tomi,

Thank you for taking the time to look at this topic.

On 15/12/17 13:43, Tomi Valkeinen wrote:
> Hi,
> 
> On 14/12/17 01:10, Kieran Bingham wrote:
>> From: Kieran Bingham <kieran.bingham@ideasonboard.com>
>>
>> Provide a util module to provide helpers involved in validation and verification
>> of data frames.
>>
>> The first addition is a raw frame binary output with bindings to python modelled
>> on Tomi's implementation in wbcap.
> 
> I don't think verification.cpp is a good name for this. A function to save the
> fb sounds like a generic fb utility.

Yes, I was originally going to put it in one of the existing framebuffer classes
- but then realised they were abstracted classes, and it had to use the base type :)

I was looking at verifying frames, so this was the first name that came to my
head :D

> In fact, I'd like to have a helper utility function to save as png, as
> converting a raw image to png is a bit of a hassle. Then again, we'd need a png
> library for that, and possibly bigger pieces of code to handle all the different
> pixel formats...

So would I ! I'm glad you bring the topic up :)

Are you happy to bring in external libraries to support such functionality?

I guess we can make it so the configure scripts select the feature if libraries
are available or such.

Being able to save directly to easily viewable file formats would certainly ease
things, (while still being able to save raw files for some manual verifications)

> So, a function to save the raw bits is fine, but how about "fbutils.cpp" or such?

Yes, that sounds reasonable.


>> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
>> ---
>>   kms++util/inc/kms++util/kms++util.h |  2 ++
>>   kms++util/src/verification.cpp      | 21 +++++++++++++++++++++
>>   py/pykms/pykmsutil.cpp              |  5 +++++
>>   3 files changed, 28 insertions(+)
>>   create mode 100644 kms++util/src/verification.cpp
>>
>> diff --git a/kms++util/inc/kms++util/kms++util.h
>> b/kms++util/inc/kms++util/kms++util.h
>> index 8e45b0df3cde..431de0bb159a 100644
>> --- a/kms++util/inc/kms++util/kms++util.h
>> +++ b/kms++util/inc/kms++util/kms++util.h
>> @@ -27,6 +27,8 @@ void draw_text(IFramebuffer& buf, uint32_t x, uint32_t y,
>> const std::string& str
>>   void draw_color_bar(IFramebuffer& buf, int old_xpos, int xpos, int width);
>>     void draw_test_pattern(IFramebuffer &fb, YUVType yuvt = YUVType::BT601_Lim);
>> +
>> +void save_raw_frame(IFramebuffer& fb, const char *filename);
>>   }
>>     #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
>> diff --git a/kms++util/src/verification.cpp b/kms++util/src/verification.cpp
>> new file mode 100644
>> index 000000000000..3210bb144d2b
>> --- /dev/null
>> +++ b/kms++util/src/verification.cpp
>> @@ -0,0 +1,21 @@
>> +
>> +#include <kms++/kms++.h>
>> +#include <kms++util/kms++util.h>
>> +
>> +#include <fstream>
>> +
>> +using namespace std;
>> +
>> +namespace kms
>> +{
>> +
>> +void save_raw_frame(IFramebuffer& fb, const char *filename)
>> +{
>> +    unique_ptr<ofstream> os;
>> +    os = unique_ptr<ofstream>(new ofstream(filename, ofstream::binary));
>> +
>> +    for (unsigned i = 0; i < fb.num_planes(); ++i)
>> +        os->write((char*)fb.map(i), fb.size(i));
>> +}
> 
> You don't need any of that unique_ptr stuff here. I needed it as the code needed
> to handle the case where we don't save, i.e. os = null.

Ah OK - I thought it was providing the hook up to automatically close the stream
at the end of the function.

I guess an explicit close would be just as clean :)

As the commit message suggests, this was a direct copy paste from your
implementation after I saw it as a better implementation than my previous 'C'
version. (I don't spend a lot of time in C++ land)


> And I'm not fond of the function name, "frame" doesn't sound good. Maybe rather
> save_raw_fb(). Or save_fb_raw(), so in the future we might have also save_fb_png().

Agreed, sounds fine. I'm definitely looking forward to a save_fb_png().


>> +
>> +}
>> diff --git a/py/pykms/pykmsutil.cpp b/py/pykms/pykmsutil.cpp
>> index 518d5eaa88f0..2d741751ba75 100644
>> --- a/py/pykms/pykmsutil.cpp
>> +++ b/py/pykms/pykmsutil.cpp
>> @@ -59,4 +59,9 @@ void init_pykmstest(py::module &m)
>>       } );
>>       m.def("draw_text", [](Framebuffer& fb, uint32_t x, uint32_t y, const
>> string& str, RGB color) {
>>           draw_text(fb, x, y, str, color); } );
>> +
>> +    // Verification and Validation
>> +    m.def("save_raw_frame", [](Framebuffer& fb, const char * filename) {
>> +        save_raw_frame(fb, filename);
>> +    });
>>   }
>>
> 

Regards
--
Kieran
