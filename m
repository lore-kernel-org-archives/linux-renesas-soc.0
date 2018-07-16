Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f66.google.com ([209.85.213.66]:35558 "EHLO
        mail-vk0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727265AbeGPQGz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Jul 2018 12:06:55 -0400
MIME-Version: 1.0
References: <20180716121927.21918-1-niklas.soderlund+renesas@ragnatech.se> <20180716121927.21918-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20180716121927.21918-2-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Jul 2018 17:38:44 +0200
Message-ID: <CAMuHMdVhArv+AvG-=vq7bk5KBsyEoaaBCWTcgUoLnYtr9wWTFQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] ravb: fix shadowing of symbol 'stats' in ravb_get_ethtool_stats()
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        netdev <netdev@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jul 16, 2018 at 2:20 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Inside a loop in ravb_get_ethtool_stats() a variable 'stats' is declared
> resulting in the argument also named 'stats' to be shadowed. Fix this
> warning by renaming the unused argument 'stats' to 'estats'.
>
> This fixes the sparse warning:
>
> ravb_main.c:1225:36: originally declared here
> ravb_main.c:1233:41: warning: symbol 'stats' shadows an earlier one
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
