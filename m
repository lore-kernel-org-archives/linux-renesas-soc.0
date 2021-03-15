Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4166C433E0
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 15 Mar 2021 22:32:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 86CBD64F0C
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 15 Mar 2021 22:32:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233003AbhCOWba (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 15 Mar 2021 18:31:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232894AbhCOWbM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Mar 2021 18:31:12 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C758C06174A;
        Mon, 15 Mar 2021 15:31:12 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B3794316;
        Mon, 15 Mar 2021 23:31:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615847470;
        bh=H7Wx2Oh9qwHU83/UQu+hrD7E5JtUru3BVvxqvSL7Jqk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jT0zUylkL0eamAiMGh0Bfeby76IF8TcVA5Y1awfSfccCw5+DvDGZMWBtcvgdaew24
         LerX1MwZKuP3lKOyPHJpEsyNHxcORf76viIb+ncc5mrKlw5HF0x2dKUZ/xLLKySgIX
         4MssoVfqm9CzFT/V4iC8/VndR3N2I+yK9tzpMxvM=
Date:   Tue, 16 Mar 2021 00:30:34 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] arm64: dts: renesas: eagle: Include eagle-gmsl
Message-ID: <YE/gCgRe0YJwc8t0@pendragon.ideasonboard.com>
References: <20210315163028.173148-1-jacopo+renesas@jmondi.org>
 <20210315163028.173148-5-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210315163028.173148-5-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Mon, Mar 15, 2021 at 05:30:28PM +0100, Jacopo Mondi wrote:
> From: Kieran Bingham <kieran.bingham@ideasonboard.com>
> 
> Include the eagle-gmsl.dtsi to enable GMSL camera support on the
> Eagle-V3M platform.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  arch/arm64/boot/dts/renesas/r8a77970-eagle.dts | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> index d2f63cccc238..555070aae03d 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> @@ -404,3 +404,6 @@ &scif0 {
>  
>  	status = "okay";
>  };
> +
> +/* FAKRA Overlay */
> +#include "eagle-gmsl.dtsi"

Not everybody has cameras connected to the Eagle board though.

Now that the kernel is gaining support for compiling DT overlays
(https://lore.kernel.org/lkml/cover.1615354376.git.viresh.kumar@linaro.org/),
I wonder if this is something that could be handled using overlays.

-- 
Regards,

Laurent Pinchart
