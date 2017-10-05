Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:47356 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751280AbdJEPEu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Oct 2017 11:04:50 -0400
Cc: Sudeep Holla <sudeep.holla@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/2] arm64: dts: r8a7796: Add OPPs table for cpu
 devices
To: Simon Horman <horms+renesas@verge.net.au>,
        linux-renesas-soc@vger.kernel.org
References: <1507209984-17123-1-git-send-email-horms+renesas@verge.net.au>
 <1507209984-17123-3-git-send-email-horms+renesas@verge.net.au>
From: Sudeep Holla <sudeep.holla@arm.com>
Message-ID: <e2e31fd8-b5f8-40a8-df3d-e7726bb8a8e1@arm.com>
Date: Thu, 5 Oct 2017 16:04:47 +0100
MIME-Version: 1.0
In-Reply-To: <1507209984-17123-3-git-send-email-horms+renesas@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>



On 05/10/17 14:26, Simon Horman wrote:
> From: Dien Pham <dien.pham.ry@rvc.renesas.com>
> 
> Current, OPP tables are defined temporary,
> they are being evaluated and adjust in future.
> 

I assume these OPPs will continue to work in future but just not optimal.

> Based in part on work by Hien Dang.
> 
> Signed-off-by: Dien Pham <dien.pham.ry@rvc.renesas.com>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
> v2 [Simon Horman]
> - Only provide one operating points node for each operating-points-v2 node
>   as per the binding; other nodes were unused and have been removed
> 
> v1 [Simon Horman]
> - consolidated several patches into one
> 
> v0 [Dien Pham]
> ---
>  arch/arm64/boot/dts/renesas/r8a7796.dtsi | 58 ++++++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> index 57ac5ca6ed98..2d9edc61437c 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> @@ -46,6 +46,8 @@
>  			power-domains = <&sysc R8A7796_PD_CA57_CPU0>;
>  			next-level-cache = <&L2_CA57>;
>  			enable-method = "psci";
> +			clocks =<&cpg CPG_CORE R8A7796_CLK_Z>;
> +			operating-points-v2 = <&cluster0_opp>;
>  		};
>  
>  		a57_1: cpu@1 {
> @@ -55,6 +57,7 @@
>  			power-domains = <&sysc R8A7796_PD_CA57_CPU1>;
>  			next-level-cache = <&L2_CA57>;
>  			enable-method = "psci";

Just curious why clocks are not specified in secondaries ?
Does this continue work if I hotplug out CPUs in ascending order and
then hotplug back in descending order ? Also the current driver or OS
may deal with that but not a good assumption when write DT

-- 
Regards,
Sudeep
