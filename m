Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:37525 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932707AbcI3M4C (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Sep 2016 08:56:02 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jithin T Raj <jithin.t@tataelxsi.co.in>
Cc: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: RGB-LVDS BRIDGE  SUPPORT RCAR E2
Date: Fri, 30 Sep 2016 15:55:58 +0300
Message-ID: <1852980.R4oQfLab5H@avalon>
In-Reply-To: <SG2PR0401MB1296AB21B1EB9B072EAF7B93D8C10@SG2PR0401MB1296.apcprd04.prod.outlook.com>
References: <SG2PR0401MB1296AB21B1EB9B072EAF7B93D8C10@SG2PR0401MB1296.apcprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jithin,

On Friday 30 Sep 2016 11:38:09 Jithin T Raj wrote:
>      Thank you so much for the information.
> 
> Now i compared "arch/arm/boot/dts/r8a7779-marzen.dts" against 
> "arch/arm/boot/dts/r8a7794-alt.dts" and modified r8a7794-alt.dts a little..
> also added  "thc63lvdm87"in "drivers/gpu/drm/rcar-du/rcar_du_kms.c"..here i
> am attaching the modified r8a7794-alt.dts file..I am a newby in this field
> so that I am asking very basics..hope you don't feel bore.. I also build
> image file and .dtb file successfully but don't deployed it.. if you don't
> mind can you please give me a feedback of my work..My source tree is v4.7.5

Could you please send your changes as an inline diff (which you can generate 
with git diff) instead of as a source file attachment ? That will let us 
reviewing it easily and replying inline.

-- 
Regards,

Laurent Pinchart
