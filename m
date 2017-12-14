Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:45490 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750795AbdLNK2h (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Dec 2017 05:28:37 -0500
Subject: Re: [PATCH 4/4] kms++util: Add frame compare functionality
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <cover.1a04e7d4a0006d06c345704eb5332e82c73312ee.1513206331.git-series.kieran.bingham@ideasonboard.com>
 <29f0046ac6a6e4f9337aa66c912d99fa4a30d592.1513206331.git-series.kieran.bingham@ideasonboard.com>
 <CAMuHMdX2d8Ak6iekZXH9CO6kcnrM-eA=n5phNCnkh_OZWpK1sw@mail.gmail.com>
From: Kieran Bingham <kbingham@kernel.org>
Message-ID: <51e3ade1-efe8-79b5-d989-85c1d43d2ca6@kernel.org>
Date: Thu, 14 Dec 2017 10:28:33 +0000
MIME-Version: 1.0
In-Reply-To: <CAMuHMdX2d8Ak6iekZXH9CO6kcnrM-eA=n5phNCnkh_OZWpK1sw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On 14/12/17 08:52, Geert Uytterhoeven wrote:
> Hi Kieran,
> 
> On Thu, Dec 14, 2017 at 12:10 AM, Kieran Bingham <kbingham@kernel.org> wrote:
>> From: Kieran Bingham <kieran.bingham@ideasonboard.com>
>>
>> Provide a means to compare two identically sized framebuffers.
>>
>> This basic implementation expects the two buffers to have the same
>> formats and sizes, and will return zero for identical frames, or a
>> positive float representing and average difference otherwise.
> 
> an
> 
>> --- a/kms++util/src/verification.cpp
>> +++ b/kms++util/src/verification.cpp
>> @@ -18,4 +18,35 @@ void save_raw_frame(IFramebuffer& fb, const char *filename)
>>                 os->write((char*)fb.map(i), fb.size(i));
>>  }
>>
>> +float compare_framebuffers(IFramebuffer& a, IFramebuffer& b)
>> +{
> 
>> +       // This expects a frame to be identical, including non-visible data.
>> +       for (i = 0; i < a.size(0) && i < b.size(0); i++)
>> +               diff += abs(pa[i] - pb[i]);
> 
> I think it's better to use "diff += abs(pa[i] - pb[i]) * abs(pa[i] - pb[i])",
> to penalize larger differences.
> 
> See also https://en.wikipedia.org/wiki/Peak_signal-to-noise_ratio

Ah yes of course - an excellent suggestion!

Thanks.


>> +
>> +       return diff / pixels;
>> +}
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 

-- 
--
Kieran
