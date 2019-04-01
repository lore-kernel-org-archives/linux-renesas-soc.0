Return-Path: <SRS0=l30p=SD=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF8B3C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  1 Apr 2019 10:14:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A47812084B
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  1 Apr 2019 10:14:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="lveq1+aU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725895AbfDAKOi (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 1 Apr 2019 06:14:38 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:45051 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725878AbfDAKOi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Apr 2019 06:14:38 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 3A26C25B82D;
        Mon,  1 Apr 2019 21:14:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1554113676; bh=hqb95zLf07t113YWzAlxDf7+J3f6SguyyIJrQFMHtyg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lveq1+aUkfAl/Gnvlgz7zEbeZDkfdjYSfeqvZSrB0k8dmNnFmoZBKhessFnM29391
         zD0da6kP195CIHLVolMAQIjaqrfywyirJVEg3NG8JywBf4HDqxYG5Yqdr7mwwFyx3n
         VkY/4nE8PBgLfP20fkeCkEPYJ59cVW6nDjyHCA2Y=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 54C9B94039A; Mon,  1 Apr 2019 12:14:34 +0200 (CEST)
Date:   Mon, 1 Apr 2019 12:14:34 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH 1/8] pinctrl: sh-pfc: r8a77990: Fix MOD_SEL0 bit16 when
 using NFALE and NFRB_N
Message-ID: <20190401101434.dphkfxifd5au7djs@verge.net.au>
References: <20190329152942.13995-1-geert+renesas@glider.be>
 <20190329152942.13995-2-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190329152942.13995-2-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Mar 29, 2019 at 04:29:35PM +0100, Geert Uytterhoeven wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> 
> According to the R-Car Gen3 Hardware Manual Errata for Rev 1.00 of Aug
> 24, 2018, the MOD_SEL0 bit16 must be set to 0 when the NFALE_A and
> NFRB_N_A pin functions are selected.
> 
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  drivers/pinctrl/sh-pfc/pfc-r8a77990.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
> index ebf4d5e4d336f88b..2328fd25fa4f6cb0 100644
> --- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
> @@ -1038,7 +1038,7 @@ static const u16 pinmux_data[] = {
>  	PINMUX_IPSR_GPSR(IP10_23_20,		NFCLE),
>  
>  	PINMUX_IPSR_GPSR(IP10_27_24,		SD0_CD),
> -	PINMUX_IPSR_GPSR(IP10_27_24,		NFALE_A),
> +	PINMUX_IPSR_MSEL(IP10_27_24,		NFALE_A,	SEL_NDFC_0),
>  	PINMUX_IPSR_GPSR(IP10_27_24,		SD3_CD),
>  	PINMUX_IPSR_MSEL(IP10_27_24,		RIF0_CLK_B,	SEL_DRIF0_1),
>  	PINMUX_IPSR_MSEL(IP10_27_24,		SCL2_B,		SEL_I2C2_1),
> @@ -1047,7 +1047,7 @@ static const u16 pinmux_data[] = {
>  	PINMUX_IPSR_GPSR(IP10_27_24,		TS_SCK0),
>  
>  	PINMUX_IPSR_GPSR(IP10_31_28,		SD0_WP),
> -	PINMUX_IPSR_GPSR(IP10_31_28,		NFRB_N_A),
> +	PINMUX_IPSR_MSEL(IP10_31_28,		NFRB_N_A,	SEL_NDFC_0),
>  	PINMUX_IPSR_GPSR(IP10_31_28,		SD3_WP),
>  	PINMUX_IPSR_MSEL(IP10_31_28,		RIF0_D0_B,	SEL_DRIF0_1),
>  	PINMUX_IPSR_MSEL(IP10_31_28,		SDA2_B,		SEL_I2C2_1),
> -- 
> 2.17.1
> 
