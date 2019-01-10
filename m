Return-Path: <SRS0=E4fS=PS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE75CC43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 10 Jan 2019 16:34:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8A118206B7
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 10 Jan 2019 16:34:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com header.i=@ragnatech-se.20150623.gappssmtp.com header.b="QXUi9YeW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727733AbfAJQeB (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 10 Jan 2019 11:34:01 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:42791 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727344AbfAJQeB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Jan 2019 11:34:01 -0500
Received: by mail-lj1-f195.google.com with SMTP id l15-v6so10246680lja.9
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Jan 2019 08:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=SILPKsssX93B2bCq9HZjULce0uDqO6Q10m7kNrgqwYI=;
        b=QXUi9YeW3unQmzoXtqNe3IB3+S5MFGteLRCy0Kwe6/pFc9Jmqm16in6HmByVWDIRKl
         6f3kuaV+Hh3b0K590egVDWxC3EU9IOQI6JuAV9ovtcXzu7hFKe8+1mx9XzOAwEq54iCE
         fML1LgdvPLufVrgPnhe7DXqhDIWyaDX6yBjsACzxiUxxE0i9+V/Q2paoLVGXPtarkqeh
         rCXSxKU1UEDjFrzrL5QbetyBm7NvL96HUXX0FFAuJX9f6M0f7+5SGf+3BNEtYTJLza0/
         XOVfs30FE+SreGAM7btblL82dShuFjdp/nzC+mQ8sRqNaHCSV3hOMtWhNutggiA0VfYz
         rkfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=SILPKsssX93B2bCq9HZjULce0uDqO6Q10m7kNrgqwYI=;
        b=TCGGOtHkgH4S74sTElHI8u21wUqvNpaQLcsP8yBh8xWNEhT+O9LZPk7quPFK14pAXs
         89V6wA0vRf7EQluN2D3gTmoenVJbsKvtNT/Aml/r4NbBQFbrGM4ZeylkoeEsbX+YAkD4
         jblgrFxJsWZ3fSJ8f5ElbjVt91mBVt+Yc2wihdP17mL4OPteHp7Ssn7tanUQV7JobHK7
         D2f8qD+Cf29wyX7+fctuvafDIRgtxq1OrKgrRcIZE546Zusd4qU1ZrkrD8Z74ZtHtjoh
         7B8UgZ+Ettmj6b1gWh8+u3e14YF4fAK5GoqLxIc1LGYQegDFnp4bY8+5gVeFFWQZT99J
         qwLg==
X-Gm-Message-State: AJcUukeAQ1jIt9cVH6nNGy5kpBSlbC1TNN53Ca1TpU/K17qSaKZNFSV3
        Al0KnEEhfVtq0lu69g8uEtwXU+wtK98=
X-Google-Smtp-Source: ALg8bN40Dwqt2DdMJ2jk1c/vrgkqNq2maRTL2zAtHeSLyqteGi7vJvrtg0u2HTWaoUmJZNNswxQ+VQ==
X-Received: by 2002:a2e:90ca:: with SMTP id o10-v6mr6296756ljg.134.1547138038210;
        Thu, 10 Jan 2019 08:33:58 -0800 (PST)
Received: from localhost (89-233-230-99.cust.bredband2.com. [89.233.230.99])
        by smtp.gmail.com with ESMTPSA id p77-v6sm17026542lja.0.2019.01.10.08.33.57
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Jan 2019 08:33:57 -0800 (PST)
Date:   Thu, 10 Jan 2019 17:33:57 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH/RFT] arm64: dts: renesas: r8a7795: Create thermal zone to
 support IPA
Message-ID: <20190110163356.GF24252@bigcity.dyn.berto.se>
References: <1545338982-19466-1-git-send-email-ykaneko0929@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1545338982-19466-1-git-send-email-ykaneko0929@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Keneko-san,

Thanks for your work.

Comments to this patch applies to all patches in this series.

On 2018-12-21 05:49:39 +0900, Yoshihiro Kaneko wrote:
> From: Dien Pham <dien.pham.ry@renesas.com>
> 
> [dien.pham.ry: arm64: dts: r8a7795: Add support IPA for CA53 core]
> 
> Setup a thermal zone driven by SoC temperature sensor.
> Create passive trip points and bind them to CPUFreq cooling
> device that supports power extension.
> 
> In R-Car Gen3, IPA is supportted for only one channel
>  (on H3/M3/M3N board, it is channel THS3). Reason:
>   Currently, IPA controls base on only CPU temperature.
>   And only one thermal channel is assembled closest
>   CPU cores is selected as target of IPA.
>   If other channels are used, IPA controlling is not properly.
> 
> Signed-off-by: Keita Kobayashi <keita.kobayashi.ym@renesas.com>
> [gaku.inami.xw: fix the trip temperature for cooling-device]
> [gaku.inami.xw: fix the power coefficient]
> Signed-off-by: Gaku Inami <gaku.inami.xw@bp.renesas.com>
> Signed-off-by: Hien Dang <hien.dang.eb@rvc.renesas.com>
> Signed-off-by: An Huynh <an.huynh.uj@rvc.renesas.com>
> [takeshi.kihara.df: fix W=1 dtc unit_address_vs_reg warnings]
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> ---
> 
> This patch is based on the devel branch of Simon Horman's renesas tree.
> 
>  arch/arm64/boot/dts/renesas/r8a7795.dtsi | 64 ++++++++++++++------------------
>  1 file changed, 27 insertions(+), 37 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> index af9605d..dd52b50 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> @@ -155,6 +155,9 @@
>  			power-domains = <&sysc R8A7795_PD_CA57_CPU0>;
>  			next-level-cache = <&L2_CA57>;
>  			enable-method = "psci";
> +			dynamic-power-coefficient = <854>;
> +			cooling-min-level = <0>;
> +			cooling-max-level = <2>;

I can't find any documentation or code which makes use of the 
cooling-min-level and cooling-max-level properties on v5.0-rc1. What is 
the intended usage for these properties?

>  			clocks = <&cpg CPG_CORE R8A7795_CLK_Z>;
>  			operating-points-v2 = <&cluster0_opp>;
>  			capacity-dmips-mhz = <1024>;
> @@ -207,6 +210,10 @@
>  			power-domains = <&sysc R8A7795_PD_CA53_CPU0>;
>  			next-level-cache = <&L2_CA53>;
>  			enable-method = "psci";
> +			#cooling-cells = <2>;
> +			dynamic-power-coefficient = <277>;
> +			cooling-min-level = <0>;
> +			cooling-max-level = <2>;
>  			clocks = <&cpg CPG_CORE R8A7795_CLK_Z2>;
>  			operating-points-v2 = <&cluster1_opp>;
>  			capacity-dmips-mhz = <535>;
> @@ -3098,58 +3105,30 @@
>  			polling-delay-passive = <250>;
>  			polling-delay = <1000>;
>  			thermal-sensors = <&tsc 0>;
> +			sustainable-power = <6313>;
>  
>  			trips {
> -				sensor1_passive: sensor1-passive {
> -					temperature = <95000>;
> -					hysteresis = <1000>;
> -					type = "passive";
> -				};
>  				sensor1_crit: sensor1-crit {
>  					temperature = <120000>;
>  					hysteresis = <1000>;
>  					type = "critical";
>  				};
>  			};
> -
> -			cooling-maps {
> -				map0 {
> -					trip = <&sensor1_passive>;
> -					cooling-device = <&a57_0 4 4>,
> -							 <&a57_1 4 4>,
> -							 <&a57_2 4 4>,
> -							 <&a57_3 4 4>;
> -				};
> -			};
>  		};
>  
>  		sensor_thermal2: sensor-thermal2 {
>  			polling-delay-passive = <250>;
>  			polling-delay = <1000>;
>  			thermal-sensors = <&tsc 1>;
> +			sustainable-power = <6313>;
>  
>  			trips {
> -				sensor2_passive: sensor2-passive {
> -					temperature = <95000>;
> -					hysteresis = <1000>;
> -					type = "passive";
> -				};
>  				sensor2_crit: sensor2-crit {
>  					temperature = <120000>;
>  					hysteresis = <1000>;
>  					type = "critical";
>  				};
>  			};
> -
> -			cooling-maps {
> -				map0 {
> -					trip = <&sensor2_passive>;
> -					cooling-device = <&a57_0 4 4>,
> -							 <&a57_1 4 4>,
> -							 <&a57_2 4 4>,
> -							 <&a57_3 4 4>;
> -				};
> -			};
>  		};
>  
>  		sensor_thermal3: sensor-thermal3 {
> @@ -3158,11 +3137,18 @@
>  			thermal-sensors = <&tsc 2>;
>  
>  			trips {
> -				sensor3_passive: sensor3-passive {
> -					temperature = <95000>;
> +				threshold: trip-point0 {
> +					temperature = <90000>;
> +					hysteresis = <1000>;
> +					type = "passive";
> +				};

What is the usage of trip-point0? The label threshold is never 
referenced anywhere, or am I missing something?

> +
> +				target: trip-point1 {
> +					temperature = <100000>;
>  					hysteresis = <1000>;
>  					type = "passive";
>  				};
> +
>  				sensor3_crit: sensor3-crit {
>  					temperature = <120000>;
>  					hysteresis = <1000>;
> @@ -3172,11 +3158,15 @@
>  
>  			cooling-maps {
>  				map0 {
> -					trip = <&sensor3_passive>;
> -					cooling-device = <&a57_0 4 4>,
> -							 <&a57_1 4 4>,
> -							 <&a57_2 4 4>,
> -							 <&a57_3 4 4>;
> +					trip = <&target>;
> +					cooling-device = <&a57_0 0 2>;

We have 5 (0-4) cooling states for the A57s on this SoC. Out of 
curiosity why allow states 0-2 here and not force it do more cooling or 
keep the to max cooling (4) as before this change as this is set to a 
trip point with a rather large temperature? Not saying this is wrong 
only curious :-)

> +					contribution = <1024>;
> +				};
> +
> +				map1 {
> +					trip = <&target>;
> +					cooling-device = <&a53_0 0 2>;
> +					contribution = <1024>;
>  				};
>  			};
>  		};
> -- 
> 1.9.1
> 

-- 
Regards,
Niklas Söderlund
