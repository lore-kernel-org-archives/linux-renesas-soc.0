Return-Path: <SRS0=sjaF=PT=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B653C43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jan 2019 12:34:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9A14820657
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jan 2019 12:34:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="C3dqxaiQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732372AbfAKMeJ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 11 Jan 2019 07:34:09 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:32979 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730347AbfAKMeJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Jan 2019 07:34:09 -0500
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 7220C25BEE0;
        Fri, 11 Jan 2019 23:34:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1547210046; bh=h/RgBM5LDjSJD2ZP9sfnTNJGJ/Uv6j5EUWDk33GPT78=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=C3dqxaiQmqVh6Ui1fgbzYe6yph8BIYgQ3L8paeDGFzlD03Oe6cmQk5mTehDLup+Z7
         2tbWPFDoJmwo4gzL2u4ogBGfQQglR9iipfvYLMPWMPnQu5AOZ0poloK+Mv0vs+ogUy
         OG00xefBsIAhsJTykLdeYfKqYTNxmrplQmRfXLCM=
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id AA5D3E218F1; Fri, 11 Jan 2019 04:34:04 -0800 (PST)
Date:   Fri, 11 Jan 2019 13:34:04 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a77990: Fix MOD_SEL0 bit3 when using
 TX0
Message-ID: <20190111123403.lemoyedvzmxx5rhv@verge.net.au>
References: <20190111121340.31321-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190111121340.31321-1-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jan 11, 2019 at 01:13:40PM +0100, Geert Uytterhoeven wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> 
> According to the R-Car Gen3 Hardware Manual Errata for Rev 1.00 of
> Aug 24, 2018, the MOD_SEL0 bit3 is set to 0 when TX0_A pin function is
> selected, and the MOD_SEL0 bit3 is set to 1 when TX0_B pin function is
> selected.
> 
> Fixes: 6d4036a1e3b3ac0f ("pinctrl: sh-pfc: Initial R8A77990 PFC support")
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be queued in sh-pfc-for-v5.1.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> 
>  drivers/pinctrl/sh-pfc/pfc-r8a77990.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
> index db8e1f1e91551b93..3ce1b24a9d6e95f2 100644
> --- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
> @@ -1073,7 +1073,7 @@ static const u16 pinmux_data[] = {
>  	PINMUX_IPSR_GPSR(IP11_11_8,		RIF1_SYNC),
>  	PINMUX_IPSR_GPSR(IP11_11_8,		TS_SCK1),
>  
> -	PINMUX_IPSR_GPSR(IP11_15_12,		TX0_A),
> +	PINMUX_IPSR_MSEL(IP11_15_12,		TX0_A,		SEL_SCIF0_0),
>  	PINMUX_IPSR_GPSR(IP11_15_12,		HTX1_A),
>  	PINMUX_IPSR_MSEL(IP11_15_12,		SSI_WS2_A,	SEL_SSI2_0),
>  	PINMUX_IPSR_GPSR(IP11_15_12,		RIF1_D0),
> @@ -1183,7 +1183,7 @@ static const u16 pinmux_data[] = {
>  	PINMUX_IPSR_MSEL(IP13_19_16,		SIM0_D_A,	SEL_SIMCARD_0),
>  
>  	PINMUX_IPSR_GPSR(IP13_23_20,		MLB_DAT),
> -	PINMUX_IPSR_GPSR(IP13_23_20,		TX0_B),
> +	PINMUX_IPSR_MSEL(IP13_23_20,		TX0_B,		SEL_SCIF0_1),
>  	PINMUX_IPSR_MSEL(IP13_23_20,		RIF0_SYNC_A,	SEL_DRIF0_0),
>  	PINMUX_IPSR_GPSR(IP13_23_20,		SIM0_CLK_A),
>  
> -- 
> 2.17.1
> 
