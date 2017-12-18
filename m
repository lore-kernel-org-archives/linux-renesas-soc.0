Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f180.google.com ([209.85.220.180]:37534 "EHLO
        mail-qk0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932659AbdLRMGV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Dec 2017 07:06:21 -0500
Received: by mail-qk0-f180.google.com with SMTP id p13so1909453qke.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Dec 2017 04:06:20 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <4127740.6d2LxRg6UI@avalon>
References: <cover.1a04e7d4a0006d06c345704eb5332e82c73312ee.1513206331.git-series.kieran.bingham@ideasonboard.com>
 <1593408.WvHWapkjaJ@avalon> <1c133f3a-1619-a23c-03cb-eee0ea52b64b@ti.com> <4127740.6d2LxRg6UI@avalon>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 Dec 2017 13:06:19 +0100
Message-ID: <CAMuHMdWb6gUr_9Hnnd7Tn6=8a2NadDyYypH-7F-ehXm0pPgMXQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] kms++util: Add verification module
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Mon, Dec 18, 2017 at 12:50 PM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Monday, 18 December 2017 13:46:22 EET Tomi Valkeinen wrote:
>> On 18/12/17 13:36, Laurent Pinchart wrote:
>> > The problem with PNG (or any other format really) is that you not only
>> > need to encode the image into the target format (PNG or JPG would require
>> > external libraries, simpler formats such as BMP or PNM could be handled
>> > internally), but you also need to convert the image to a particular RGB
>> > or YUV format depending on what the output format requires.
>>
>> Yes, that's the "hassle" part I was referring to =).
>>
>> Maybe we need to invent a new file format that can store all kinds of
>> formats? (https://xkcd.com/927/)
>>
>> > If you want to do so, I would like to reuse code from the v4l2convert
>> > library. The code should be moved to a library that doesn't depend on
>> > V4L2, as the current API encapsulate conversion in other operations.
>> > Other tools such as raw2rgbpnm could then be ported to use that library;
>>
>> Yep, so I agree that doing color format conversions shouldn't really be
>> kms++'s job, but at the same time I'd like to be able to export
>> framebuffers.
>>
>> And I'm fine with adding dependencies to kms++, as long as all those are
>> optional.
>>
>> Aren't there "big" image conversion libraries that would do the job?
>> Imagemagick? Or something? I have used "convert" command to do some
>> conversions, that comes from ImageMagick.
>
> That's an option too. I had a look at the code once to find out how
> ImageMagick was performing scaling and gave up with a headache soon
> afterwards. We need more formats than what ImageMagick currently supports
> (it's mostly focused on image file formats instead of raw image formats), with
> all kind of RGB, YUV (and ideally Bayer) formats, and I don't think extending
> ImageMagick would be the way to go.

netpbm is your friend.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
