Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:53076 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754153AbdLTJlc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Dec 2017 04:41:32 -0500
Date: Wed, 20 Dec 2017 10:41:28 +0100
From: Simon Horman <horms@verge.net.au>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/5] ARM: dts: iwg20d-q7-common: Sound PIO support
Message-ID: <20171220094128.cffetpgij42m57kq@verge.net.au>
References: <1513621361-10944-1-git-send-email-biju.das@bp.renesas.com>
 <1513621361-10944-2-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1513621361-10944-2-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Dec 18, 2017 at 06:22:37PM +0000, Biju Das wrote:
> Enable sound PIO support on carrier board.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
> v1-->v2
>  * Reworked sorting
> 
>  arch/arm/boot/dts/iwg20d-q7-common.dtsi | 46 +++++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/iwg20d-q7-common.dtsi b/arch/arm/boot/dts/iwg20d-q7-common.dtsi
> index 2070b14..ed67201 100644
> --- a/arch/arm/boot/dts/iwg20d-q7-common.dtsi
> +++ b/arch/arm/boot/dts/iwg20d-q7-common.dtsi
> @@ -34,6 +34,22 @@
>  		regulator-always-on;
>  	};
>  
> +	rsnd_sgtl5000: sound {
> +		compatible = "simple-audio-card";
> +
> +		simple-audio-card,format = "i2s";
> +		simple-audio-card,bitclock-master = <&sndcodec>;
> +		simple-audio-card,frame-master = <&sndcodec>;
> +
> +		sndcpu: simple-audio-card,cpu {
> +			sound-dai = <&rcar_sound>;
> +		};
> +
> +		sndcodec: simple-audio-card,codec {
> +			sound-dai = <&sgtl5000>;

I'm sorry for not noticing this earlier but with this patch applied
(and none of the others in this series) I see the following error:

arch/arm/boot/dts/r8a7743-iwg20d-q7.dtb: ERROR (phandle_references):
Reference to non-existent node or label "sgtl5000"

At the very least this will break bisection.
Please find a way to avoid this.
