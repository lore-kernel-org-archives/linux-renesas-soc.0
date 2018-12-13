Return-Path: <SRS0=gRf3=OW=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 515E6C65BAE
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 13 Dec 2018 13:52:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1414220849
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 13 Dec 2018 13:52:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="k2OA880E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1414220849
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729422AbeLMNwA (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 13 Dec 2018 08:52:00 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:55924 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729359AbeLMNwA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Dec 2018 08:52:00 -0500
Received: from avalon.localnet (dfj612ybrt5fhg77mgycy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:2e86:4862:ef6a:2804])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id ED4B1549;
        Thu, 13 Dec 2018 14:51:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1544709117;
        bh=t1O1AQuvJw3kRHyWOJPbn0U6QZBtMhDbHmtthBMoF9A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=k2OA880EkgDv5Z8OnuyD2BxM2GSA6MBzvds5MV/9136u0yhv1PoVnKmigwoU3w/oB
         BmNG7oKIv3BaM1jNBEIazwIvnlhjeWYAerOgEJ1ZDNNZUjjnIV33HdFTCLNaKf5Xuj
         oznR4moixsS05Ro4t7hFqiyC9IWNyg8u7/oovggM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     geert+renesas@glider.be, linus.walleij@linaro.org,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH 2/2] pinctrl: sh-pfc: r8a77995: Fix MOD_SEL bit numbering
Date:   Thu, 13 Dec 2018 15:52:43 +0200
Message-ID: <9308781.U9oT2vPqyz@avalon>
Organization: Ideas on Board Oy
In-Reply-To: <1544609975-26477-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1544609975-26477-1-git-send-email-yoshihiro.shimoda.uh@renesas.com> <1544609975-26477-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Shimoda-san,

Thank you for the patch.

On Wednesday, 12 December 2018 12:19:35 EET Yoshihiro Shimoda wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> 
> MOD_SEL register bit numbering was different from R-Car D3 SoC and
> R-Car H3/M3-[WN] SoCs.
> 
> MOD_SEL 1-bit      H3/M3-[WN]  D3
> ===============    ==========  =====
> Set Value = H'0    b'0         b'0
> Set Value = H'1    b'1         b'1
> 
> MOD_SEL 2-bits     H3/M3-[WN]  D3
> ===============    ==========  =====
> Set Value = H'0    b'00        b'00
> Set Value = H'1    b'01        b'10
> Set Value = H'2    b'10        b'01
> Set Value = H'3    b'11        b'11
> 
> MOD_SEL 3-bits     H3/M3-[WN]  D3
> ===============    ==========  =====
> Set Value = H'0    b'000       b'000
> Set Value = H'1    b'001       b'100
> Set Value = H'2    b'010       b'010
> Set Value = H'3    b'011       b'110
> Set Value = H'4    b'100       b'001
> Set Value = H'5    b'101       b'101
> Set Value = H'6    b'110       b'011
> Set Value = H'7    b'111       b'111
> 
> This patch replaces the #define name and value of MOD_SEL.
> 
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Fixes: 794a67117646 ("pinctrl: sh-pfc: Initial R8A77995 PFC support")
> [shimoda: split a patch per SoC and revise the commit log]
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Per Geert's request I've tested this patch on the Draak board with pwm-
backlight, and it doesn't seem to make any difference.

> ---
>  drivers/pinctrl/sh-pfc/pfc-r8a77995.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
> b/drivers/pinctrl/sh-pfc/pfc-r8a77995.c index e457539..e0db6f3 100644
> --- a/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
> @@ -388,10 +388,10 @@
>  #define MOD_SEL0_27		FM(SEL_MSIOF3_0)	FM(SEL_MSIOF3_1)
>  #define MOD_SEL0_26		FM(SEL_HSCIF3_0)	FM(SEL_HSCIF3_1)
>  #define MOD_SEL0_25		FM(SEL_SCIF4_0)		FM(SEL_SCIF4_1)
> -#define
> MOD_SEL0_24_23		FM(SEL_PWM0_0)		FM(SEL_PWM0_1)		FM(SEL_PWM0_2)		
FM(SEL_PWM0
> _3) -#define
> MOD_SEL0_22_21		FM(SEL_PWM1_0)		FM(SEL_PWM1_1)		FM(SEL_PWM1_2)		
FM(SEL_PWM1
> _3) -#define
> MOD_SEL0_20_19		FM(SEL_PWM2_0)		FM(SEL_PWM2_1)		FM(SEL_PWM2_2)		
FM(SEL_PWM2
> _3) -#define
> MOD_SEL0_18_17		FM(SEL_PWM3_0)		FM(SEL_PWM3_1)		FM(SEL_PWM3_2)		
FM(SEL_PWM3
> _3) +#define
> MOD_SEL0_24_23		FM(SEL_PWM0_0)		FM(SEL_PWM0_2)		FM(SEL_PWM0_1)		
FM(SEL_PWM0
> _3) +#define
> MOD_SEL0_22_21		FM(SEL_PWM1_0)		FM(SEL_PWM1_2)		FM(SEL_PWM1_1)		
FM(SEL_PWM1
> _3) +#define
> MOD_SEL0_20_19		FM(SEL_PWM2_0)		FM(SEL_PWM2_2)		FM(SEL_PWM2_1)		
FM(SEL_PWM2
> _3) +#define
> MOD_SEL0_18_17		FM(SEL_PWM3_0)		FM(SEL_PWM3_2)		FM(SEL_PWM3_1)		
FM(SEL_PWM3
> _3) #define MOD_SEL0_15		FM(SEL_IRQ_0_0)		FM(SEL_IRQ_0_1)
>  #define MOD_SEL0_14		FM(SEL_IRQ_1_0)		FM(SEL_IRQ_1_1)
>  #define MOD_SEL0_13		FM(SEL_IRQ_2_0)		FM(SEL_IRQ_2_1)

-- 
Regards,

Laurent Pinchart



