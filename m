Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f54.google.com ([209.85.214.54]:56763 "EHLO
        mail-it0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751872AbdIVJQr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Sep 2017 05:16:47 -0400
Received: by mail-it0-f54.google.com with SMTP id g18so713959itg.5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 Sep 2017 02:16:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170915180301.29175-1-wsa+renesas@sang-engineering.com>
References: <20170915180301.29175-1-wsa+renesas@sang-engineering.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 22 Sep 2017 11:16:46 +0200
Message-ID: <CAPDyKFrK9O+8U=4LmFMLk1h5vBsS8ky7xN9+XjajppkpoNGyfQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] mmc: support eMMC driver type selection with DT
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 15 September 2017 at 20:02, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Some of the Renesas R-Car boards need to set the eMMC driver type to type 1 to
> get stable HS200/400 speeds (HS400 support not upstream yet). Because the eMMC
> memories are fixed (and thus the drive type), I decided to implement the DT
> setup in a similar fashion to ACPI [1]. While implementing, I realized that all
> I did was not Renesas specific but generic, so I ended up putting it into the
> core.
>
> So, whenever the new property (introduced in patch 1) is used, and there is no
> host driver specific select_drive_strength callback, then the generic callback
> (introduced in patch 2) is used. An example usage can be found in patch 3.
>
> Note that currently only eMMC is handled, but the code is designed for easy SD
> addition if that ever becomes necessary.
>
> A branch for the Salvator-XS board can be found here:
>
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/topic/emmc-drive-strength
>
> A wiki page describing my test procedure can be found here:
>
> http://elinux.org/Tests:eMMC-fixed-drive-strength
>
> Looking forward to comments about this approach.
>
> All the best,
>
>    Wolfram
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=51ced59cc02e0d08f61772c888480b9b1749cef1
>
> Wolfram Sang (3):
>   mmc: describe new eMMC binding for fixed driver type
>   mmc: parse new binding for eMMC fixed driver type
>   arm64: renesas: salvator-xs: set driver type for eMMC
>
>  Documentation/devicetree/bindings/mmc/mmc.txt      |  3 +++
>  .../arm64/boot/dts/renesas/r8a7795-salvator-xs.dts |  4 ++++
>  drivers/mmc/core/core.c                            | 28 ++++++++++++++++++----
>  drivers/mmc/core/host.c                            | 11 ++++++++-
>  include/linux/mmc/host.h                           |  2 ++
>  5 files changed, 42 insertions(+), 6 deletions(-)

Looks good to me. Awaiting a v2 before applying allowing you to take
care of the comment from Rob.

Kind regards
Uffe
