Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f65.google.com ([209.85.213.65]:45181 "EHLO
        mail-vk0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732269AbeGaRGY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 31 Jul 2018 13:06:24 -0400
Received: by mail-vk0-f65.google.com with SMTP id b78-v6so7705063vka.12
        for <linux-renesas-soc@vger.kernel.org>; Tue, 31 Jul 2018 08:25:34 -0700 (PDT)
MIME-Version: 1.0
References: <20180725152244.fykhouzwpr5mmlpy@verge.net.au>
In-Reply-To: <20180725152244.fykhouzwpr5mmlpy@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 31 Jul 2018 17:25:20 +0200
Message-ID: <CAMuHMdUB5Nzab1cc+_i2akhebgpcaD=ivFLViUjE7k+4T0ez3g@mail.gmail.com>
Subject: Re: [LTSI-dev] [GIT/RFC PULL LTSI-4.14] Renesas SoCs and Drivers to v4.18-rc6
To: Simon Horman <horms@verge.net.au>
Cc: ltsi-dev@lists.linuxfoundation.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Wed, Jul 25, 2018 at 5:23 PM Simon Horman <horms@verge.net.au> wrote:
> ** This series is for informational purposes only! **
>
> This series is comprised of backports to v4.14.57 of the components used by
> Renesas SoCs to their standard as of v4.18-rc6, selected dependencies for
> those backports and selected post-v4.18-rc6 fixes as detailed in the git
> changelog text below.
>
> This is intended as dry-run of backports components used by
> Renesas SoCs from v4.18 to v4.14.57.
>
> There are 1601 patches.
>
> As this work is for informational purposes I do not expect these patches
> to be imported to quilt by Greg at this time. However, if you would like to
> do so and rebasing would help please feel free to ask me to do so.
>
> I do plan to post an updated version of this work once the
> LTSI-4.14 merge window opens. As part of that work I intend
> to address the following known problems:
>
> * R-Car H1 / Marzen does not boot to user-space due to an upstream
>   regression in the R-Car Thermal driver which I have posted a fix for.
>
>   "[PATCH] thermal: rcar_thermal: avoid NULL dereference in absense of IRQ
>   resources"
>
> * "xhci: Fix use-after-free in xhci_free_virt_device" is already
>   present in v4.14.57 and should be dropped from these backports.
>
> I have performed build testing of this backports on a wide range of
> backports. And boot-to-userspace testing on a wide range of boards
> based on Renesas SoCs. The only regression that testing highlighted
> is that on Marzen as highlighted above.
>
>
> The following changes since commit ecc160ece609498c946e73710e5c7c54c62b966a:
>
>   Linux 4.14.57 (2018-07-22 14:28:52 +0200)
>
> are available in the git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-backport.git backport/v4.14.57/snapshot-to-v4.18-rc6+fixes-flattened

Thank you!

I subjected this to the same testing I do for each renesas-drivers release.
I have detected no regressions from v4.14.48, only increased functionality.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
