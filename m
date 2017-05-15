Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f180.google.com ([209.85.216.180]:36601 "EHLO
        mail-qt0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759073AbdEOKDR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 May 2017 06:03:17 -0400
Received: by mail-qt0-f180.google.com with SMTP id f55so38489172qta.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 May 2017 03:03:17 -0700 (PDT)
Date: Mon, 15 May 2017 12:03:15 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        Simon <horms@verge.net.au>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: rsnd: tidyup Sampling rate convert example on
 Document
Message-ID: <20170515100315.GL31437@bigcity.dyn.berto.se>
References: <87y3tyh7cj.wl%kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87y3tyh7cj.wl%kuninori.morimoto.gx@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san,

On 2017-05-15 08:11:21 +0000, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> "renesas,rsrc-card" is exchanged to "simple-scu-audio-card".
> Let's update Document
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
> v1 -> v2
> 
>  - simple-scu-card -> simple-scu-audio-card on git log

Reviewed-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

> 
>  .../devicetree/bindings/sound/renesas,rsnd.txt     | 30 +++++++++++-----------
>  1 file changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.txt b/Documentation/devicetree/bindings/sound/renesas,rsnd.txt
> index 15a7316..3332910 100644
> --- a/Documentation/devicetree/bindings/sound/renesas,rsnd.txt
> +++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.txt
> @@ -83,11 +83,11 @@ SRC can convert [xx]Hz to [yy]Hz. Then, it has below 2 modes
>  **     Asynchronous mode
>  ------------------
>  
> -You need to use "renesas,rsrc-card" sound card for it.
> +You need to use "simple-scu-audio-card" sound card for it.
>  example)
>  
>  	sound {
> -		compatible = "renesas,rsrc-card";
> +		compatible = "simple-scu-audio-card";
>  		...
>  		/*
>  		 * SRC Asynchronous mode setting
> @@ -97,12 +97,12 @@ example)
>  		 * Inputed 48kHz data will be converted to
>  		 * system specified Hz
>  		 */
> -		convert-rate = <48000>;
> +		simple-audio-card,convert-rate = <48000>;
>  		...
> -		cpu {
> +		simple-audio-card,cpu {
>  			sound-dai = <&rcar_sound>;
>  		};
> -		codec {
> +		simple-audio-card,codec {
>  			...
>  		};
>  	};
> @@ -141,23 +141,23 @@ For more detail information, see below
>  	${LINUX}/sound/soc/sh/rcar/ctu.c
>  	 - comment of header
>  
> -You need to use "renesas,rsrc-card" sound card for it.
> +You need to use "simple-scu-audio-card" sound card for it.
>  example)
>  
>  	sound {
> -		compatible = "renesas,rsrc-card";
> +		compatible = "simple-scu-audio-card";
>  		...
>  		/*
>  		 * CTU setting
>  		 * All input data will be converted to 2ch
>  		 * as output data
>  		 */
> -		convert-channels = <2>;
> +		simple-audio-card,convert-channels = <2>;
>  		...
> -		cpu {
> +		simple-audio-card,cpu {
>  			sound-dai = <&rcar_sound>;
>  		};
> -		codec {
> +		simple-audio-card,codec {
>  			...
>  		};
>  	};
> @@ -190,22 +190,22 @@ and these sounds will be merged by MIX.
>  	aplay -D plughw:0,0 xxxx.wav &
>  	aplay -D plughw:0,1 yyyy.wav
>  
> -You need to use "renesas,rsrc-card" sound card for it.
> +You need to use "simple-scu-audio-card" sound card for it.
>  Ex)
>  	[MEM] -> [SRC1] -> [CTU02] -+-> [MIX0] -> [DVC0] -> [SSI0]
>  	                            |
>  	[MEM] -> [SRC2] -> [CTU03] -+
>  
>  	sound {
> -		compatible = "renesas,rsrc-card";
> +		compatible = "simple-scu-audio-card";
>  		...
> -		cpu@0 {
> +		simple-audio-card,cpu@0 {
>  			sound-dai = <&rcar_sound 0>;
>  		};
> -		cpu@1 {
> +		simple-audio-card,cpu@1 {
>  			sound-dai = <&rcar_sound 1>;
>  		};
> -		codec {
> +		simple-audio-card,codec {
>  			...
>  		};
>  	};
> -- 
> 1.9.1
> 

-- 
Regards,
Niklas S�derlund
