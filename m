Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:34767 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751897AbdAYOia (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Jan 2017 09:38:30 -0500
Received: by mail-it0-f65.google.com with SMTP id o185so2115079itb.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Jan 2017 06:38:30 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <878tr9yj82.wl%kuninori.morimoto.gx@renesas.com>
References: <878tr9yj82.wl%kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Jan 2017 15:38:28 +0100
Message-ID: <CAMuHMdW7AR8uAbdYtAtQENDSG2sNCHDRyAqzrMQiB9GZrC6nZA@mail.gmail.com>
Subject: Re: [PATCH] arm64: renesas: r8a7795: tidyup audma definition order
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Simon <horms@verge.net.au>,
        Niklas Soderlund <niklas.soderlund@ragnatech.se>,
        Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san,

On Wed, Dec 21, 2016 at 5:56 AM, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Current r8a7795.dtsi defines audma -> ipmmu -> dma order.
> Because of this order, dma can connect to ipmmu, but
> audma can't connect to it.
> This patch moves audma order as ipmmu -> dma -> audma.

Does "[PATCH V7 00/11] IOMMU probe deferral support" help?
https://www.spinics.net/lists/arm-kernel/msg557110.html

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
