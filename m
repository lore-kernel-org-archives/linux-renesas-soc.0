Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f170.google.com ([209.85.223.170]:32922 "EHLO
        mail-io0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750954AbdEBKWZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 May 2017 06:22:25 -0400
Received: by mail-io0-f170.google.com with SMTP id o22so22247493iod.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 May 2017 03:22:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170501091236.4nsznozv23wx2izm@ninjato>
References: <20170501091236.4nsznozv23wx2izm@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 May 2017 12:22:24 +0200
Message-ID: <CAMuHMdVdVEJb117yJ6BUqqq7T6zYR+MpJ4j1K=-8SfoKTy5NZQ@mail.gmail.com>
Subject: Re: [PULL REQUEST] renesas/topic/sdhi-cmd23 for renesas drivers
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On Mon, May 1, 2017 at 11:12 AM, Wolfram Sang <wsa@the-dreams.de> wrote:
> here is a new topic branch for renesas-drivers based on mmc/next as of
> today. There are likely going to be conflicts once Simon publishes his
> SDHI DMA refactor work. Please drop this branch then, I think it is best
> if I will provide you with a rebased version once this happens. We will
> see. But for now, please pull.
>
> Kind regards,
>
>    Wolfram
>
>
> The following changes since commit a627f025eb0534052ff451427c16750b3530634c:
>
>   mmc: sdhci-of-esdhc: limit SD clock for ls1012a/ls1046a (2017-04-28 14:53:13 +0200)
>
> are available in the git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/topic/sdhi-cmd23
>
> for you to fetch changes up to 7e4df752d57931e2962254e18cee12890f9018ce:
>
>   mmc: sdhi: add CMD23 support to R-Car Gen2 & Gen3 (2017-05-01 10:52:56 +0200)

Thank you, looks good!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
