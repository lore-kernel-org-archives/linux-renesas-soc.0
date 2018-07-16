Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f193.google.com ([209.85.217.193]:38775 "EHLO
        mail-ua0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727653AbeGPQNp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Jul 2018 12:13:45 -0400
MIME-Version: 1.0
References: <20180716121927.21918-1-niklas.soderlund+renesas@ragnatech.se> <20180716121927.21918-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20180716121927.21918-3-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Jul 2018 17:45:32 +0200
Message-ID: <CAMuHMdUpWKwzxgYfaqjuW-dbS06d0VedsDi1zspbYQtvVo9_ag@mail.gmail.com>
Subject: Re: [PATCH 2/3] ravb: fix warning about memcpy length
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
> This fixes sparse warning:
>
> ravb_main.c:1257 ravb_get_strings() error: memcpy() '*ravb_gstrings_stats' too small (32 vs 960)
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
