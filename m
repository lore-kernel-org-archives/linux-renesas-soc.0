Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56274 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750820AbeEDNaq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 May 2018 09:30:46 -0400
Date: Fri, 4 May 2018 15:30:42 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/3] arm64: dts: renesas: salvator-x(s)/ulcb: Add PMIC
 DDR Backup Power config
Message-ID: <20180504133041.zxabqimfmajd6fgz@verge.net.au>
References: <1525350651-12471-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1525350651-12471-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, May 03, 2018 at 02:30:48PM +0200, Geert Uytterhoeven wrote:
> 	Hi Simon, Magnus,
> 
> The ROHM BD9571MWV PMIC on the Renesas Salvator-X(S) and ULCB
> development boards supports DDR Backup Power, which means that the DDR
> power rails can be kept powered while the main SoC is powered down.
> 
> For this to function correctly, the DDR Backup Power configuration
> must be described in DT, which is the topic of this series:
>   - The first patch adds the missing device node for the BD9571 PMIC on
>     the ULCB boards,
>   - The last two patches add DDR Backup Mode configuration for
>     Salvator-X(S) and ULCB.
> 
> Changes compared to v3:
>   - Use a hex value for the bit mask.
> 
> Changes compared to v2:
>   - Add support for ULCB,
>   - Add "rohm,rstbmode-level" for Salvator-X(S).
> 
> The relevant DT binding updates have been accepted in
> regulator/for-next, as well as driver support for DDR Backup Mode on
> systems with momentary power switches ("rohm,rstbmode-pulse"), like
> ULCB.  Combined with this series, the PMIC on ULCB will be configured
> automatically during system suspend.
> 
> Note that driver support for systems with toggle power swiches
> ("rohm,rstbmode-level"), like Salvator-X(S), is still under review
> (https://lkml.org/lkml/2018/3/14/324).  But as DT describes hardware,
> not software limitations, this series is safe to apply.
> 
> This has been tested on M3ULCB (thanks Jacopo!), and on Salvator-X(S).
> All support has been part of renesas-drivers since a few releases.
> 
> Thanks for applying!

Thanks, applied.
