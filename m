Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f49.google.com ([74.125.82.49]:36368 "EHLO
        mail-wm0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752852AbdAZIHr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jan 2017 03:07:47 -0500
Received: by mail-wm0-f49.google.com with SMTP id c85so60124159wmi.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jan 2017 00:07:46 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170125202810.16876-1-chris.brandt@renesas.com>
References: <20170125202810.16876-1-chris.brandt@renesas.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 26 Jan 2017 09:07:45 +0100
Message-ID: <CAPDyKFq=K4ZwyMnM2twVHW6K43U+rADBX3KFyc5o0UzR2kb10w@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] mmc: sh_mobile_sdhi: fix missing r7s72100 clocks
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 25 January 2017 at 21:28, Chris Brandt <chris.brandt@renesas.com> wrote:
> At first this started out as a simple typo fix, until I realized
> that the SDHI in the RZ/A1 has 2 clocks per channel and both need
> to be turned on/off.
>
> This patch series adds the ability to specify 2 clocks instead of
> just 1, and does so for the RZ/A1 r7s72100.
>
> This patch has been tested on an RZ/A1 RSK board. Card detect works
> fine as well as bind/unbind.
>
> v6:
> * more detailed descritpion in tmio_mmc.txt
>
> v5:
> * Take implementation details out of DT documentation and put into
>   the driver code.
>
> v4:
> * No code changes, only text udpates to explain why there are 2 clocks
>   and why we need to treat them as 1 clock.
>
> Chris Brandt (3):
>   mmc: sh_mobile_sdhi: add support for 2 clocks
>   mmc: sh_mobile_sdhi: explain clock bindings
>   ARM: dts: r7s72100: update sdhi clock bindings
>
>  Documentation/devicetree/bindings/mmc/tmio_mmc.txt | 13 ++++++++++++
>  arch/arm/boot/dts/r7s72100.dtsi                    | 17 +++++++++++-----
>  drivers/mmc/host/sh_mobile_sdhi.c                  | 23 ++++++++++++++++++++++
>  include/dt-bindings/clock/r7s72100-clock.h         |  6 ++++--
>  4 files changed, 52 insertions(+), 7 deletions(-)
>
> --
> 2.10.1
>
>

Thanks, applied patch1 and patch2 for next. Patch3 is for Simon, I
guess!? (And I can add Rob's ack afterwards).

Kind regards
Uffe
