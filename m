Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:36315 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751054AbdFSGSC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jun 2017 02:18:02 -0400
Received: by mail-io0-f195.google.com with SMTP id i93so10165176iod.3
        for <linux-renesas-soc@vger.kernel.org>; Sun, 18 Jun 2017 23:18:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87k24825wi.wl%kuninori.morimoto.gx@renesas.com>
References: <87fuf0iuiq.wl%kuninori.morimoto.gx@renesas.com>
 <20170616133813.GC26834@verge.net.au> <87k24825wi.wl%kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Jun 2017 08:18:00 +0200
Message-ID: <CAMuHMdWFK5XRJ8-GBxvDAHqEyTUo_2vamBttoEjDgvnEFdFu9Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: renesas: salvator-common: sound clock-frequency
 needs descending order
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san,

On Mon, Jun 19, 2017 at 2:16 AM, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>> On Fri, Jun 16, 2017 at 01:41:20AM +0000, Kuninori Morimoto wrote:
>> > From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>> >
>> > It will be used ADG clock initial settings, and will be
>> > sound codec's initial system clock which needs maximum clock frequency.
>> > Thus, descending order is required
>> >
>> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>>
>> Thanks, I have queued this up for v4.14.
>
> Sorry for bother you, but is it possible this patch in v4.13 ?

I guess you forgot to add these tags, that would have hinted Simon they are
fixes for commits he was about to send a pull request for to arm-soc?

Fixes: d37d2b3c0ec2708a ("arm64: dts: salvator-x: add 12288000 for sound ADG")
Fixes: 0b03c32db03d63de ("arm64: dts: r8a7795: salvator-x: Add support
for R-Car H3 ES2.0")

In the mean time Olof has pulled them...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
