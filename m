Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f45.google.com ([209.85.215.45]:33208 "EHLO
	mail-lf0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751741AbcEMLke (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 13 May 2016 07:40:34 -0400
Received: by mail-lf0-f45.google.com with SMTP id y84so87178653lfc.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 May 2016 04:40:33 -0700 (PDT)
Subject: Re: [PATCH 18/23] ARM: dts: lager: Fix W=1 dtc warnings
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <1463126163-29423-1-git-send-email-geert+renesas@glider.be>
 <1463126163-29423-19-git-send-email-geert+renesas@glider.be>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <749bd9bd-aeb9-49fe-b1f9-31da008ae696@cogentembedded.com>
Date: Fri, 13 May 2016 14:40:31 +0300
MIME-Version: 1.0
In-Reply-To: <1463126163-29423-19-git-send-email-geert+renesas@glider.be>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 5/13/2016 10:55 AM, Geert Uytterhoeven wrote:

> Warning (unit_address_vs_reg): Node /keyboard/button@1 has a unit name, but no reg property
> Warning (unit_address_vs_reg): Node /keyboard/button@2 has a unit name, but no reg property
> Warning (unit_address_vs_reg): Node /keyboard/button@3 has a unit name, but no reg property
> Warning (unit_address_vs_reg): Node /keyboard/button@4 has a unit name, but no reg property
> Warning (unit_address_vs_reg): Node /fixedregulator@0 has a unit name, but no reg property
> Warning (unit_address_vs_reg): Node /regulator@1 has a unit name, but no reg property
> Warning (unit_address_vs_reg): Node /regulator@2 has a unit name, but no reg property
> Warning (unit_address_vs_reg): Node /regulator@3 has a unit name, but no reg property
> Warning (unit_address_vs_reg): Node /regulator@4 has a unit name, but no reg property
> Warning (unit_address_vs_reg): Node /i2c@8 has a unit name, but no reg property
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/arm/boot/dts/r8a7790-lager.dts | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/arch/arm/boot/dts/r8a7790-lager.dts b/arch/arm/boot/dts/r8a7790-lager.dts
> index 749ba02b6a53a9de..c01e27868083147a 100644
> --- a/arch/arm/boot/dts/r8a7790-lager.dts
> +++ b/arch/arm/boot/dts/r8a7790-lager.dts
[...]
> @@ -119,7 +119,7 @@
>  		};
>  	};
>
> -	fixedregulator3v3: fixedregulator@0 {
> +	fixedregulator3v3: fixedregulator3v3 {

    Likewise, could you drop "fixed"?

[...]

MBR, Sergei
