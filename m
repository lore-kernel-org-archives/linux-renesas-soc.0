Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f195.google.com ([209.85.217.195]:33163 "EHLO
        mail-ua0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751356AbeDWIBx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Apr 2018 04:01:53 -0400
Received: by mail-ua0-f195.google.com with SMTP id q26so9613234uab.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Apr 2018 01:01:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87zi1ubt6d.wl%kuninori.morimoto.gx@renesas.com>
References: <8736zmd7wi.wl%kuninori.morimoto.gx@renesas.com> <87zi1ubt6d.wl%kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 23 Apr 2018 10:01:51 +0200
Message-ID: <CAMuHMdVtELSLp9s+RF-dWxPF7=j1Ht0==LQSn5RZJvU2fhJ4Sw@mail.gmail.com>
Subject: Re: [PATCH 02/10] arm64: defconfig: Enable CONFIG_SND_AUDIO_GRAPH_CARD
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Simon <horms@verge.net.au>, Nguyen Viet Dung <nv-dung@jinso.co.jp>,
        Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san,

On Mon, Apr 23, 2018 at 3:39 AM, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> CONFIG_SND_AUDIO_GRAPH_CARD is needed to use HDMI sound with video
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Tested-by: Nguyen Viet Dung <nv-dung@jinso.co.jp>

Thanks for your patch!

> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -440,6 +440,7 @@ CONFIG_SND_SOC_SAMSUNG=y
>  CONFIG_SND_SOC_RCAR=m
>  CONFIG_SND_SOC_AK4613=m
>  CONFIG_SND_SIMPLE_CARD=y
> +CONFIG_SND_AUDIO_GRAPH_CARD=y

Perhaps "m"?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
