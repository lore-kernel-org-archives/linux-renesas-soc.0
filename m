Return-Path: <SRS0=l30p=SD=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B9ADC43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  1 Apr 2019 10:14:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 066462084B
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  1 Apr 2019 10:14:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="b1oiy/r5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725895AbfDAKO4 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 1 Apr 2019 06:14:56 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:45076 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725878AbfDAKO4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Apr 2019 06:14:56 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id BBFEF25B766;
        Mon,  1 Apr 2019 21:14:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1554113695; bh=vE5r6mBeN7DmUxyJehudauH7opXbCI0vPdGUzKclWu4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=b1oiy/r51XME4eC/DxKLm89zAvGxOOweCYK2NQMD/11yKX0+MAieLbps/7jCxSckc
         ZULG4PzBrNY7mKuQw6OC38PO+OM/cqyEpOZgK8N6qB7SfYl57QOy5ZEnz2yoX74BVL
         M4PXzG5iMlHXMbV5T3141yAYakUaHn/1FoqoD2To=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id D7CCE94039A; Mon,  1 Apr 2019 12:14:52 +0200 (CEST)
Date:   Mon, 1 Apr 2019 12:14:52 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH 3/8] pinctrl: sh-pfc: r8a77990: Fix MOD_SEL1 bit30 when
 using SSI_SCK2 and SSI_WS2
Message-ID: <20190401101452.ueabuxwz64qns2ex@verge.net.au>
References: <20190329152942.13995-1-geert+renesas@glider.be>
 <20190329152942.13995-4-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190329152942.13995-4-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Mar 29, 2019 at 04:29:37PM +0100, Geert Uytterhoeven wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> 
> According to the R-Car Gen3 Hardware Manual Errata for Rev 1.00 of Aug
> 24, 2018, there is no need to configure MOD_SEL1 bit30 when the
> SSI_SCK2_{A,B} or SSI_WS2_{A,B} pin functions are selected.
> 
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> [geert: Remove now unused definitions, mark MOD_SEL1 bit30 reserved]
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  drivers/pinctrl/sh-pfc/pfc-r8a77990.c | 20 +++++++++-----------
>  1 file changed, 9 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
> index 68abacd9732f94c9..9ca002b6173c1447 100644
> --- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
> @@ -430,7 +430,6 @@ FM(IP12_31_28)	IP12_31_28	FM(IP13_31_28)	IP13_31_28	FM(IP14_31_28)	IP14_31_28	FM
>  #define MOD_SEL0_1_0	   REV4(FM(SEL_SPEED_PULSE_IF_0),	FM(SEL_SPEED_PULSE_IF_1),	FM(SEL_SPEED_PULSE_IF_2),	F_(0, 0))
>  
>  /* MOD_SEL1 */			/* 0 */				/* 1 */				/* 2 */				/* 3 */			/* 4 */			/* 5 */		/* 6 */		/* 7 */
> -#define MOD_SEL1_30		FM(SEL_SSI2_0)			FM(SEL_SSI2_1)
>  #define MOD_SEL1_29		FM(SEL_TIMER_TMU_0)		FM(SEL_TIMER_TMU_1)
>  #define MOD_SEL1_28		FM(SEL_USB_20_CH0_0)		FM(SEL_USB_20_CH0_1)
>  #define MOD_SEL1_26		FM(SEL_DRIF2_0)			FM(SEL_DRIF2_1)
> @@ -451,7 +450,7 @@ FM(IP12_31_28)	IP12_31_28	FM(IP13_31_28)	IP13_31_28	FM(IP14_31_28)	IP14_31_28	FM
>  
>  #define PINMUX_MOD_SELS	\
>  \
> -MOD_SEL0_30_29		MOD_SEL1_30 \
> +MOD_SEL0_30_29 \
>  			MOD_SEL1_29 \
>  MOD_SEL0_28		MOD_SEL1_28 \
>  MOD_SEL0_27_26 \
> @@ -1041,7 +1040,7 @@ static const u16 pinmux_data[] = {
>  	PINMUX_IPSR_MSEL(IP10_27_24,		RIF0_CLK_B,	SEL_DRIF0_1),
>  	PINMUX_IPSR_MSEL(IP10_27_24,		SCL2_B,		SEL_I2C2_1),
>  	PINMUX_IPSR_MSEL(IP10_27_24,		TCLK1_A,	SEL_TIMER_TMU_0),
> -	PINMUX_IPSR_MSEL(IP10_27_24,		SSI_SCK2_B,	SEL_SSI2_1),
> +	PINMUX_IPSR_GPSR(IP10_27_24,		SSI_SCK2_B),
>  	PINMUX_IPSR_GPSR(IP10_27_24,		TS_SCK0),
>  
>  	PINMUX_IPSR_GPSR(IP10_31_28,		SD0_WP),
> @@ -1050,7 +1049,7 @@ static const u16 pinmux_data[] = {
>  	PINMUX_IPSR_MSEL(IP10_31_28,		RIF0_D0_B,	SEL_DRIF0_1),
>  	PINMUX_IPSR_MSEL(IP10_31_28,		SDA2_B,		SEL_I2C2_1),
>  	PINMUX_IPSR_MSEL(IP10_31_28,		TCLK2_A,	SEL_TIMER_TMU_0),
> -	PINMUX_IPSR_MSEL(IP10_31_28,		SSI_WS2_B,	SEL_SSI2_1),
> +	PINMUX_IPSR_GPSR(IP10_31_28,		SSI_WS2_B),
>  	PINMUX_IPSR_GPSR(IP10_31_28,		TS_SDAT0),
>  
>  	/* IPSR11 */
> @@ -1068,13 +1067,13 @@ static const u16 pinmux_data[] = {
>  
>  	PINMUX_IPSR_MSEL(IP11_11_8,		RX0_A,		SEL_SCIF0_0),
>  	PINMUX_IPSR_MSEL(IP11_11_8,		HRX1_A,		SEL_HSCIF1_0),
> -	PINMUX_IPSR_MSEL(IP11_11_8,		SSI_SCK2_A,	SEL_SSI2_0),
> +	PINMUX_IPSR_GPSR(IP11_11_8,		SSI_SCK2_A),
>  	PINMUX_IPSR_GPSR(IP11_11_8,		RIF1_SYNC),
>  	PINMUX_IPSR_GPSR(IP11_11_8,		TS_SCK1),
>  
>  	PINMUX_IPSR_MSEL(IP11_15_12,		TX0_A,		SEL_SCIF0_0),
>  	PINMUX_IPSR_GPSR(IP11_15_12,		HTX1_A),
> -	PINMUX_IPSR_MSEL(IP11_15_12,		SSI_WS2_A,	SEL_SSI2_0),
> +	PINMUX_IPSR_GPSR(IP11_15_12,		SSI_WS2_A),
>  	PINMUX_IPSR_GPSR(IP11_15_12,		RIF1_D0),
>  	PINMUX_IPSR_GPSR(IP11_15_12,		TS_SDAT1),
>  
> @@ -4965,12 +4964,11 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
>  		MOD_SEL0_1_0 ))
>  	},
>  	{ PINMUX_CFG_REG_VAR("MOD_SEL1", 0xe6060504, 32,
> -			     GROUP(1, 1, 1, 1, 1, 1, 1, 3, 3, 1, 1, 1,
> -				   1, 2, 2, 2, 1, 1, 2, 1, 4),
> +			     GROUP(2, 1, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1,
> +				   2, 2, 2, 1, 1, 2, 1, 4),
>  			     GROUP(
> -		/* RESERVED 31 */
> -		0, 0,
> -		MOD_SEL1_30
> +		/* RESERVED 31, 30 */
> +		0, 0, 0, 0,
>  		MOD_SEL1_29
>  		MOD_SEL1_28
>  		/* RESERVED 27 */
> -- 
> 2.17.1
> 
