Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f43.google.com ([209.85.214.43]:38376 "EHLO
        mail-it0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752133AbdFPHXR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Jun 2017 03:23:17 -0400
MIME-Version: 1.0
In-Reply-To: <20170616071354.GE16534@verge.net.au>
References: <1496927368-18897-1-git-send-email-horms+renesas@verge.net.au>
 <1496927368-18897-4-git-send-email-horms+renesas@verge.net.au>
 <CAMuHMdUkhkDEqsDZUQ94dFnLU+dFcZ+ed=qHokH3sEWGFdkkuw@mail.gmail.com>
 <20170616060602.GA16534@verge.net.au> <CAMuHMdV58Gp+M3eDG3wmgcG6S7L=HBoeFY3gNPVAA1HBWATOcw@mail.gmail.com>
 <20170616070432.GC16534@verge.net.au> <CAMuHMdVpE+2QK2WbfyDCCUq1fzHqnuyAKsGgzj+ZonOwc96w3A@mail.gmail.com>
 <20170616071354.GE16534@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 16 Jun 2017 09:23:15 +0200
Message-ID: <CAMuHMdXP8HXxQWfFf=i3j98q529doO7dpfgLBqhZPHeyYzNo_w@mail.gmail.com>
Subject: Re: [PATCH/RFC 2/5] mmc: tmio: add complete to DMA ops
To: Simon Horman <horms@verge.net.au>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Fri, Jun 16, 2017 at 9:13 AM, Simon Horman <horms@verge.net.au> wrote:
> Sorry for letting this bug creep in to renesas-drivers.
> Do you want a patch against your tree? I will plan to post v2 of
> this patchset soon in any case.

You can post such a patch to please users of renesas-drivers, but I won't
apply it now. I assume the issue will be fixed when next renesas-drivers
release is created ;-)

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
