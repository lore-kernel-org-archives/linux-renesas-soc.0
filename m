Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f47.google.com ([209.85.214.47]:37825 "EHLO
        mail-it0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752010AbdFLKGC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Jun 2017 06:06:02 -0400
Received: by mail-it0-f47.google.com with SMTP id m47so18315882iti.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jun 2017 03:06:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170612094718.GD15434@verge.net.au>
References: <20170612094718.GD15434@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 Jun 2017 12:06:00 +0200
Message-ID: <CAMuHMdVn2oPBbF0xpWjKdRmLwGdA9OJcrt+o4BLOTLypS8=6dw@mail.gmail.com>
Subject: Re: [GIT PULL FOR renesas-drivers] mmc: renesas_sdhi: add support for
 R-Car Gen3 SDHI DMAC
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Mon, Jun 12, 2017 at 11:47 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> please consider pulling changes to add support for R-Car Gen3 SDHI DMAC.
>
> This gives a significant performance boost;
> the headline figure is 9.5MB/s -> 39.7MB/s.
>
> This pull request is based on mmc/next.

Unfortunately Ulf rebases mmc/next regularly, causing lots of conflicts.

> The following changes since commit 6e75316c15df8333506377743c75fcd626193849:
>
>   mmc: tmio: make sure SDIO gets reinitialized after resume (2017-05-30 11:51:55 +0200)
>
> are available in the git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git topic/sdhi-gen3-dma-2017
>
> for you to fetch changes up to fd9437fc8884f039ba4a510ac99d350fd693b0dc:
>
>   mmc: renesas-sdhi: remove gen3 support from sysc dmac driver (2017-06-08 15:03:03 +0200)

So feel free to rebase the top 5 commits on top of today's mmc/next (and
risk new conflicts if/when Ulf rebases his tree again tonight), or let me handle
that tomorrow myself ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
