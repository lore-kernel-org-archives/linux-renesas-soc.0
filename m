Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:35710 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751124AbdC1MHq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Mar 2017 08:07:46 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/4] ARM: dts: r8a7794: Correct clock of DU1
Date: Tue, 28 Mar 2017 15:08:11 +0300
Message-ID: <7112167.AJcfquYAnB@avalon>
In-Reply-To: <1490697933-5849-1-git-send-email-geert+renesas@glider.be>
References: <1490697933-5849-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

Thank you for the patches.

On Tuesday 28 Mar 2017 12:45:29 Geert Uytterhoeven wrote:
> 	Hi Simon, Magnus,
> 
> In the DTS files for the R-Car E2 SoC and for development boards based
> on this SoC, the second channel of the display unit incorrectly points
> to the module clock for the first channel.
> 
> This patch series adds the missing module clock for the second channel,
> and refers to it from the DU device node in the various DTS files.
> 
> Untested due to lack of hardware.

The patches look good to me.

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Geert Uytterhoeven (4):
>   ARM: dts: r8a7794: Add DU1 clock to device tree
>   ARM: dts: r8a7794: Correct clock of DU1
>   ARM: dts: alt: Correct clock of DU1
>   ARM: dts: silk: Correct clock of DU1
> 
>  arch/arm/boot/dts/r8a7794-alt.dts         |  2 +-
>  arch/arm/boot/dts/r8a7794-silk.dts        |  2 +-
>  arch/arm/boot/dts/r8a7794.dtsi            | 10 ++++++----
>  include/dt-bindings/clock/r8a7794-clock.h |  1 +
>  4 files changed, 9 insertions(+), 6 deletions(-)

-- 
Regards,

Laurent Pinchart
