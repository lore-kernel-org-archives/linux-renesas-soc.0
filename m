Return-Path: <SRS0=l30p=SD=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E0CBC43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  1 Apr 2019 10:14:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2C9132084B
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  1 Apr 2019 10:14:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="WT0AwxBb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726409AbfDAKOr (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 1 Apr 2019 06:14:47 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:45066 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725878AbfDAKOq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Apr 2019 06:14:46 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 216C925B766;
        Mon,  1 Apr 2019 21:14:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1554113684; bh=5HBVMdnL5+t5dUypckB9Ds57mJvigDfKRAPx0RW/GcU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WT0AwxBbyGPYRbrVCL/k+/MdCofGwnaKXs2vGqUPH6YjyGpvi/ybHmxOkXZBxkwWm
         CHQMGx2ULFyHKOy3YVL+kIRMeGuqsk4fHWCQQuwhlTClRvPie+8lXKv2YPJYm+shDk
         R8lv0vT7W3M5P3GIJwVCKSNJyhoZ2AyvOGXfNYsc=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 1C5E194039A; Mon,  1 Apr 2019 12:14:42 +0200 (CEST)
Date:   Mon, 1 Apr 2019 12:14:42 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH 2/8] pinctrl: sh-pfc: r8a77990: Fix MOD_SEL1 bit31 when
 using SIM0_D
Message-ID: <20190401101441.tmra3erh5ooadtp2@verge.net.au>
References: <20190329152942.13995-1-geert+renesas@glider.be>
 <20190329152942.13995-3-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190329152942.13995-3-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Mar 29, 2019 at 04:29:36PM +0100, Geert Uytterhoeven wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> 
> According to the R-Car Gen3 Hardware Manual Errata for Rev 1.00 of
> Aug 24, 2018, there is no need to configure MOD_SEL1 bit31 when the
> SIM0_D_{A,B} pin function is selected.
> 
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> [geert: Remove now unused definitions, mark MOD_SEL1 bit31 reserved]
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  drivers/pinctrl/sh-pfc/pfc-r8a77990.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
> index 2328fd25fa4f6cb0..68abacd9732f94c9 100644
> --- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
> @@ -430,7 +430,6 @@ FM(IP12_31_28)	IP12_31_28	FM(IP13_31_28)	IP13_31_28	FM(IP14_31_28)	IP14_31_28	FM
>  #define MOD_SEL0_1_0	   REV4(FM(SEL_SPEED_PULSE_IF_0),	FM(SEL_SPEED_PULSE_IF_1),	FM(SEL_SPEED_PULSE_IF_2),	F_(0, 0))
>  
>  /* MOD_SEL1 */			/* 0 */				/* 1 */				/* 2 */				/* 3 */			/* 4 */			/* 5 */		/* 6 */		/* 7 */
> -#define MOD_SEL1_31		FM(SEL_SIMCARD_0)		FM(SEL_SIMCARD_1)
>  #define MOD_SEL1_30		FM(SEL_SSI2_0)			FM(SEL_SSI2_1)
>  #define MOD_SEL1_29		FM(SEL_TIMER_TMU_0)		FM(SEL_TIMER_TMU_1)
>  #define MOD_SEL1_28		FM(SEL_USB_20_CH0_0)		FM(SEL_USB_20_CH0_1)
> @@ -452,7 +451,6 @@ FM(IP12_31_28)	IP12_31_28	FM(IP13_31_28)	IP13_31_28	FM(IP14_31_28)	IP14_31_28	FM
>  
>  #define PINMUX_MOD_SELS	\
>  \
> -			MOD_SEL1_31 \
>  MOD_SEL0_30_29		MOD_SEL1_30 \
>  			MOD_SEL1_29 \
>  MOD_SEL0_28		MOD_SEL1_28 \
> @@ -1181,7 +1179,7 @@ static const u16 pinmux_data[] = {
>  	PINMUX_IPSR_MSEL(IP13_19_16,		RIF0_D1_A,	SEL_DRIF0_0),
>  	PINMUX_IPSR_MSEL(IP13_19_16,		SDA1_B,		SEL_I2C1_1),
>  	PINMUX_IPSR_MSEL(IP13_19_16,		TCLK2_B,	SEL_TIMER_TMU_1),
> -	PINMUX_IPSR_MSEL(IP13_19_16,		SIM0_D_A,	SEL_SIMCARD_0),
> +	PINMUX_IPSR_GPSR(IP13_19_16,		SIM0_D_A),
>  
>  	PINMUX_IPSR_GPSR(IP13_23_20,		MLB_DAT),
>  	PINMUX_IPSR_MSEL(IP13_23_20,		TX0_B,		SEL_SCIF0_1),
> @@ -1249,7 +1247,7 @@ static const u16 pinmux_data[] = {
>  	PINMUX_IPSR_GPSR(IP15_15_12,		TPU0TO2),
>  	PINMUX_IPSR_MSEL(IP15_15_12,		SDA1_D,		SEL_I2C1_3),
>  	PINMUX_IPSR_MSEL(IP15_15_12,		FSO_CFE_1_N_B,	SEL_FSO_1),
> -	PINMUX_IPSR_MSEL(IP15_15_12,		SIM0_D_B,	SEL_SIMCARD_1),
> +	PINMUX_IPSR_GPSR(IP15_15_12,		SIM0_D_B),
>  
>  	PINMUX_IPSR_GPSR(IP15_19_16,		SSI_SDATA6),
>  	PINMUX_IPSR_MSEL(IP15_19_16,		HRTS2_N_A,	SEL_HSCIF2_0),
> @@ -4970,7 +4968,8 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
>  			     GROUP(1, 1, 1, 1, 1, 1, 1, 3, 3, 1, 1, 1,
>  				   1, 2, 2, 2, 1, 1, 2, 1, 4),
>  			     GROUP(
> -		MOD_SEL1_31
> +		/* RESERVED 31 */
> +		0, 0,
>  		MOD_SEL1_30
>  		MOD_SEL1_29
>  		MOD_SEL1_28
> -- 
> 2.17.1
> 
