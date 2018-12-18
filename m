Return-Path: <SRS0=VX+A=O3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BD7FC43387
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Dec 2018 15:05:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3E13A21852
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Dec 2018 15:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1545145554;
	bh=BwpAlikSKP6t8yYxfE59rH96zP0UZEdL96MhnD6tNN0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=1JoG9GqVI1EDdUj7C0QG8RliB/3f8KRvj0vlGRmfKAvPU21Lt4rUfA2kC2hnjCIsN
	 IgJxAUrcXtNAgILRx85I6NiOrgVb0WY3FYmj66FRyNE3LuhY597N+1Ke/k70iEKYIY
	 x4zRH5ce/1V7qKkFR6DvsgLV+Eid19KRyA00gwtY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726610AbeLRPFx (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 18 Dec 2018 10:05:53 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:42317 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726555AbeLRPFx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Dec 2018 10:05:53 -0500
Received: by mail-oi1-f193.google.com with SMTP id w13so2169532oiw.9;
        Tue, 18 Dec 2018 07:05:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=EBced+2PgZew+WZQIOiFSCTG+u6TccoBffpYVyTuASg=;
        b=ppvztKn4q+QPaUEHY8Awa3B4zXob/TwrGdLqeAo4jAcdmJafztZ83Jey8mZwZYQR/e
         UuzWEXh8ZkVmm4RvTNLMBPIYR0x7s8Vsl+b9xGgbahC9jaYYIrFDU1jGe08Ci6ou2tJB
         c1oRITltSHk3aVQy4xuiUdIm29fHj0jLHGoLqwBnOwaIzvMFT8nk6mnuAl5iLKRAShSp
         Yl7PPyXR9c28B/DV3JZvCDfcRWtEFuzX6Zv3OlyqyjYW4IcQKLAxjoapn+MX1OY8nhuV
         R1ih2ihOGmO0onT3PjTnlbbihxgsj4XbUUkBu3t5gV43vHe+nZDe4qy3kz8UCWKod8Yo
         Sovw==
X-Gm-Message-State: AA+aEWZ9Uk+pllDcNh1TV8LMi4zgkeTCtXjBEtORoVf85/JeE5idQcoy
        wxwIteaQkWnz9UQONcBLag==
X-Google-Smtp-Source: AFSGD/WhvOgS8Pf3tzyh2a47k3+1QmZCBSICarBoGAOQ9sUqGFqebBb0LzGhnCGnAMLZJdsnLarpFg==
X-Received: by 2002:aca:6b8c:: with SMTP id g134mr7493403oic.135.1545145552286;
        Tue, 18 Dec 2018 07:05:52 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id h16sm7825424otl.29.2018.12.18.07.05.51
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Dec 2018 07:05:51 -0800 (PST)
Date:   Tue, 18 Dec 2018 09:05:51 -0600
From:   Rob Herring <robh@kernel.org>
To:     Chris Brandt <chris.brandt@renesas.com>
Cc:     Simon Horman <horms@verge.net.au>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 1/2] ARM: dts: r7s9210: Initial SoC device tree
Message-ID: <20181218150551.GA15519@bogus>
References: <20181217144324.99422-1-chris.brandt@renesas.com>
 <20181217144324.99422-2-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181217144324.99422-2-chris.brandt@renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Dec 17, 2018 at 09:43:23AM -0500, Chris Brandt wrote:
> Basic support for the RZ/A2 (R7S9210) SoC.
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
> v2:
>  * Fixed cpg node name to match reg address
>  * Removed the clocks subnode
>  * SCIF register range 18 to 0x18
>  * Removed 'reset-cells' from cpg because resets not supported (yet?)
>  * Sorted nodes by address (per group of device
> ---
>  arch/arm/boot/dts/r7s9210.dtsi | 204 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 204 insertions(+)
>  create mode 100644 arch/arm/boot/dts/r7s9210.dtsi
> 
> diff --git a/arch/arm/boot/dts/r7s9210.dtsi b/arch/arm/boot/dts/r7s9210.dtsi
> new file mode 100644
> index 000000000000..2b589226895e
> --- /dev/null
> +++ b/arch/arm/boot/dts/r7s9210.dtsi
> @@ -0,0 +1,204 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree Source for the R7S9210 SoC
> + *
> + * Copyright (C) 2018 Renesas Electronics Corporation
> + *
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/r7s9210-cpg-mssr.h>
> +
> +/ {
> +	compatible = "renesas,r7s9210";
> +	interrupt-parent = <&gic>;
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +
> +	bsid: chipid@fcfe8004 {

Put all the mmio peripherals under a simple-bus node or nodes.

> +		compatible = "renesas,bsid";
> +		reg = <0xfcfe8004 4>;
> +	};
> +
> +	/* External clocks */
> +	extal_clk: extal {
> +		#clock-cells = <0>;
> +		compatible = "fixed-clock";
> +		/* Value must be set by board */
> +		clock-frequency = <0>;
> +	};
> +
> +	rtc_x1_clk: rtc_x1 {
> +		#clock-cells = <0>;
> +		compatible = "fixed-clock";
> +		/* If clk present, value (32678) must be set by board */
> +		clock-frequency = <0>;
> +	};
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a9";
> +			reg = <0>;
> +			clock-frequency = <528000000>;
> +			next-level-cache = <&L2>;
> +		};
> +	};
> +
> +	L2: cache-controller@1f003000 {
> +		compatible = "arm,pl310-cache";
> +		reg = <0x1f003000 0x1000>;
> +		interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
> +		arm,early-bresp-disable;
> +		arm,full-line-zero-disable;
> +		cache-unified;
> +		cache-level = <2>;
> +	};
> +
> +	gic: interrupt-controller@e8221000 {
> +		compatible = "arm,gic-400";

Kind of strange that a single core A9 uses an external GIC rather than 
the built-in one.

> +		#interrupt-cells = <3>;
> +		#address-cells = <0>;
> +		interrupt-controller;
> +		reg = <0xe8221000 0x1000>,
> +		      <0xe8222000 0x1000>;
> +	};
> +
> +	cpg: clock-controller@fcfe0010 {
> +		compatible = "renesas,r7s9210-cpg-mssr";
> +		reg = <0xfcfe0010 0x455>;
> +		clocks = <&extal_clk>;
> +		clock-names = "extal";
> +		#clock-cells = <2>;
> +		#power-domain-cells = <0>;
> +	};
> +
> +	wdt: watchdog@fcfe7000 {
> +		compatible = "renesas,r7s9210-wdt", "renesas,rza-wdt";
> +		reg = <0xfcfe7000 0x26>;
> +		interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cpg CPG_CORE R7S9210_CLK_P0>;
> +	};
> +
> +	pinctrl: pin-controller@fcffe000 {
> +		compatible = "renesas,r7s9210-pinctrl";
> +		reg = <0xfcffe000 0x1000>;
> +
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		gpio-ranges = <&pinctrl 0 0 176>;
> +	};
> +
> +	scif0: serial@e8007000 {
> +		compatible = "renesas,scif-r7s9210";
> +		reg = <0xe8007000 0x18>;
> +		interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "eri", "rxi", "txi", "bri", "dri", "tei";
> +		clocks = <&cpg CPG_MOD 47>;
> +		clock-names = "fck";
> +		power-domains = <&cpg>;
> +		status = "disabled";
> +	};
> +
> +	scif1: serial@e8007800 {
> +		compatible = "renesas,scif-r7s9210";
> +		reg = <0xe8007800 0x18>;
> +		interrupts = <GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 273 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 274 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 274 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "eri", "rxi", "txi", "bri", "dri", "tei";
> +		clocks = <&cpg CPG_MOD 46>;
> +		clock-names = "fck";
> +		power-domains = <&cpg>;
> +		status = "disabled";
> +	};
> +
> +	scif2: serial@e8008000 {
> +		compatible = "renesas,scif-r7s9210";
> +		reg = <0xe8008000 0x18>;
> +		interrupts = <GIC_SPI 277 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 278 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 277 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "eri", "rxi", "txi", "bri", "dri", "tei";
> +		clocks = <&cpg CPG_MOD 45>;
> +		clock-names = "fck";
> +		power-domains = <&cpg>;
> +		status = "disabled";
> +	};
> +
> +	scif3: serial@e8008800 {
> +		compatible = "renesas,scif-r7s9210";
> +		reg = <0xe8008800 0x18>;
> +		interrupts = <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 285 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 286 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 286 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "eri", "rxi", "txi", "bri", "dri", "tei";
> +		clocks = <&cpg CPG_MOD 44>;
> +		clock-names = "fck";
> +		power-domains = <&cpg>;
> +		status = "disabled";
> +	};
> +
> +	scif4: serial@e8009000 {
> +		compatible = "renesas,scif-r7s9210";
> +		reg = <0xe8009000 0x18>;
> +		interrupts = <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 291 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 292 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 292 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "eri", "rxi", "txi", "bri", "dri", "tei";
> +		clocks = <&cpg CPG_MOD 43>;
> +		clock-names = "fck";
> +		power-domains = <&cpg>;
> +		status = "disabled";
> +	};
> +
> +	ostm0: timer@e803b000 {
> +		compatible = "renesas,r7s9210-ostm", "renesas,ostm";
> +		reg = <0xe803b000 0x30>;
> +		interrupts = <GIC_SPI 56 IRQ_TYPE_EDGE_RISING>;
> +		clocks = <&cpg CPG_MOD 36>;
> +		clock-names = "ostm0";
> +		power-domains = <&cpg>;
> +		status = "disabled";
> +	};
> +
> +	ostm1: timer@e803c000 {
> +		compatible = "renesas,r7s9210-ostm", "renesas,ostm";
> +		reg = <0xe803c000 0x30>;
> +		interrupts = <GIC_SPI 57 IRQ_TYPE_EDGE_RISING>;
> +		clocks = <&cpg CPG_MOD 35>;
> +		clock-names = "ostm1";
> +		power-domains = <&cpg>;
> +		status = "disabled";
> +	};
> +
> +	ostm2: timer@e803d000 {
> +		compatible = "renesas,r7s9210-ostm", "renesas,ostm";
> +		reg = <0xe803d000 0x30>;
> +		interrupts = <GIC_SPI 58 IRQ_TYPE_EDGE_RISING>;
> +		clocks = <&cpg CPG_MOD 34>;
> +		clock-names = "ostm2";
> +		power-domains = <&cpg>;
> +		status = "disabled";
> +	};
> +};
> -- 
> 2.16.1
> 
