Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f43.google.com ([209.85.215.43]:35918 "EHLO
        mail-lf0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751752AbdH2O4f (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Aug 2017 10:56:35 -0400
Received: by mail-lf0-f43.google.com with SMTP id z12so14363821lfd.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Aug 2017 07:56:34 -0700 (PDT)
Date: Tue, 29 Aug 2017 16:56:30 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH] arm64: dts: r8a7795: Add OPPs table for cpu devices
Message-ID: <20170829145630.GH12099@bigcity.dyn.berto.se>
References: <1501853180-23939-1-git-send-email-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1501853180-23939-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

Thanks for your patches and sorry for getting to this a bit late.

On 2017-08-04 15:26:20 +0200, Simon Horman wrote:
> From: Dien Pham <dien.pham.ry@rvc.renesas.com>
> 
> Current, OPP tables are defined temporary,
> they are being evaluated and adjust in future.
> 
> Based in part on work by Hien Dang.
> 
> Signed-off-by: Dien Pham <dien.pham.ry@rvc.renesas.com>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> [simon: consolidated sseveral patches into one]
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
>  arch/arm64/boot/dts/renesas/r8a7795.dtsi | 309 +++++++++++++++++++++++++++++++
>  1 file changed, 309 insertions(+)
> 
> I am not aware of any build-time depdendencies of this patch.
> 
> This patch has run-time depdnencies on:
> * [PATCH] cpufreq: rcar: Add support for R8A7795 SoC
> * [PATCH 0/4] r8a7795: Add Z and Z2 clock support
> 
> I have provided an integration patch with this patch, those DTS changes,
> and Renesas clock updates also depended on by the DTS changes. The result
> is working CPUFreq for the r8a7795 (R-Car H3) ES1.0.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git topic/r8a7795-cpufreq
> 
> A description of steps taken to lightly exercise the above can be found here:
> 
> http://elinux.org/Tests:R-CAR-GEN3-CPUFreq

I tested this it's working, nice!

> 
> If this work is acceptable I plan to follow up with patches to
> enable CPUFreq on the r8a7796 (R-Car M3-W).
> 
> This patch is based on renesas-arm64-dt-for-v4.14
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> index a87ae76880ab..f34da4c9ea52 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> @@ -46,6 +46,12 @@
>  			power-domains = <&sysc R8A7795_PD_CA57_CPU0>;
>  			next-level-cache = <&L2_CA57>;
>  			enable-method = "psci";
> +			clocks =<&cpg CPG_CORE R8A7795_CLK_Z>;
> +			operating-points-v2 = <&cluster0_opp_tb0>,
> +				<&cluster0_opp_tb1>, <&cluster0_opp_tb2>,
> +				<&cluster0_opp_tb3>, <&cluster0_opp_tb4>,
> +				<&cluster0_opp_tb5>, <&cluster0_opp_tb6>,
> +				<&cluster0_opp_tb7>;

This however leaves me a bit confused. If I understand the bindings 
documentation you should only specify one phandle here. IIUC only the 
first one will be used anyhow, from drivers/base/power/opp/of.c

253 static struct device_node *_opp_of_get_opp_desc_node(struct device_node *np)
254 {
255         /*
256          * There should be only ONE phandle present in "operating-points-v2"
257          * property.
258          */
259 
260         return of_parse_phandle(np, "operating-points-v2", 0);
261 }

I tried to look at other sources and bindings and I can't find anywhere 
where more then one phandle could be useful, but I can have missed 
something? My interest in this is that I wish to hook it up with the 
thermal zones to have it act as passive cooling and implement the part 
of the BSP emergency shutdown driver using already available code and 
having more then one phandle here confuses me how to describe that in DT 
:-)

>  		};
>  
>  		a57_1: cpu@1 {
> @@ -55,6 +61,11 @@
>  			power-domains = <&sysc R8A7795_PD_CA57_CPU1>;
>  			next-level-cache = <&L2_CA57>;
>  			enable-method = "psci";
> +			operating-points-v2 = <&cluster0_opp_tb0>,
> +				<&cluster0_opp_tb1>, <&cluster0_opp_tb2>,
> +				<&cluster0_opp_tb3>, <&cluster0_opp_tb4>,
> +				<&cluster0_opp_tb5>, <&cluster0_opp_tb6>,
> +				<&cluster0_opp_tb7>;
>  		};
>  
>  		a57_2: cpu@2 {
> @@ -64,6 +75,11 @@
>  			power-domains = <&sysc R8A7795_PD_CA57_CPU2>;
>  			next-level-cache = <&L2_CA57>;
>  			enable-method = "psci";
> +			operating-points-v2 = <&cluster0_opp_tb0>,
> +				<&cluster0_opp_tb1>, <&cluster0_opp_tb2>,
> +				<&cluster0_opp_tb3>, <&cluster0_opp_tb4>,
> +				<&cluster0_opp_tb5>, <&cluster0_opp_tb6>,
> +				<&cluster0_opp_tb7>;
>  		};
>  
>  		a57_3: cpu@3 {
> @@ -73,6 +89,11 @@
>  			power-domains = <&sysc R8A7795_PD_CA57_CPU3>;
>  			next-level-cache = <&L2_CA57>;
>  			enable-method = "psci";
> +			operating-points-v2 = <&cluster0_opp_tb0>,
> +				<&cluster0_opp_tb1>, <&cluster0_opp_tb2>,
> +				<&cluster0_opp_tb3>, <&cluster0_opp_tb4>,
> +				<&cluster0_opp_tb5>, <&cluster0_opp_tb6>,
> +				<&cluster0_opp_tb7>;
>  		};
>  
>  		a53_0: cpu@100 {
> @@ -82,6 +103,8 @@
>  			power-domains = <&sysc R8A7795_PD_CA53_CPU0>;
>  			next-level-cache = <&L2_CA53>;
>  			enable-method = "psci";
> +			clocks =<&cpg CPG_CORE R8A7795_CLK_Z2>;
> +			operating-points-v2 = <&cluster1_opp_tb0>;
>  		};
>  
>  		a53_1: cpu@101 {
> @@ -91,6 +114,7 @@
>  			power-domains = <&sysc R8A7795_PD_CA53_CPU1>;
>  			next-level-cache = <&L2_CA53>;
>  			enable-method = "psci";
> +			operating-points-v2 = <&cluster1_opp_tb0>;
>  		};
>  
>  		a53_2: cpu@102 {
> @@ -100,6 +124,7 @@
>  			power-domains = <&sysc R8A7795_PD_CA53_CPU2>;
>  			next-level-cache = <&L2_CA53>;
>  			enable-method = "psci";
> +			operating-points-v2 = <&cluster1_opp_tb0>;
>  		};
>  
>  		a53_3: cpu@103 {
> @@ -109,6 +134,7 @@
>  			power-domains = <&sysc R8A7795_PD_CA53_CPU3>;
>  			next-level-cache = <&L2_CA53>;
>  			enable-method = "psci";
> +			operating-points-v2 = <&cluster1_opp_tb0>;
>  		};
>  
>  		L2_CA57: cache-controller-0 {
> @@ -126,6 +152,289 @@
>  		};
>  	};
>  
> +	cluster0_opp_tb0: opp_table0 {
> +		compatible = "operating-points-v2";
> +		opp-shared;
> +
> +		opp@500000000 {
> +			opp-hz = /bits/ 64 <500000000>;
> +			opp-microvolt = <830000>;
> +			clock-latency-ns = <300000>;
> +		};
> +		opp@1000000000 {
> +			opp-hz = /bits/ 64 <1000000000>;
> +			opp-microvolt = <830000>;
> +			clock-latency-ns = <300000>;
> +		};
> +		opp@1500000000 {
> +			opp-hz = /bits/ 64 <1500000000>;
> +			opp-microvolt = <830000>;
> +			clock-latency-ns = <300000>;
> +			opp-suspend;
> +		};
> +		opp@1600000000 {
> +			opp-hz = /bits/ 64 <1600000000>;
> +			opp-microvolt = <900000>;
> +			clock-latency-ns = <300000>;
> +			turbo-mode;
> +		};
> +		opp@1700000000 {
> +			opp-hz = /bits/ 64 <1700000000>;
> +			opp-microvolt = <960000>;
> +			clock-latency-ns = <300000>;
> +			turbo-mode;
> +		};
> +	};
> +
> +	cluster0_opp_tb1: opp_table1 {
> +		compatible = "operating-points-v2";
> +		opp-shared;
> +
> +		opp@500000000 {
> +			opp-hz = /bits/ 64 <500000000>;
> +			opp-microvolt = <820000>;
> +			clock-latency-ns = <300000>;
> +		};
> +		opp@1000000000 {
> +			opp-hz = /bits/ 64 <1000000000>;
> +			opp-microvolt = <820000>;
> +			clock-latency-ns = <300000>;
> +		};
> +		opp@1500000000 {
> +			opp-hz = /bits/ 64 <1500000000>;
> +			opp-microvolt = <820000>;
> +			clock-latency-ns = <300000>;
> +			opp-suspend;
> +		};
> +		opp@1600000000 {
> +			opp-hz = /bits/ 64 <1600000000>;
> +			opp-microvolt = <890000>;
> +			clock-latency-ns = <300000>;
> +			turbo-mode;
> +		};
> +		opp@1700000000 {
> +			opp-hz = /bits/ 64 <1700000000>;
> +			opp-microvolt = <950000>;
> +			clock-latency-ns = <300000>;
> +			turbo-mode;
> +		};
> +	};
> +
> +	cluster0_opp_tb2: opp_table2 {
> +		compatible = "operating-points-v2";
> +		opp-shared;
> +
> +		opp@500000000 {
> +			opp-hz = /bits/ 64 <500000000>;
> +			opp-microvolt = <810000>;
> +			clock-latency-ns = <300000>;
> +		};
> +		opp@1000000000 {
> +			opp-hz = /bits/ 64 <1000000000>;
> +			opp-microvolt = <810000>;
> +			clock-latency-ns = <300000>;
> +		};
> +		opp@1500000000 {
> +			opp-hz = /bits/ 64 <1500000000>;
> +			opp-microvolt = <810000>;
> +			clock-latency-ns = <300000>;
> +			opp-suspend;
> +		};
> +		opp@1600000000 {
> +			opp-hz = /bits/ 64 <1600000000>;
> +			opp-microvolt = <880000>;
> +			clock-latency-ns = <300000>;
> +			turbo-mode;
> +		};
> +		opp@1700000000 {
> +			opp-hz = /bits/ 64 <1700000000>;
> +			opp-microvolt = <930000>;
> +			clock-latency-ns = <300000>;
> +			turbo-mode;
> +		};
> +	};
> +
> +	cluster0_opp_tb3: opp_table3 {
> +		compatible = "operating-points-v2";
> +		opp-shared;
> +
> +		opp@500000000 {
> +			opp-hz = /bits/ 64 <500000000>;
> +			opp-microvolt = <800000>;
> +			clock-latency-ns = <300000>;
> +		};
> +		opp@1000000000 {
> +			opp-hz = /bits/ 64 <1000000000>;
> +			opp-microvolt = <800000>;
> +			clock-latency-ns = <300000>;
> +		};
> +		opp@1500000000 {
> +			opp-hz = /bits/ 64 <1500000000>;
> +			opp-microvolt = <800000>;
> +			clock-latency-ns = <300000>;
> +			opp-suspend;
> +		};
> +		opp@1600000000 {
> +			opp-hz = /bits/ 64 <1600000000>;
> +			opp-microvolt = <870000>;
> +			clock-latency-ns = <300000>;
> +			turbo-mode;
> +		};
> +		opp@1700000000 {
> +			opp-hz = /bits/ 64 <1700000000>;
> +			opp-microvolt = <910000>;
> +			clock-latency-ns = <300000>;
> +			turbo-mode;
> +		};
> +	};
> +
> +	cluster0_opp_tb4: opp_table4 {
> +		compatible = "operating-points-v2";
> +		opp-shared;
> +
> +		opp@500000000 {
> +			opp-hz = /bits/ 64 <500000000>;
> +			opp-microvolt = <790000>;
> +			clock-latency-ns = <300000>;
> +		};
> +		opp@1000000000 {
> +			opp-hz = /bits/ 64 <1000000000>;
> +			opp-microvolt = <790000>;
> +			clock-latency-ns = <300000>;
> +		};
> +		opp@1500000000 {
> +			opp-hz = /bits/ 64 <1500000000>;
> +			opp-microvolt = <790000>;
> +			clock-latency-ns = <300000>;
> +			opp-suspend;
> +		};
> +		opp@1600000000 {
> +			opp-hz = /bits/ 64 <1600000000>;
> +			opp-microvolt = <860000>;
> +			clock-latency-ns = <300000>;
> +			turbo-mode;
> +		};
> +		opp@1700000000 {
> +			opp-hz = /bits/ 64 <1700000000>;
> +			opp-microvolt = <890000>;
> +			clock-latency-ns = <300000>;
> +			turbo-mode;
> +		};
> +	};
> +
> +	cluster0_opp_tb5: opp_table5 {
> +		compatible = "operating-points-v2";
> +		opp-shared;
> +
> +		opp@500000000 {
> +			opp-hz = /bits/ 64 <500000000>;
> +			opp-microvolt = <780000>;
> +			clock-latency-ns = <300000>;
> +		};
> +		opp@1000000000 {
> +			opp-hz = /bits/ 64 <1000000000>;
> +			opp-microvolt = <780000>;
> +			clock-latency-ns = <300000>;
> +		};
> +		opp@1500000000 {
> +			opp-hz = /bits/ 64 <1500000000>;
> +			opp-microvolt = <780000>;
> +			clock-latency-ns = <300000>;
> +			opp-suspend;
> +		};
> +		opp@1600000000 {
> +			opp-hz = /bits/ 64 <1600000000>;
> +			opp-microvolt = <850000>;
> +			clock-latency-ns = <300000>;
> +			turbo-mode;
> +		};
> +		opp@1700000000 {
> +			opp-hz = /bits/ 64 <1700000000>;
> +			opp-microvolt = <880000>;
> +			clock-latency-ns = <300000>;
> +			turbo-mode;
> +		};
> +	};
> +
> +	cluster0_opp_tb6: opp_table6 {
> +		compatible = "operating-points-v2";
> +		opp-shared;
> +
> +		opp@500000000 {
> +			opp-hz = /bits/ 64 <500000000>;
> +			opp-microvolt = <770000>;
> +			clock-latency-ns = <300000>;
> +		};
> +		opp@1000000000 {
> +			opp-hz = /bits/ 64 <1000000000>;
> +			opp-microvolt = <770000>;
> +			clock-latency-ns = <300000>;
> +		};
> +		opp@1500000000 {
> +			opp-hz = /bits/ 64 <1500000000>;
> +			opp-microvolt = <770000>;
> +			clock-latency-ns = <300000>;
> +			opp-suspend;
> +		};
> +		opp@1600000000 {
> +			opp-hz = /bits/ 64 <1600000000>;
> +			opp-microvolt = <840000>;
> +			clock-latency-ns = <300000>;
> +			turbo-mode;
> +		};
> +		opp@1700000000 {
> +			opp-hz = /bits/ 64 <1700000000>;
> +			opp-microvolt = <870000>;
> +			clock-latency-ns = <300000>;
> +			turbo-mode;
> +		};
> +	};
> +
> +	cluster0_opp_tb7: opp_table7 {
> +		compatible = "operating-points-v2";
> +		opp-shared;
> +
> +		opp@500000000 {
> +			opp-hz = /bits/ 64 <500000000>;
> +			opp-microvolt = <760000>;
> +			clock-latency-ns = <300000>;
> +		};
> +		opp@1000000000 {
> +			opp-hz = /bits/ 64 <1000000000>;
> +			opp-microvolt = <760000>;
> +			clock-latency-ns = <300000>;
> +		};
> +		opp@1500000000 {
> +			opp-hz = /bits/ 64 <1500000000>;
> +			opp-microvolt = <760000>;
> +			clock-latency-ns = <300000>;
> +			opp-suspend;
> +		};
> +		opp@1600000000 {
> +			opp-hz = /bits/ 64 <1600000000>;
> +			opp-microvolt = <830000>;
> +			clock-latency-ns = <300000>;
> +			turbo-mode;
> +		};
> +		opp@1700000000 {
> +			opp-hz = /bits/ 64 <1700000000>;
> +			opp-microvolt = <860000>;
> +			clock-latency-ns = <300000>;
> +			turbo-mode;
> +		};
> +	};
> +
> +	cluster1_opp_tb0: opp_table10 {
> +		compatible = "operating-points-v2";
> +		opp-shared;
> +
> +		opp@1200000000 {
> +			opp-hz = /bits/ 64 <1200000000>;
> +			opp-microvolt = <820000>;
> +			clock-latency-ns = <300000>;
> +		};
> +	};
> +
>  	extal_clk: extal {
>  		compatible = "fixed-clock";
>  		#clock-cells = <0>;
> -- 
> 2.1.4
> 
> 

-- 
Regards,
Niklas S�derlund
