Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f193.google.com ([209.85.216.193]:45451 "EHLO
        mail-qt0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750749AbdLNImM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Dec 2017 03:42:12 -0500
MIME-Version: 1.0
In-Reply-To: <2071409.IhY2XtxFIN@avalon>
References: <87374oz9f9.wl%kuninori.morimoto.gx@renesas.com>
 <4708231.IEM7dkWZuQ@avalon> <871sjyqd99.wl%kuninori.morimoto.gx@renesas.com> <2071409.IhY2XtxFIN@avalon>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Dec 2017 09:42:10 +0100
Message-ID: <CAMuHMdWvFWRU0LALJDowHiPr99su8FtQ0F_PspUWf1gwKw2xsw@mail.gmail.com>
Subject: Re: [PATCH v2] drm: rcar-du: calculate DPLLCR to be more small jitter
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        David Airlie <airlied@linux.ie>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Thu, Dec 14, 2017 at 9:17 AM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Thursday, 14 December 2017 04:10:27 EET Kuninori Morimoto wrote:
>> >> +                  if ((fvco < 2000) ||
>> >> +                      (fvco > 4096000000ll))
>> >
>> > No need for the inner parentheses, and you can write both conditions on a
>> > single line. Furthemore 4096 MHz will fit in a 32-bit number, so there's
>> > no need for the ll.
>>
>> Yes, but compiled by 32bit too, right ?
>> Without this "ll", 32bit compiler say
>>
>>       warning: this decimal constant is unsigned only in ISO C90
>
> That's right. How about 4096000000UL then, to force unsigned integer types ?
> Or possibly even better, 4096 * 1000 * 1000UL to make it more readable ?

If it's just about making the number unsigned, and not about 64-bit arithmetic,
a "U" suffix should be sufficient.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
