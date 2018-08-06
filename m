Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:33556 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726969AbeHFMuL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Aug 2018 08:50:11 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Eugeniu Rosca <roscaeugeniu@gmail.com>
Cc: Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Niklas Soderlund <niklas.soderlund+renesas@ragnatech.se>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Magnus Damm <damm+renesas@opensource.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <rosca.eugeniu@gmail.com>
Subject: Re: [PATCH 04/14] arm64: dts: renesas: r8a7795-es1: ulcb-kf: Use "renesas,ulcb" compatible
Date: Mon, 06 Aug 2018 13:42:25 +0300
Message-ID: <1889610.CmbOguoUMH@avalon>
In-Reply-To: <20180804231114.21420-5-erosca@de.adit-jv.com>
References: <20180804231114.21420-1-erosca@de.adit-jv.com> <20180804231114.21420-5-erosca@de.adit-jv.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Eugeniu,

Thank you for the patch.

On Sunday, 5 August 2018 02:11:04 EEST Eugeniu Rosca wrote:
> Following the recent change in dt-bindings [1], switch from
> "renesas,h3ulcb" to "renesas,ulcb" compatible string.
> 
> [1] Documentation/devicetree/bindings/arm/shmobile.txt
> 
> Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a7795-es1-ulcb-kf.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a7795-es1-ulcb-kf.dts
> b/arch/arm64/boot/dts/renesas/r8a7795-es1-ulcb-kf.dts index
> 06deb67c36c8..7a5b1dc64090 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7795-es1-ulcb-kf.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a7795-es1-ulcb-kf.dts
> @@ -14,6 +14,6 @@
> 
>  / {
>  	model = "Renesas H3ULCB Kingfisher board based on r8a7795 ES1.x";
> -	compatible = "shimafuji,kingfisher", "renesas,h3ulcb",
> +	compatible = "shimafuji,kingfisher", "renesas,ulcb",
>  		     "renesas,r8a7795";

This is unrelated to your patch, but due to the reason explained in my review 
of 02/14, I think "shimafuji,kingfisher" should include the SoC name.

This brings up the topic of how to describe boards that are made of an SoC 
"module" board plugged into an expansion "motherboard".

>  };

-- 
Regards,

Laurent Pinchart
