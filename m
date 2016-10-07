Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:38726 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750786AbcJGEl4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Oct 2016 00:41:56 -0400
Date: Fri, 7 Oct 2016 13:41:51 +0900
From: Simon Horman <horms@verge.net.au>
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 0/2] ARM: dts: r7s72100: add sdhi DT
Message-ID: <20161007044147.GA5855@verge.net.au>
References: <20160926204032.12260-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160926204032.12260-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Sep 26, 2016 at 04:40:30PM -0400, Chris Brandt wrote:
> SUMMARY:
> This series adds sdhi to the r7s72100 (RZ/A1) Device Tree.
> 
> DEPENDECIES:
> This series is dependent on the tmio/sh_sdhi patches being
> applied to add r7s72100 support.
>   mmc: sh_mobile_sdhi: add ocr_mask option
>   mmc: tmio-mmc: add support for 32bit data port
>   mmc: sh_mobile_sdhi: Add r7s72100 support
> 
> MERGE CONFLICTS:
> There are also patches being reviewed for adding mmc so depending on how
> they get applied, there might be a line conflict.
> To resolve the merge conflict, simply put the MMC nodes before
> the SDHI nodes (just because that seems to be the order in other
> Renesas SoCs DTs)

Thanks for the notes above.

I have decided to queue this up (for v4.10). Please let me know
if that was not desired. Or if subsequently it becomes undesirable
(i.e. if I should drop these patches).

> CHANGES:
> V1->V2
> * Removed patch "[PATCH 1/3] ARM: dts: r7s72100: add sdhi clock to device tree"
>   because it has already been queued up
> * moved bus-with property from dtsi to dts
> 
> 
> Chris Brandt (2):
>   ARM: dts: r7s72100: add sdhi to device tree
>   ARM: dts: rskrza1: add sdhi1 DT support
> 
>  arch/arm/boot/dts/r7s72100-rskrza1.dts |  5 +++++
>  arch/arm/boot/dts/r7s72100.dtsi        | 26 ++++++++++++++++++++++++++
>  2 files changed, 31 insertions(+)
> 
> -- 
> 2.9.2
> 
> 
