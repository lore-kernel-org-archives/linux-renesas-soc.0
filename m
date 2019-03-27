Return-Path: <SRS0=rp0x=R6=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2122C43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 27 Mar 2019 12:09:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 93E562087C
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 27 Mar 2019 12:09:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="sICLDUvy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728130AbfC0MJc (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 27 Mar 2019 08:09:32 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:56301 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727488AbfC0MJc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Mar 2019 08:09:32 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 661FC25B7E2;
        Wed, 27 Mar 2019 23:09:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1553688569; bh=/ruuZh3Lpj7c0BFjV9/5clslywNUC4M8Az3nbOJm9fI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sICLDUvyClU2ihyZDsItjDwJ0P17ef53LuvYeN0JqEMe1/jV5k/HVeuNKnVeDLB4w
         3XJw6MCYdiYuWrUtWtfBhJkpvkgBShcqd/kpjnzsttzXQKAjH9ANvmjLC5LTJ3K1d/
         pw8xljY7SBMoluN4IId99iAHos8a2NRPSQqAbfMM=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id B9EAE940376; Wed, 27 Mar 2019 13:09:27 +0100 (CET)
Date:   Wed, 27 Mar 2019 13:09:27 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: dts: rskrza1: Add remaining LEDs
Message-ID: <20190327120844.4h75vl6v2obeyt6v@verge.net.au>
References: <20190320194410.14870-1-geert+renesas@glider.be>
 <20190320194410.14870-3-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190320194410.14870-3-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Mar 20, 2019 at 08:44:10PM +0100, Geert Uytterhoeven wrote:
> Describe the remaining 3 LEDs, which are driven by the first CAT9554
> port expander.
> 
> Drop the superfluous status property from the leds node while at it.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for v5.2.

> ---
>  arch/arm/boot/dts/r7s72100-rskrza1.dts | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/r7s72100-rskrza1.dts b/arch/arm/boot/dts/r7s72100-rskrza1.dts
> index 60e80ecbbf6826bc..ff24301dc1be54de 100644
> --- a/arch/arm/boot/dts/r7s72100-rskrza1.dts
> +++ b/arch/arm/boot/dts/r7s72100-rskrza1.dts
> @@ -34,12 +34,23 @@
>  	};
>  
>  	leds {
> -		status = "okay";
>  		compatible = "gpio-leds";
>  
>  		led0 {
>  			gpios = <&port7 1 GPIO_ACTIVE_LOW>;
>  		};
> +
> +		led1 {
> +			gpios = <&io_expander1 0 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		led2 {
> +			gpios = <&io_expander1 1 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		led3 {
> +			gpios = <&io_expander1 2 GPIO_ACTIVE_LOW>;
> +		};
>  	};
>  };
>  
> -- 
> 2.17.1
> 
