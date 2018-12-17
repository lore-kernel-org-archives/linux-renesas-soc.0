Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4FD4C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 14:37:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9ED83206A2
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 14:37:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="a3l1gye/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727259AbeLQOht (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 09:37:49 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:41937 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726573AbeLQOht (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 09:37:49 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 38C3F25B781;
        Tue, 18 Dec 2018 01:37:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1545057465; bh=8UnvnFmnkjsa1Ok35/4zeuWTTaKQScwoFmMJ4LFQeJ4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=a3l1gye/eCeP9cfZuB1G5zNXcCfWfWsDH6/VPETnwnQI96p5lgldU8K+mcprhJC6Z
         LLBx8Bf77CK1X4ziIszokIDjH4+8KyX+k+soD4M7MZ0K9TCAWCCyWJY2vBfuPZ+yam
         enb7ad7QdB0mN0vpVrpyZ0+InMgIl72DygHfqMhg=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 509A794048A; Mon, 17 Dec 2018 15:37:43 +0100 (CET)
Date:   Mon, 17 Dec 2018 15:37:43 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH 10/15] pinctrl: sh-pfc: sh7734: Fix shifted values in
 IPSR10
Message-ID: <20181217143742.4qsndrcickp3hsyw@verge.net.au>
References: <20181213182714.26094-1-geert+renesas@glider.be>
 <20181213182714.26094-11-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181213182714.26094-11-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 13, 2018 at 07:27:09PM +0100, Geert Uytterhoeven wrote:
> Some values in the Peripheral Function Select Register 10 descriptor are
> shifted by one position, which may cause a peripheral function to be
> programmed incorrectly.
> 
> Fixing this makes all HSCIF0 pins use Function 4 (value 3), like was
> already the case for the HSCK0 pin in field IP10[5:3].
> 
> Fixes: ac1ebc2190f575fc ("sh-pfc: Add sh7734 pinmux support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Based on the SH7734 Hardware User's Manual Rev. 1.00.
> Compile-tested only.
> 
> Noticed when investigating a different bug in the same register
> description.
> ---
>  drivers/pinctrl/sh-pfc/pfc-sh7734.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/pinctrl/sh-pfc/pfc-sh7734.c b/drivers/pinctrl/sh-pfc/pfc-sh7734.c
> index cad70f9cf5699f0c..748a32a3af82d368 100644
> --- a/drivers/pinctrl/sh-pfc/pfc-sh7734.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-sh7734.c
> @@ -2210,22 +2210,22 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
>  	    /* IP10_22 [1] */
>  		FN_CAN_CLK_A, FN_RX4_D,
>  	    /* IP10_21_19 [3] */
> -		FN_AUDIO_CLKOUT, FN_TX1_E, FN_HRTS0_C, FN_FSE_B,
> -		FN_LCD_M_DISP_B, 0, 0, 0,
> +		FN_AUDIO_CLKOUT, FN_TX1_E, 0, FN_HRTS0_C, FN_FSE_B,

FN_FSE_B does no appear to be documented for this field in Users' Manual
Hardware v1.00 (Jun 12, 2012). Should it be 0?

Otherwise this patch looks good.


Reviewed-by: Simon Horman <horms+renesas@verge.net.au>


> +		FN_LCD_M_DISP_B, 0, 0,
>  	    /* IP10_18_16 [3] */
> -		FN_AUDIO_CLKC, FN_SCK1_E, FN_HCTS0_C, FN_FRB_B,
> -		FN_LCD_VEPWC_B, 0, 0, 0,
> +		FN_AUDIO_CLKC, FN_SCK1_E, 0, FN_HCTS0_C, FN_FRB_B,
> +		FN_LCD_VEPWC_B, 0, 0,
>  	    /* IP10_15 [1] */
>  		FN_AUDIO_CLKB_A, FN_LCD_CLK_B,
>  	    /* IP10_14_12 [3] */
>  		FN_AUDIO_CLKA_A, FN_VI1_CLK_B, FN_SCK1_D, FN_IECLK_B,
>  		FN_LCD_FLM_B, 0, 0, 0,
>  	    /* IP10_11_9 [3] */
> -		FN_SSI_SDATA3, FN_VI1_7_B, FN_HTX0_C, FN_FWE_B,
> -		FN_LCD_CL2_B, 0, 0, 0,
> +		FN_SSI_SDATA3, FN_VI1_7_B, 0, FN_HTX0_C, FN_FWE_B,
> +		FN_LCD_CL2_B, 0, 0,
>  	    /* IP10_8_6 [3] */
> -		FN_SSI_SDATA2, FN_VI1_6_B, FN_HRX0_C, FN_FRE_B,
> -		FN_LCD_CL1_B, 0, 0, 0,
> +		FN_SSI_SDATA2, FN_VI1_6_B, 0, FN_HRX0_C, FN_FRE_B,
> +		FN_LCD_CL1_B, 0, 0,
>  	    /* IP10_5_3 [3] */
>  		FN_SSI_WS23, FN_VI1_5_B, FN_TX1_D, FN_HSCK0_C, FN_FALE_B,
>  		FN_LCD_DON_B, 0, 0,
> -- 
> 2.17.1
> 
