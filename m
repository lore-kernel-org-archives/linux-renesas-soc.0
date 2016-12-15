Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:32860 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751670AbcLOKyF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Dec 2016 05:54:05 -0500
Received: by mail-it0-f68.google.com with SMTP id c20so3173908itb.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Dec 2016 02:53:27 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20161215104204.GA1962@katana>
References: <20161215104204.GA1962@katana>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Dec 2016 11:53:26 +0100
Message-ID: <CAMuHMdX0MS8rmYBjSabEJ-vPoHPj-hgELY9reMMtazGN8ouBGw@mail.gmail.com>
Subject: Re: [PULL REQUEST] renesas/topic/sdhi-emmc-hs for renesas drivers
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On Thu, Dec 15, 2016 at 11:42 AM, Wolfram Sang <wsa@the-dreams.de> wrote:
> here is a topic branch for renesas-drivers adding HS200 support to SDHI.
> It is based on the tag "renesas-drivers-2016-12-06-v4.9-rc8" because the
> feature is built on top of the SDR104 series by Simon which was merged
> upstream just recently in the merge window. Is this okay? Or do you
> prefer another branch based on v4.10-rc1 once it is available?

Please don't base pull requests on old renesas-drivers releases, if possible,
else I'll have to rebase your branch(es) myself.

>       mmc: sh_mobile_sdhi: simplify accessing DT data
>       mmc: sh_mobile_sdhi: improve prerequisite for hw_reset
>       mmc: sh_mobile_sdhi: improve prerequisites for tuning
>       mmc: sh_mobile_sdhi: remove superfluous check in hw_reset
>       mmc: sh_mobile_sdhi: remove superfluous check in init_tuning
>       mmc: sh_mobile_sdhi: remove superfluous check in SCC error check
>       mmc: sh_mobile_sdhi: enable HS200

Please base this on Ulf's mmc/next, or on v4.10-rc1 once it becomes available.

>       arm64: dts: r8a7795: enable HS200 for eMMC
>       arm64: dts: r8a7796: enable HS200 for eMMC

Please base this on an appropriate reasonable stable tree, e.g.
renesas-devel-20161212-v4.9.

Thank you!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
