Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:37815 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756760AbdLPQlq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 16 Dec 2017 11:41:46 -0500
Subject: Re: [PATCH 4/4] kms++util: Add frame compare functionality
To: Tomi Valkeinen <tomi.valkeinen@ti.com>,
        linux-renesas-soc@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <cover.1a04e7d4a0006d06c345704eb5332e82c73312ee.1513206331.git-series.kieran.bingham@ideasonboard.com>
 <29f0046ac6a6e4f9337aa66c912d99fa4a30d592.1513206331.git-series.kieran.bingham@ideasonboard.com>
 <a4aeb31d-ea8a-0a75-1332-e1caa726f6c9@ti.com>
Reply-To: kieran.bingham@ideasonboard.com
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Message-ID: <1c7fd195-820d-116a-ed96-3a38b4b0f0fa@ideasonboard.com>
Date: Sat, 16 Dec 2017 16:41:42 +0000
MIME-Version: 1.0
In-Reply-To: <a4aeb31d-ea8a-0a75-1332-e1caa726f6c9@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Tomi,

On 15/12/17 14:09, Tomi Valkeinen wrote:
> Hi,
> 
> On 14/12/17 01:10, Kieran Bingham wrote:
>> From: Kieran Bingham <kieran.bingham@ideasonboard.com>
>>
>> Provide a means to compare two identically sized framebuffers.
>>
>> This basic implementation expects the two buffers to have the same
>> formats and sizes, and will return zero for identical frames, or a
>> positive float representing and average difference otherwise.
>>
>> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
>> ---
>>   kms++util/inc/kms++util/kms++util.h |  1 +-
>>   kms++util/src/verification.cpp      | 31 ++++++++++++++++++++++++++++++-
>>   py/pykms/pykmsutil.cpp              |  2 ++-
>>   3 files changed, 34 insertions(+)
>>
>> diff --git a/kms++util/inc/kms++util/kms++util.h
>> b/kms++util/inc/kms++util/kms++util.h
>> index 431de0bb159a..753cee189451 100644
>> --- a/kms++util/inc/kms++util/kms++util.h
>> +++ b/kms++util/inc/kms++util/kms++util.h
>> @@ -29,6 +29,7 @@ void draw_color_bar(IFramebuffer& buf, int old_xpos, int
>> xpos, int width);
>>   void draw_test_pattern(IFramebuffer &fb, YUVType yuvt = YUVType::BT601_Lim);
>>     void save_raw_frame(IFramebuffer& fb, const char *filename);
>> +float compare_framebuffers(IFramebuffer& a, IFramebuffer& b);
>>   }
>>     #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
>> diff --git a/kms++util/src/verification.cpp b/kms++util/src/verification.cpp
>> index 3210bb144d2b..a46d6f924095 100644
>> --- a/kms++util/src/verification.cpp
>> +++ b/kms++util/src/verification.cpp
>> @@ -18,4 +18,35 @@ void save_raw_frame(IFramebuffer& fb, const char *filename)
>>           os->write((char*)fb.map(i), fb.size(i));
>>   }
>>   +float compare_framebuffers(IFramebuffer& a, IFramebuffer& b)
> 
> I think this needs a short comment above to explain the return value.

Certainly.

As suggested by Geert, this will become an MSE. I'll document this in the next
version.

> 
>> +{
>> +    unsigned int i;
>> +    unsigned int pixels = a.width() * a.height();
>> +    uint8_t *pa = a.map(0);
>> +    uint8_t *pb = b.map(0);
> 
> This is only checking plane 0, you need to go through all the planes.

Yes, I must confess this version is the exceedingly rushed version after
chopping out my rather failed attempt at supporting multiple image formats doing
pixel level comparisons rather than byte level.

I'm hoping by v2 I'll be back to a much improved state here... but as this was
(eventually marked) RFC, and I had a deadline to post my current state - this
was the quickest basic implementation.


> Also, it's much nicer to introduce the locals near where they are needed,
> instead of having them all in the beginning of the function.

Ahhh - that's the C kernel developer in me. All variables defined at the
beginning of the function.

I can adjust this as you wish.

>> +
>> +    float diff = 0;
>> +
>> +    if (a.format() != b.format())
>> +        throw std::invalid_argument("Pixel formats differ...");
>> +
>> +    if ((a.width() != b.width() ||
>> +        (a.height() != b.height())))
>> +        throw std::invalid_argument("Frame sizes differ...");
>> +
>> +    // Formats are identical, so num_planes are already identical
>> +    for (i = 0; i < a.num_planes(); i++) {
>> +        if ((a.offset(i) != b.offset(i)) ||
>> +            (a.stride(i) != b.stride(i)))
>> +            throw std::invalid_argument("Planes differ...");
>> +    }
>> +
>> +    // Simple byte comparisons to start.
>> +    // This expects a frame to be identical, including non-visible data.
>> +    for (i = 0; i < a.size(0) && i < b.size(0); i++)
>> +        diff += abs(pa[i] - pb[i]);
> 
> I don't think it's a good idea compare the non-valid pixels. They could as well
> contain random data.

Absolutely agreed - I apologise for posting a very basic early version here.
I screwed up somewhere in my more complex implementation and came up against a
lack of time - so I fell back to the basic implementation which was still
functional for my needs at the higher level.

> Better to do the check properly, using the pixels inside width and height only,
> without making assumptions about the buffer layout. And that way you can drop
> the check for offset and stride, as they don't have to be the same, as long as
> width & height are the same.

Completely agreed here too.

It was getting the YUYV pixel iterators right that caught me out, and broke my
other implementation. I'll try to find time to fix things up and resubmit.

Thankyou for your time and comments.

I'm pleased that you are positive towards receiving an implementation here, and
I hope it can be useful in other projects.

>  Tomi

Regards

Kieran
