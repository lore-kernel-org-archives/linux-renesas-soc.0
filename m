Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:35382 "EHLO
        mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751466AbdAYOhr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Jan 2017 09:37:47 -0500
Received: by mail-io0-f193.google.com with SMTP id m98so2052099iod.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Jan 2017 06:37:47 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <SG2PR06MB1165B0BB2EBCD6178528E00B8A740@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <SG2PR06MB116554401FE404334E924EE38A720@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAMuHMdVaF=DpacHTV_T6nVcJMF-GfcRd3ybj-yagAy2nj_TeCw@mail.gmail.com>
 <SG2PR06MB1165A003EAAACA6C9771FA798A750@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAMuHMdWn0C6W3Ueb9cYDUcXMnSZVRNn8pax+y7Zyy_P=1t2gGg@mail.gmail.com>
 <SG2PR06MB11654DEF72DE224D798D19D68A750@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAMuHMdWeL21_OJkH4XVATxfYZwutWTTh7mfDLy=17d95RLC5Hg@mail.gmail.com> <SG2PR06MB1165B0BB2EBCD6178528E00B8A740@SG2PR06MB1165.apcprd06.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Jan 2017 15:37:45 +0100
Message-ID: <CAMuHMdV3=xVgsMcmgduQk43sLms3qserj50-0QU+kKibAvMxJQ@mail.gmail.com>
Subject: Re: [RFC] Runtime PM on the RZ/A series is never going to work right
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Chris,

On Wed, Jan 25, 2017 at 3:35 PM, Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Wednesday, January 25, 2017, Geert Uytterhoeven wrote:
>> > But won't the individual drivers still want to keep turning clocks on
>> and off manually?
>> > (unless I'm not understanding that the underlying clock routines will
>> basically just
>> > ignore everything). But even if that' the case...that just wasted CPU
>> cycles (remember,
>> > I'm only working with a 400MHz single core here running XIP_KERNEL)
>>
>> If a clock is already enabled, preparing and/or enabling it again will
>> just
>> increase the prepare resp. enable counters. Disabling/unpreparing
>> afterwards
>> will also just decrease the counters. Should be quite cheap
>
> OK, I think I see your point:
>
> If I go and double-enable a clock, then the runtime pm won't do much
> of anything because I'll always be a count higher so a true 'clock disable'
> will never really occur. Is that correct?

That's correct.

> #I'm getting side tracked from what I really started to do which was test
> out PFC for i2c and spi :(

Welcome to the world of scratching your (increasing number of) itches ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
