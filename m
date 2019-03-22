Return-Path: <SRS0=lsYt=RZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19D48C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 22 Mar 2019 10:23:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 11E6521900
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 22 Mar 2019 10:23:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="KVVQYGuS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727845AbfCVKX3 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 22 Mar 2019 06:23:29 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:55750 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727713AbfCVKX3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Mar 2019 06:23:29 -0400
Received: from penelope.horms.nl (unknown [195.39.71.253])
        by kirsty.vergenet.net (Postfix) with ESMTPA id E963D25B79B;
        Fri, 22 Mar 2019 21:23:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1553250207; bh=D8n+eLW192r+oUvgV+CBTdAvKG/EUD2vusoCfpTXids=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KVVQYGuSG8UyiwL5ZZDBc0t+ZEU6crHxFeEnzwnDzSCj+HLhAJZZSnq84kGhkXmMx
         h4eUswAUx/Jwibg1MSK3qoeJHxNYX6d0z6zsIgXzHrYkR1rKDCDkkotvZ7TbGCDC8K
         C1LWj7nYckkKG79XhQUNNGo1tdXhWePeHXZFcja8=
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 12DFDE21330; Fri, 22 Mar 2019 11:23:25 +0100 (CET)
Date:   Fri, 22 Mar 2019 11:23:25 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] ARM: dts: rskrza1: Add I2C support
Message-ID: <20190322102324.yxnrwnkyhxrzqdg4@verge.net.au>
References: <20190320194410.14870-1-geert+renesas@glider.be>
 <20190320194410.14870-2-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190320194410.14870-2-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Mar 20, 2019 at 08:44:09PM +0100, Geert Uytterhoeven wrote:
> Enable the I2C bus, and add the following devices:
>   - Two CAT9554 port expanders (8 GPIOs, interrupt not wired by
>     default),
>   - R1EX24016ASAS0A EEPROM.
> 
> The bus also contains a MAX9856 Audio Codec, which is not yet supported.
> 
> All devices (incl. the audio codec) are documented to support an I2C bus
> running at 400 kHz.
> 
> Pinctrl is based on the RZ/A BSP.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Pending acceptance of the DT binding patches documenting the
> "onnn,cat9554" and "renesas,r1ex24016" compatible values.

Thanks.

I'm marking this series as deferred pending acceptance of the bindings.
Please repost or ping me once that has happened.

> ---
>  arch/arm/boot/dts/r7s72100-rskrza1.dts | 33 ++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/r7s72100-rskrza1.dts b/arch/arm/boot/dts/r7s72100-rskrza1.dts
> index 8ee44a100e9a44c4..60e80ecbbf6826bc 100644
> --- a/arch/arm/boot/dts/r7s72100-rskrza1.dts
> +++ b/arch/arm/boot/dts/r7s72100-rskrza1.dts
> @@ -47,6 +47,34 @@
>  	clock-frequency = <13330000>;
>  };
>  
> +&i2c3 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c3_pins>;
> +	status = "okay";
> +
> +	clock-frequency = <400000>;
> +
> +	io_expander1: gpio@20 {
> +		compatible = "onnn,cat9554";
> +		reg = <0x20>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +	};
> +
> +	io_expander2: gpio@21 {
> +		compatible = "onnn,cat9554";
> +		reg = <0x21>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +	};
> +
> +	eeprom@50 {
> +		compatible = "renesas,r1ex24016", "atmel,24c16";
> +		reg = <0x50>;
> +		pagesize = <16>;
> +	};
> +};
> +
>  &usb_x1_clk {
>  	clock-frequency = <48000000>;
>  };
> @@ -56,6 +84,11 @@
>  };
>  
>  &pinctrl {
> +	/* RIIC ch3 (Port Expander, EEPROM (MAC Addr), Audio Codec) */
> +	i2c3_pins: i2c3 {
> +		pinmux = <RZA1_PINMUX(1, 6, 1)>,	/* RIIC3SCL */
> +			 <RZA1_PINMUX(1, 7, 1)>;	/* RIIC3SDA */
> +	};
>  
>  	/* Serial Console */
>  	scif2_pins: serial2 {
> -- 
> 2.17.1
> 
