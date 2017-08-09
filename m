Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:54429 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752333AbdHIJEZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Aug 2017 05:04:25 -0400
Date: Wed, 9 Aug 2017 11:04:21 +0200
From: Simon Horman <horms@verge.net.au>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Chris Paterson <chris.paterson2@renesas.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH  2/2] ARM: shmobile: Enable BQ32000 rtc in
 shmobile_defconfig
Message-ID: <20170809090421.GN2705@verge.net.au>
References: <1502197465-61546-1-git-send-email-biju.das@bp.renesas.com>
 <1502197465-61546-3-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1502197465-61546-3-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Aug 08, 2017 at 02:04:25PM +0100, Biju Das wrote:
> The iWave RZ/G1M Q7 SOM supports RTC (TI BQ32000).
> To increase hardware support enable the driver in the
> shmobile_defconfig multiplatform configuration.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Thanks, applied for v4.14.

> ---
>  arch/arm/configs/shmobile_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
> index 18886c5..7b4fc01 100644
> --- a/arch/arm/configs/shmobile_defconfig
> +++ b/arch/arm/configs/shmobile_defconfig
> @@ -193,6 +193,7 @@ CONFIG_LEDS_CLASS=y
>  CONFIG_LEDS_GPIO=y
>  CONFIG_RTC_CLASS=y
>  CONFIG_RTC_DRV_RS5C372=y
> +CONFIG_RTC_DRV_BQ32K=y
>  CONFIG_RTC_DRV_S35390A=y
>  CONFIG_RTC_DRV_RX8581=y
>  CONFIG_RTC_DRV_DA9063=y
> -- 
> 1.9.1
> 
