Return-Path: <SRS0=yOlw=SK=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83D82C10F13
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  8 Apr 2019 12:29:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3A9A12063F
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  8 Apr 2019 12:29:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="WTD7KpyA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726497AbfDHM3p (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 8 Apr 2019 08:29:45 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:52008 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726343AbfDHM3p (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Apr 2019 08:29:45 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 5B0B925B820;
        Mon,  8 Apr 2019 22:29:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1554726583; bh=BviNhspWnbX6108qQjlhMizpJVkrTBdP43sFJyReaNk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WTD7KpyAh9TMRphrNAldBXAbdUSuCIu8DZB0EGykPiPHgeMKj8N5Feh8XSsiKQ1Mx
         +LJoXrWPF9FfJKEmG661xNTZEa6YVb+lKiRzKgGSorvgv3i10njyuVg3r49BXD5FYK
         h+GyF72vxhZRA7gks+bYL4/oQDeO14NkHcDMHlfA=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 9417794069B; Mon,  8 Apr 2019 14:29:41 +0200 (CEST)
Date:   Mon, 8 Apr 2019 14:29:41 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH/RFT] arm64: dts: renesas: r8a7795: Create thermal zone to
 support IPA
Message-ID: <20190408122941.wziujh5ibgwy5cdp@verge.net.au>
References: <1545338982-19466-1-git-send-email-ykaneko0929@gmail.com>
 <20190110163356.GF24252@bigcity.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190110163356.GF24252@bigcity.dyn.berto.se>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jan 10, 2019 at 05:33:57PM +0100, Niklas Söderlund wrote:
> Hi Keneko-san,
> 
> Thanks for your work.
> 
> Comments to this patch applies to all patches in this series.
> 
> On 2018-12-21 05:49:39 +0900, Yoshihiro Kaneko wrote:
> > From: Dien Pham <dien.pham.ry@renesas.com>
> > 
> > [dien.pham.ry: arm64: dts: r8a7795: Add support IPA for CA53 core]
> > 
> > Setup a thermal zone driven by SoC temperature sensor.
> > Create passive trip points and bind them to CPUFreq cooling
> > device that supports power extension.
> > 
> > In R-Car Gen3, IPA is supportted for only one channel
> >  (on H3/M3/M3N board, it is channel THS3). Reason:
> >   Currently, IPA controls base on only CPU temperature.
> >   And only one thermal channel is assembled closest
> >   CPU cores is selected as target of IPA.
> >   If other channels are used, IPA controlling is not properly.
> > 
> > Signed-off-by: Keita Kobayashi <keita.kobayashi.ym@renesas.com>
> > [gaku.inami.xw: fix the trip temperature for cooling-device]
> > [gaku.inami.xw: fix the power coefficient]
> > Signed-off-by: Gaku Inami <gaku.inami.xw@bp.renesas.com>
> > Signed-off-by: Hien Dang <hien.dang.eb@rvc.renesas.com>
> > Signed-off-by: An Huynh <an.huynh.uj@rvc.renesas.com>
> > [takeshi.kihara.df: fix W=1 dtc unit_address_vs_reg warnings]
> > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> > ---
> > 
> > This patch is based on the devel branch of Simon Horman's renesas tree.
> > 
> >  arch/arm64/boot/dts/renesas/r8a7795.dtsi | 64 ++++++++++++++------------------
> >  1 file changed, 27 insertions(+), 37 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> > index af9605d..dd52b50 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> > @@ -155,6 +155,9 @@
> >  			power-domains = <&sysc R8A7795_PD_CA57_CPU0>;
> >  			next-level-cache = <&L2_CA57>;
> >  			enable-method = "psci";
> > +			dynamic-power-coefficient = <854>;
> > +			cooling-min-level = <0>;
> > +			cooling-max-level = <2>;
> 
> I can't find any documentation or code which makes use of the 
> cooling-min-level and cooling-max-level properties on v5.0-rc1. What is 
> the intended usage for these properties?

It looks like these properties were removed in v4.17-rc1 by
bbcf071969b2 ("cpufreq: cpu0: rename driver and internals to 'cpufreq_dt'")
and should be dropped from this and similar patches.

> 
> >  			clocks = <&cpg CPG_CORE R8A7795_CLK_Z>;
> >  			operating-points-v2 = <&cluster0_opp>;
> >  			capacity-dmips-mhz = <1024>;
> > @@ -207,6 +210,10 @@
> >  			power-domains = <&sysc R8A7795_PD_CA53_CPU0>;
> >  			next-level-cache = <&L2_CA53>;
> >  			enable-method = "psci";
> > +			#cooling-cells = <2>;
> > +			dynamic-power-coefficient = <277>;
> > +			cooling-min-level = <0>;
> > +			cooling-max-level = <2>;
> >  			clocks = <&cpg CPG_CORE R8A7795_CLK_Z2>;
> >  			operating-points-v2 = <&cluster1_opp>;
> >  			capacity-dmips-mhz = <535>;
> > @@ -3098,58 +3105,30 @@
> >  			polling-delay-passive = <250>;
> >  			polling-delay = <1000>;
> >  			thermal-sensors = <&tsc 0>;
> > +			sustainable-power = <6313>;
> >  
> >  			trips {
> > -				sensor1_passive: sensor1-passive {
> > -					temperature = <95000>;
> > -					hysteresis = <1000>;
> > -					type = "passive";
> > -				};
> >  				sensor1_crit: sensor1-crit {
> >  					temperature = <120000>;
> >  					hysteresis = <1000>;
> >  					type = "critical";
> >  				};
> >  			};
> > -
> > -			cooling-maps {
> > -				map0 {
> > -					trip = <&sensor1_passive>;
> > -					cooling-device = <&a57_0 4 4>,
> > -							 <&a57_1 4 4>,
> > -							 <&a57_2 4 4>,
> > -							 <&a57_3 4 4>;
> > -				};
> > -			};
> >  		};
> >  
> >  		sensor_thermal2: sensor-thermal2 {
> >  			polling-delay-passive = <250>;
> >  			polling-delay = <1000>;
> >  			thermal-sensors = <&tsc 1>;
> > +			sustainable-power = <6313>;
> >  
> >  			trips {
> > -				sensor2_passive: sensor2-passive {
> > -					temperature = <95000>;
> > -					hysteresis = <1000>;
> > -					type = "passive";
> > -				};
> >  				sensor2_crit: sensor2-crit {
> >  					temperature = <120000>;
> >  					hysteresis = <1000>;
> >  					type = "critical";
> >  				};
> >  			};
> > -
> > -			cooling-maps {
> > -				map0 {
> > -					trip = <&sensor2_passive>;
> > -					cooling-device = <&a57_0 4 4>,
> > -							 <&a57_1 4 4>,
> > -							 <&a57_2 4 4>,
> > -							 <&a57_3 4 4>;
> > -				};
> > -			};
> >  		};
> >  
> >  		sensor_thermal3: sensor-thermal3 {
> > @@ -3158,11 +3137,18 @@
> >  			thermal-sensors = <&tsc 2>;
> >  
> >  			trips {
> > -				sensor3_passive: sensor3-passive {
> > -					temperature = <95000>;
> > +				threshold: trip-point0 {
> > +					temperature = <90000>;
> > +					hysteresis = <1000>;
> > +					type = "passive";
> > +				};
> 
> What is the usage of trip-point0? The label threshold is never 
> referenced anywhere, or am I missing something?

Good point. Given this patch in its current form I think trip-point0
should be dropped.

> 
> > +
> > +				target: trip-point1 {
> > +					temperature = <100000>;
> >  					hysteresis = <1000>;
> >  					type = "passive";
> >  				};
> > +
> >  				sensor3_crit: sensor3-crit {
> >  					temperature = <120000>;
> >  					hysteresis = <1000>;
> > @@ -3172,11 +3158,15 @@
> >  
> >  			cooling-maps {
> >  				map0 {
> > -					trip = <&sensor3_passive>;
> > -					cooling-device = <&a57_0 4 4>,
> > -							 <&a57_1 4 4>,
> > -							 <&a57_2 4 4>,
> > -							 <&a57_3 4 4>;
> > +					trip = <&target>;
> > +					cooling-device = <&a57_0 0 2>;
> 
> We have 5 (0-4) cooling states for the A57s on this SoC. Out of 
> curiosity why allow states 0-2 here and not force it do more cooling or 
> keep the to max cooling (4) as before this change as this is set to a 
> trip point with a rather large temperature? Not saying this is wrong 
> only curious :-)

This I do not know. Do you think it would be worth following-up on
internally?

> > +					contribution = <1024>;
> > +				};
> > +
> > +				map1 {
> > +					trip = <&target>;
> > +					cooling-device = <&a53_0 0 2>;
> > +					contribution = <1024>;
> >  				};
> >  			};
> >  		};
> > -- 
> > 1.9.1
> > 
> 
> -- 
> Regards,
> Niklas Söderlund
> 
