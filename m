Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:34549 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752148AbdF3Lav (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Jun 2017 07:30:51 -0400
MIME-Version: 1.0
In-Reply-To: <20170630105649.16137-2-wsa+renesas@sang-engineering.com>
References: <20170630105649.16137-1-wsa+renesas@sang-engineering.com> <20170630105649.16137-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 30 Jun 2017 13:30:49 +0200
Message-ID: <CAMuHMdVaQG5+-XRfycONtC0pgfJNjdnAyf2+62CuopdWrpqDRQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] mmc: tmio: remove obsolete TMIO_BBS
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Jun 30, 2017 at 12:56 PM, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Since commit 10c7fcbd0f00a0 ("ARM: shmobile: sh7372: Remove ZBOOT
> MMC/SDHI support"), this define is not needed anymore.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
