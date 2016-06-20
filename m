Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f48.google.com ([209.85.215.48]:36090 "EHLO
	mail-lf0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751462AbcFTVMb (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 20 Jun 2016 17:12:31 -0400
Received: by mail-lf0-f48.google.com with SMTP id q132so47152921lfe.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Jun 2016 14:10:36 -0700 (PDT)
Subject: Re: [PATCH v4 13/13] ARM: dts: r8a7793: Add APMU node and second CPU
 core
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>
References: <1466072862-28030-1-git-send-email-geert+renesas@glider.be>
 <1466072862-28030-14-git-send-email-geert+renesas@glider.be>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Keita Kobayashi <keita.kobayashi.ym@renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Magnus Damm <damm+renesas@opensource.se>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <d862ed53-b57b-47b7-f783-bbeceb6eae3e@cogentembedded.com>
Date: Tue, 21 Jun 2016 00:05:02 +0300
MIME-Version: 1.0
In-Reply-To: <1466072862-28030-14-git-send-email-geert+renesas@glider.be>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 06/16/2016 01:27 PM, Geert Uytterhoeven wrote:

> From: Magnus Damm <damm+renesas@opensource.se>
>
> Add DT nodes for the Advanced Power Management Unit (APMU) and the
> second CPU core.  Use the enable-method to point out that the APMU
> should be used for SMP support.
>
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v4:
>   - Improve patch description,
>   - Use "renesas,<soctype>-apmu" instead of "renesas,apmu-<soctype>",
>
> v3:
>   - New.
> ---
>  arch/arm/boot/dts/r8a7793.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/arch/arm/boot/dts/r8a7793.dtsi b/arch/arm/boot/dts/r8a7793.dtsi
> index 9b55c1c6ee31a49d..fce310c54efa88eb 100644
> --- a/arch/arm/boot/dts/r8a7793.dtsi
> +++ b/arch/arm/boot/dts/r8a7793.dtsi
[...]
> @@ -56,6 +57,13 @@
>  			next-level-cache = <&L2_CA15>;
>  		};
>
> +		cpu1: cpu@1 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a15";
> +			reg = <1>;
> +			clock-frequency = <1500000000>;

    Why no "power-domains??

[...]

MBR, Sergei
