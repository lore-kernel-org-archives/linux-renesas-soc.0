Return-Path: <SRS0=RWjW=PK=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1DEFC43387
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  2 Jan 2019 09:34:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3131E206C0
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  2 Jan 2019 09:34:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="d0HteeXy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726782AbfABJe5 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 2 Jan 2019 04:34:57 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:33455 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728768AbfABJe4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Jan 2019 04:34:56 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id D15C325BE2C;
        Wed,  2 Jan 2019 20:34:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1546421695; bh=7Mi/VhpVy0CSmw2zqP/qxmtl/7OBN6XbfYNTrrxTp6I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=d0HteeXyPmAEfBUDo2rx/nVmRN6vdUtizuDH6FbOI9eoa5wXJCfftZB9Rhrwkry/V
         hDePezd5xn0DHvJU3lRwswSd56rC84YZiXxyrRZ3+FcG3Tfn/yGCX1Ny1kwq+RGRW0
         jSX2FDVC5uuzSkN20RozJiJMwCtPd3SqgiHEXBzY=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id F381E9402C1; Wed,  2 Jan 2019 10:34:52 +0100 (CET)
Date:   Wed, 2 Jan 2019 10:34:52 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Magnus <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/8] arm64: renesas: ulcb: use audio-graph-card
Message-ID: <20190102093452.7tbhy4flmpobxl4d@verge.net.au>
References: <87va3h9kzy.wl-kuninori.morimoto.gx@renesas.com>
 <87tvj19kyj.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87tvj19kyj.wl-kuninori.morimoto.gx@renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Dec 26, 2018 at 09:53:28AM +0900, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> ULCB can use daughter board which is called as KingFisher.
> It has extra sound interface, thus we want to use it.
> But, basically, ALSA SoC can't use Multiple sound card with single
> CPU sound interface (= SSI). Thus we need to use Single Sound Card
> with multiple DAI interface.
> 
> To be easy to expand ULCB sound card on KingFisher, it is better to
> use multi-dai-link style sound card on ULCB sound DT.
> 
> Now, "simple-audio-card" / "audio-graph-card" both can support
> multi-dai-link style, but HDMI sound support (which is not yet supported
> on ULCB) needs "audio-graph-card".
> Using audio-graph-card is better selection.
> This patch exchange current sound card to use it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Hi Morimoto-san,

I realise that I previously indicated that I was happy with this series,
but on closer inspection I have found a few minor problems.

1. The prefix of this and all other patches should be
   "arm64: dts: renesas: ". This I can fix when applying,
   but I also see:

2. When compiling with: make W=1 dtbs

  ...

  DTC     arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb-kf.dtb
arch/arm64/boot/dts/renesas/r8a7795-h3ulcb-kf.dtb: Warning (unit_address_vs_reg): /soc/sound@ec500000/ports/port@0: node has a unit name, but no reg property
arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb.dtb: Warning (unit_address_vs_reg): /soc/sound@ec500000/ports/port@0: node has a unit name, but no reg property
arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dtb: Warning (unit_address_vs_reg): /soc/sound@ec500000/ports/port@0: node has a unit name, but no reg property
arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb-kf.dtb: Warning (unit_address_vs_reg): /soc/sound@ec500000/ports/port@0: node has a unit name, but no reg property

  ...

  Could you please see if this can be resolved?

  Locally I tried s/port@0/port/ which seems to help.

> ---
>  arch/arm64/boot/dts/renesas/ulcb.dtsi | 39 ++++++++++++++++++++---------------
>  1 file changed, 22 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/renesas/ulcb.dtsi
> index f519d0c..209dda7 100644
> --- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
> +++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
> @@ -83,20 +83,11 @@
>  		regulator-always-on;
>  	};
>  
> -	rsnd_ak4613: sound {
> -		compatible = "simple-audio-card";
> +	sound_card: sound {
> +		compatible = "audio-graph-card";
> +		label = "rcar-sound";
>  
> -		simple-audio-card,format = "left_j";
> -		simple-audio-card,bitclock-master = <&sndcpu>;
> -		simple-audio-card,frame-master = <&sndcpu>;
> -
> -		sndcpu: simple-audio-card,cpu {
> -			sound-dai = <&rcar_sound>;
> -		};
> -
> -		sndcodec: simple-audio-card,codec {
> -			sound-dai = <&ak4613>;
> -		};
> +		dais = <&rsnd_port0>;
>  	};
>  
>  	vcc_sdhi0: regulator-vcc-sdhi0 {
> @@ -211,6 +202,12 @@
>  		asahi-kasei,out4-single-end;
>  		asahi-kasei,out5-single-end;
>  		asahi-kasei,out6-single-end;
> +
> +		port {
> +			ak4613_endpoint: endpoint {
> +				remote-endpoint = <&rsnd_for_ak4613>;
> +			};
> +		};
>  	};
>  
>  	cs2000: clk-multiplier@4f {
> @@ -384,10 +381,18 @@
>  		 <&audio_clk_c>,
>  		 <&cpg CPG_CORE CPG_AUDIO_CLK_I>;
>  
> -	rcar_sound,dai {
> -		dai0 {
> -			playback = <&ssi0 &src0 &dvc0>;
> -			capture  = <&ssi1 &src1 &dvc1>;
> +	ports {
> +		rsnd_port0: port {
> +			rsnd_for_ak4613: endpoint {
> +				remote-endpoint = <&ak4613_endpoint>;
> +
> +				dai-format = "left_j";
> +				bitclock-master = <&rsnd_for_ak4613>;
> +				frame-master = <&rsnd_for_ak4613>;
> +
> +				playback = <&ssi0 &src0 &dvc0>;
> +				capture  = <&ssi1 &src1 &dvc1>;
> +			};
>  		};
>  	};
>  };
> -- 
> 2.7.4
> 
