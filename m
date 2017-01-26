Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:36034 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751733AbdAZN67 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jan 2017 08:58:59 -0500
Received: by mail-io0-f196.google.com with SMTP id q20so4964027ioi.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jan 2017 05:58:59 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170126100355.GA1435@katana>
References: <20170104173954.3135-1-wsa+renesas@sang-engineering.com>
 <20170112224353.GB1490@katana> <20170113083719.GE2269@verge.net.au>
 <20170113083928.GD1446@katana> <20170126100116.GC21851@verge.net.au> <20170126100355.GA1435@katana>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Jan 2017 14:58:58 +0100
Message-ID: <CAMuHMdVQVX9T7kxo-akbJQdcTwV2hA4188T57KBMGVdCFYw3jA@mail.gmail.com>
Subject: Re: [PATCH RESEND 0/2] arm64: gen3: enable eMMC HS200 in DT
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Simon Horman <horms@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On Thu, Jan 26, 2017 at 11:03 AM, Wolfram Sang <wsa@the-dreams.de> wrote:
> On Thu, Jan 26, 2017 at 11:01:17AM +0100, Simon Horman wrote:
>> On Fri, Jan 13, 2017 at 09:39:28AM +0100, Wolfram Sang wrote:
>> > > Sorry for missing these.
>> > > I have queued them up for v4.11.
>> >
>> > Thank you!
>>
>> On my r8a7796/salvator-x I see the following with this series applied:
>>
>> sh_mobile_sdhi ee140000.sd: timeout waiting for hardware interrupt (CMD13)
>
> Do you have the HS200 enablement patches in that branch? They are
> currently in -next.

I saw the same thing with renesas-devel last week, only on M3-W.
The same kernel on H3 didn't spew such messages.
According to Shimoda-san, it was due to different eMMCs on H3 and M3-W.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
