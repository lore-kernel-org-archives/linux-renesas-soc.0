Return-Path: <SRS0=B/Gi=OV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8613AC6783B
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 02:15:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3456C20851
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 02:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1544580953;
	bh=ACM8d/nrbgg5elfdNYWtDuyWc73GJSuWXKeHTBbHbEE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Uop6dxvagR1gddmmMimGcTAlDMGLmuF8FML9cPeSSQC4p6s5+D3nps+3R/QqR+PrE
	 XIN658O23pM0ITrs9/N730n8wXN6mY3RFAQ3fimUvEL63uBWGMCOeLpuyLGpJLvRdR
	 7hJQczuLLBYVIsVOskKX8bSAzYPyLaA5vYn12ilE=
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3456C20851
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726218AbeLLCPw (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 11 Dec 2018 21:15:52 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:38157 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726211AbeLLCPw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Dec 2018 21:15:52 -0500
Received: by mail-oi1-f194.google.com with SMTP id a77so13796324oii.5;
        Tue, 11 Dec 2018 18:15:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zUv3HwjUyQzYeIEyAna7Ri4islal8pTXbZJkUZafUis=;
        b=qnS5JTQCoDBPYgo7KV3WRj8FCZ5pUrTFgUjQpHiFt9AEMxF838iFmKID0HvRYXG6Cm
         82DUsuW4yfIJGlyjPDcUXvKQTMjyYP5OSfoJLCRu9V7UtEtDWpluG5/74D1lzloPpzE3
         zgFCnp8iBsfG1bAVePZXcFAU9DAj4nqicsy9eMMcmdHKLBqB8+84lZ0fRNTjhGNvtXY9
         /Ho3s0BJkOLR/qbF6vY0razx8croWXkEONFvaCaZGxfveu+eBzgiZ8ombhnm5dHs7ztg
         i1OTYcPnlmaaNSehuTuC3mi1zilqPx7OXBVhWQ2zgkBFu+d2J8QVPa553aBorS7BQDnk
         MTBw==
X-Gm-Message-State: AA+aEWb0rjrgXKXZPLPAVj09mcw9tmEpQQJOS5WVnUt7KQXXUj7QUDA4
        domerYfoSo4cN1YBXOUPtA==
X-Google-Smtp-Source: AFSGD/VQDPFpQ46fYh4Mp6ym4rR1KbplgzX4P8kTxZHpLP91iPfOe29/rOAhYYnL7FomCdKMzHAGgQ==
X-Received: by 2002:aca:d78b:: with SMTP id o133mr2536217oig.232.1544580950131;
        Tue, 11 Dec 2018 18:15:50 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y2sm7063500oto.49.2018.12.11.18.15.49
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Dec 2018 18:15:49 -0800 (PST)
Date:   Tue, 11 Dec 2018 20:15:49 -0600
From:   Rob Herring <robh@kernel.org>
To:     Chris Brandt <chris.brandt@renesas.com>
Cc:     Simon Horman <horms@verge.net.au>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: dts: r7s9210-rza2mevb: Add support for RZ/A2M
 EVB
Message-ID: <20181212021549.GA26333@bogus>
References: <20181129130559.66732-1-chris.brandt@renesas.com>
 <20181129130559.66732-3-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181129130559.66732-3-chris.brandt@renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Nov 29, 2018 at 08:05:59AM -0500, Chris Brandt wrote:
> Add support for Renesas RZ/A2M evaluation board.
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
>  Documentation/devicetree/bindings/arm/shmobile.txt |   2 +
>  arch/arm/boot/dts/Makefile                         |   1 +
>  arch/arm/boot/dts/r7s9210-rza2mevb.dts             | 133 +++++++++++++++++++++
>  3 files changed, 136 insertions(+)
>  create mode 100644 arch/arm/boot/dts/r7s9210-rza2mevb.dts
> 
> diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
> index a94db59d8e2d..67a6810c4345 100644
> --- a/Documentation/devicetree/bindings/arm/shmobile.txt
> +++ b/Documentation/devicetree/bindings/arm/shmobile.txt
> @@ -125,6 +125,8 @@ Boards:
>      compatible = "renesas,porter", "renesas,r8a7791"
>    - RSKRZA1 (YR0K77210C000BE)
>      compatible = "renesas,rskrza1", "renesas,r7s72100"
> +  - RZ/A2M Eval Board (RTK7921053S00000BE)
> +    compatible = "renesas,rza2mevb", "renesas,r7s9210"
>    - RZN1D-DB (RZ/N1D Demo Board for the RZ/N1D 400 pins package)
>      compatible = "renesas,rzn1d400-db", "renesas,r9a06g032"
>    - Salvator-X (RTP0RC7795SIPB0010S)
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index b0e966d625b9..fbdd068fd8af 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -824,6 +824,7 @@ dtb-$(CONFIG_ARCH_RENESAS) += \
>  	r7s72100-genmai.dtb \
>  	r7s72100-gr-peach.dtb \
>  	r7s72100-rskrza1.dtb \
> +	r7s9210-rza2mevb.dtb \
>  	r8a73a4-ape6evm.dtb \
>  	r8a7740-armadillo800eva.dtb \
>  	r8a7743-iwg20d-q7.dtb \
> diff --git a/arch/arm/boot/dts/r7s9210-rza2mevb.dts b/arch/arm/boot/dts/r7s9210-rza2mevb.dts
> new file mode 100644
> index 000000000000..9570aeb8f1ce
> --- /dev/null
> +++ b/arch/arm/boot/dts/r7s9210-rza2mevb.dts
> @@ -0,0 +1,133 @@
> +/*
> + * Device Tree Source for the RZA2MEVB board
> + *
> + * Copyright (C) 2018 Renesas Electronics
> + *
> + * This file is dual-licensed: you can use it either under the terms
> + * of the GPL or the X11 license, at your option. Note that this dual
> + * licensing only applies to this file, and not this project as a
> + * whole.
> + *
> + *  a) This file is free software; you can redistribute it and/or
> + *     modify it under the terms of the GNU General Public License as
> + *     published by the Free Software Foundation; either version 2 of the
> + *     License, or (at your option) any later version.
> + *
> + *     This file is distributed in the hope that it will be useful,
> + *     but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *     GNU General Public License for more details.
> + *
> + * Or, alternatively,
> + *
> + *  b) Permission is hereby granted, free of charge, to any person
> + *     obtaining a copy of this software and associated documentation
> + *     files (the "Software"), to deal in the Software without
> + *     restriction, including without limitation the rights to use,
> + *     copy, modify, merge, publish, distribute, sublicense, and/or
> + *     sell copies of the Software, and to permit persons to whom the
> + *     Software is furnished to do so, subject to the following
> + *     conditions:
> + *
> + *     The above copyright notice and this permission notice shall be
> + *     included in all copies or substantial portions of the Software.
> + *
> + *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
> + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
> + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + *     OTHER DEALINGS IN THE SOFTWARE.
> + */
> +
> +/dts-v1/;
> +#include "r7s9210.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/pinctrl/r7s9210-pinctrl.h>
> +
> +/ {
> +	model = "RZA2MEVB";
> +	compatible = "renesas,rza2mevb", "renesas,r7s9210";
> +
> +	aliases {
> +		serial0 = &scif4;
> +	};
> +
> +	chosen {
> +		bootargs = "ignore_loglevel earlycon rootfstype=cramfs root=mtd:rootfs";
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	memory@80000000 {

Wrong unit-address.

> +		device_type = "memory";
> +		reg = <0x40000000 0x00800000>;	 /* HyperRAM */
> +	};
> +
> +	lbsc {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +	};
> +
> +	leds {
> +		status = "okay";

gpio-leds shouldn't need this as it shouldn't be in the SoC file.

> +		compatible = "gpio-leds";
> +
> +		led0 {
> +			gpios = <&pinctrl RZA2_PIN(PORT6, 0) GPIO_ACTIVE_HIGH>;
> +		};
> +	};
> +
> +	/* Cramfs XIP File System in QSPI */
> +	qspi@20000000 {


> +		compatible = "mtd-rom";

This should be the actual Quad-SPI controller and then a flash device 
underneath it. It may work as-is initially, but eventually won't you 
need the flash details?

> +		probe-type = "direct-mapped";	/* XIP from QSPI */
> +		reg = <0x20000000 0x4000000>;	/* 64 MB*/
> +		bank-width = <4>;
> +		device-width = <1>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		partition@800000 {

Best practice is grouping under a 'partitions' node.

> +			label ="rootfs";
> +			reg = <0x0800000 0x1000000>; /* 16MB @ 0x20800000 */
> +			read-only;
> +		};
> +	};
