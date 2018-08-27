Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f65.google.com ([209.85.222.65]:46910 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726920AbeH0Syw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Aug 2018 14:54:52 -0400
Received: by mail-ua1-f65.google.com with SMTP id u11-v6so9699620uan.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Aug 2018 08:07:52 -0700 (PDT)
MIME-Version: 1.0
References: <20180812133149.7710-1-erosca@de.adit-jv.com> <20180812133149.7710-3-erosca@de.adit-jv.com>
In-Reply-To: <20180812133149.7710-3-erosca@de.adit-jv.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Aug 2018 17:07:39 +0200
Message-ID: <CAMuHMdX_gzXfKVLN+2N3Djn+TTRfZYKdmE3-gtD1HJSPjXv1cQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] pinctrl: sh-pfc: r8a77965: Add HSCIF0 pins,
 groups, and functions
To: Eugeniu Rosca <roscaeugeniu@gmail.com>
Cc: Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Magnus Damm <damm+renesas@opensource.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <rosca.eugeniu@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Eugeniu,

On Sun, Aug 12, 2018 at 3:33 PM Eugeniu Rosca <roscaeugeniu@gmail.com> wrote:
> According to R-Car Gen3 HW manual Rev.1.00 Apr 2018, M3-N SoC implements
> five (0..4) HSCIF channels, similar to H3, M3-W and E3.
>
> The story behind this patch is tackling below dmesg warnings, which pop
> up when booting M3NULCB Kingfisher board:
>
> $ dmesg | grep sh-pfc
> sh-pfc e6060000.pin-controller: r8a77965_pfc support registered
> sh-pfc e6060000.pin-controller: function 'hscif0' not supported
> sh-pfc e6060000.pin-controller: invalid function hscif0 in map table
> sh-pfc e6060000.pin-controller: function 'hscif0' not supported
> sh-pfc e6060000.pin-controller: invalid function hscif0 in map table
>
> To fix them, extract the HSCIF0 part from below v4.15-rc1 commits:
>  - commit 7a362e3488cb ("pinctrl: sh-pfc: r8a7795: Add HSCIF pins, groups, and functions")
>  - commit 0e4e4999aac1 ("pinctrl: sh-pfc: r8a7796: Add HSCIF pins, groups, and functions")
>
> Note that `checkpatch --strict` throws several "CHECK: Please use a
> blank line after function/struct/union/enum declarations", which are
> ignored for the sake of staying in sync with the aforementioned commits.
>
> Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>

Thanks for your patch, but please see commit 7628fa811b8af571 ("pinctrl:
sh-pfc: r8a77965: Add HSCIF pins, groups, and functions") in v4.19-rc1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
