Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f45.google.com ([209.85.215.45]:36759 "EHLO
	mail-lf0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754682AbcETPix (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 20 May 2016 11:38:53 -0400
Received: by mail-lf0-f45.google.com with SMTP id e130so16171497lfe.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 May 2016 08:38:52 -0700 (PDT)
Subject: Re: [PATCH v2 11/23] ARM: dts: armadillo800eva: Fix W=1 dtc warnings
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Rob Herring <robh+dt@kernel.org>
References: <1463728214-13838-1-git-send-email-geert+renesas@glider.be>
 <1463728214-13838-12-git-send-email-geert+renesas@glider.be>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <e0a1fbc1-ac95-2c79-65ed-d0328679bb8a@cogentembedded.com>
Date: Fri, 20 May 2016 18:38:49 +0300
MIME-Version: 1.0
In-Reply-To: <1463728214-13838-12-git-send-email-geert+renesas@glider.be>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

On 05/20/2016 10:10 AM, Geert Uytterhoeven wrote:

> Warning (unit_address_vs_reg): Node /memory has a reg or ranges property, but no unit name
> Warning (unit_address_vs_reg): Node /regulator@0 has a unit name, but no reg property
> Warning (unit_address_vs_reg): Node /regulator@1 has a unit name, but no reg property
> Warning (unit_address_vs_reg): Node /regulator@2 has a unit name, but no reg property
> Warning (unit_address_vs_reg): Node /regulator@3 has a unit name, but no reg property
> Warning (unit_address_vs_reg): Node /i2c@2 has a unit name, but no reg property
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - No changes.
> ---
>  arch/arm/boot/dts/r8a7740-armadillo800eva.dts | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm/boot/dts/r8a7740-armadillo800eva.dts b/arch/arm/boot/dts/r8a7740-armadillo800eva.dts
> index 2c82dab2b6f45f9c..b3f0ac4b99bd5a3d 100644
> --- a/arch/arm/boot/dts/r8a7740-armadillo800eva.dts
> +++ b/arch/arm/boot/dts/r8a7740-armadillo800eva.dts
[...]
> @@ -127,7 +127,7 @@
>  		};
>  	};
>
> -	i2c2: i2c@2 {
> +	i2c2: i2c2 {

    Not "i2c-2" as in the other patches?

>  		#address-cells = <1>;
>  		#size-cells = <0>;
>  		compatible = "i2c-gpio";

MBR, Sergei
