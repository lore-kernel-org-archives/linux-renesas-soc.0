Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f194.google.com ([209.85.217.194]:35103 "EHLO
        mail-ua0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752789AbeDXJbQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Apr 2018 05:31:16 -0400
Received: by mail-ua0-f194.google.com with SMTP id c3so12113049uae.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Apr 2018 02:31:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180424092744.tlwh24csbmtv3q5r@verge.net.au>
References: <8736zmd7wi.wl%kuninori.morimoto.gx@renesas.com>
 <87zi1ubt6d.wl%kuninori.morimoto.gx@renesas.com> <CAMuHMdVtELSLp9s+RF-dWxPF7=j1Ht0==LQSn5RZJvU2fhJ4Sw@mail.gmail.com>
 <20180424092744.tlwh24csbmtv3q5r@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Apr 2018 11:31:14 +0200
Message-ID: <CAMuHMdX=GPzzNey47Ubbxp_ESYzsZLpmzYZ0iQoc5xc=bSkQRw@mail.gmail.com>
Subject: Re: [PATCH 02/10] arm64: defconfig: Enable CONFIG_SND_AUDIO_GRAPH_CARD
To: Simon Horman <horms@verge.net.au>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Nguyen Viet Dung <nv-dung@jinso.co.jp>,
        Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Tue, Apr 24, 2018 at 11:27 AM, Simon Horman <horms@verge.net.au> wrote:
> On Mon, Apr 23, 2018 at 10:01:51AM +0200, Geert Uytterhoeven wrote:
>> On Mon, Apr 23, 2018 at 3:39 AM, Kuninori Morimoto
>> <kuninori.morimoto.gx@renesas.com> wrote:
>> >
>> > From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>> >
>> > CONFIG_SND_AUDIO_GRAPH_CARD is needed to use HDMI sound with video
>> >
>> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>> > Tested-by: Nguyen Viet Dung <nv-dung@jinso.co.jp>
>>
>> Thanks for your patch!
>>
>> > --- a/arch/arm64/configs/defconfig
>> > +++ b/arch/arm64/configs/defconfig
>> > @@ -440,6 +440,7 @@ CONFIG_SND_SOC_SAMSUNG=y
>> >  CONFIG_SND_SOC_RCAR=m
>> >  CONFIG_SND_SOC_AK4613=m
>> >  CONFIG_SND_SIMPLE_CARD=y
>> > +CONFIG_SND_AUDIO_GRAPH_CARD=y
>>
>> Perhaps "m"?
>
> Hi Geert,
>
> do you plan to review the rest of the series?

No, I'm too scared of audio.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
