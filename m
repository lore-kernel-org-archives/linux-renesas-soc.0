Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f48.google.com ([209.85.215.48]:34320 "EHLO
	mail-lf0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751139AbcEMLid (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 13 May 2016 07:38:33 -0400
Received: by mail-lf0-f48.google.com with SMTP id m64so86676177lfd.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 May 2016 04:38:33 -0700 (PDT)
Subject: Re: [PATCH 19/23] ARM: dts: marzen: Fix W=1 dtc warnings
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <1463126163-29423-1-git-send-email-geert+renesas@glider.be>
 <1463126163-29423-20-git-send-email-geert+renesas@glider.be>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <9a8e0721-6489-f245-feda-e52badcdc557@cogentembedded.com>
Date: Fri, 13 May 2016 14:38:29 +0300
MIME-Version: 1.0
In-Reply-To: <1463126163-29423-20-git-send-email-geert+renesas@glider.be>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

On 5/13/2016 10:55 AM, Geert Uytterhoeven wrote:

> Warning (unit_address_vs_reg): Node /memory has a reg or ranges property, but no unit name
> Warning (unit_address_vs_reg): Node /fixedregulator@0 has a unit name, but no reg property
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/arm/boot/dts/r8a7779-marzen.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/r8a7779-marzen.dts b/arch/arm/boot/dts/r8a7779-marzen.dts
> index b795da6f5503d224..d9f3dba882f01181 100644
> --- a/arch/arm/boot/dts/r8a7779-marzen.dts
> +++ b/arch/arm/boot/dts/r8a7779-marzen.dts
> @@ -28,12 +28,12 @@
>  		stdout-path = &scif2;
>  	};
>
> -	memory {
> +	memory@60000000 {
>  		device_type = "memory";
>  		reg = <0x60000000 0x40000000>;
>  	};
>
> -	fixedregulator3v3: fixedregulator@0 {
> +	fixedregulator3v3: fixedregulator3v3 {

    Could you drop "fixed" prefix from the name, while at it?

>  		compatible = "regulator-fixed";
>  		regulator-name = "fixed-3.3V";
>  		regulator-min-microvolt = <3300000>;

MBR, Sergei
