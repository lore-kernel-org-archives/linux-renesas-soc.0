Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f67.google.com ([209.85.213.67]:39946 "EHLO
        mail-vk0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753645AbeDXJxQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Apr 2018 05:53:16 -0400
Received: by mail-vk0-f67.google.com with SMTP id x204so11226103vkd.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Apr 2018 02:53:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180424093621.sencraxrhodsw3io@verge.net.au>
References: <8736zmd7wi.wl%kuninori.morimoto.gx@renesas.com>
 <87zi1ubt6d.wl%kuninori.morimoto.gx@renesas.com> <CAMuHMdVtELSLp9s+RF-dWxPF7=j1Ht0==LQSn5RZJvU2fhJ4Sw@mail.gmail.com>
 <20180424093621.sencraxrhodsw3io@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Apr 2018 11:53:15 +0200
Message-ID: <CAMuHMdXWbeZpaaf9X1pd4NTD7ibgmGTj6c7sxr3ihqvSrWo=yQ@mail.gmail.com>
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

On Tue, Apr 24, 2018 at 11:36 AM, Simon Horman <horms@verge.net.au> wrote:
> On Mon, Apr 23, 2018 at 10:01:51AM +0200, Geert Uytterhoeven wrote:
>> On Mon, Apr 23, 2018 at 3:39 AM, Kuninori Morimoto
>> <kuninori.morimoto.gx@renesas.com> wrote:
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
> Do you suggest the same for renesas_defconfig?
> That is, patch 2/10?

No. For {shmobile,renesas}_defconfig we make everything builtin.
For {multi_v7,arm64}_defconfig, we usually make non-critical devices modular.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
