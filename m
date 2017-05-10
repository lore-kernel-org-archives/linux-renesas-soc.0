Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f53.google.com ([209.85.214.53]:38289 "EHLO
        mail-it0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751507AbdEJLVz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 May 2017 07:21:55 -0400
Received: by mail-it0-f53.google.com with SMTP id e65so17926832ita.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 May 2017 04:21:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170510095016.GA31001@verge.net.au>
References: <20170510095016.GA31001@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 10 May 2017 13:21:53 +0200
Message-ID: <CAMuHMdWNWchXOCJqmy=TAhGLwHd4DU_EwwKHQDzDJ3EktR91hA@mail.gmail.com>
Subject: Re: [GIT PULL FOR renesas-drivers] mmc: renesas-sdhi: refactor DMA support
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Wed, May 10, 2017 at 11:50 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> please consider pulling the refactoring of DMA support for SDHI (v2).
>
> This pull request is based on mmc-v4.12.
>
> As this pull request conflicts with recent work by Wolfram,
> "[PULL REQUEST] renesas/topic/sdhi-cmd23 for renesas drivers",
> I have provided a sample merge resolution at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git topic/sdhi-refactor-v2+sdhi-cmd23
>
>
> The following changes since commit a627f025eb0534052ff451427c16750b3530634c:
>
>   mmc: sdhci-of-esdhc: limit SD clock for ls1012a/ls1046a (2017-04-28 14:53:13 +0200)
>
> are available in the git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git topic/sdhi-refactor-v2
>
> for you to fetch changes up to 2156a07053f52c85fba8b715116b0241d5fca25b:
>
>   mmc: renesas-sdhi: make renesas_sdhi_sys_dmac main module file (2017-05-09 15:19:55 +0200)

Thank you. Looks good, and merges cleanly into today's linux-next.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
