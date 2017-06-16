Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:33171 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751755AbdFPGf2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Jun 2017 02:35:28 -0400
Received: by mail-it0-f68.google.com with SMTP id g184so1440100ita.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Jun 2017 23:35:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87lgosixo3.wl%kuninori.morimoto.gx@renesas.com>
References: <87d1a77yll.wl%kuninori.morimoto.gx@renesas.com>
 <20170615135606.GB22158@verge.net.au> <87lgosixo3.wl%kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 16 Jun 2017 08:35:26 +0200
Message-ID: <CAMuHMdWxB03zf0NBYCfG8U5_UfrxaiSCd2OvMh__TuLJTRR_UA@mail.gmail.com>
Subject: Re: [PATCH] arch/arm64: defconfig: Compile Renesas Sound related
 drivers as Module
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san,

On Fri, Jun 16, 2017 at 2:33 AM, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>> > -CONFIG_SND_SOC_RCAR=y
>> > -CONFIG_SND_SOC_AK4613=y
>> > -CONFIG_SND_SIMPLE_CARD=y
>> > +CONFIG_SND_SOC_RCAR=m
>> > +CONFIG_SND_SOC_AK4613=m
>> > +CONFIG_SND_SIMPLE_CARD=m
>>
>> Do other drivers depend on any pf the above?
>> If so what are the implications here?
>
> SOC_RCAR is Renesas specific, no other driver is depends on it.
> SOC_AK4613 is Codec and maybe Renesas only is using it, but I don't know.
> no other driver is depends on it I think.

"git grep -w asahi-kasei,ak4613" tells me only Renesas DTS files use it.

> SIMPLE_CARD might be used from some other ARM64 platform.

So you want to run this through linux-arm-kernel...
Although I agree it's a good idea to make non-critical components modules
in arm64_defconfig.

> This patch should focus only for RCAR and AK4613 ?

That's another option. SIMPLE_CARD can be handled in a follow-up
patch, as it may need more buy-in.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
