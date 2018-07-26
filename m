Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33195 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730184AbeGZObS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jul 2018 10:31:18 -0400
Date: Thu, 26 Jul 2018 15:14:25 +0200
From: Simon Horman <horms@verge.net.au>
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc: Mark Brown <broonie@kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] ASoC: rsnd: Document R-Car M3-N support
Message-ID: <20180726131424.4k76bfw5pnkmpvqz@verge.net.au>
References: <1532551215-14868-1-git-send-email-ykaneko0929@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1532551215-14868-1-git-send-email-ykaneko0929@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jul 26, 2018 at 05:40:15AM +0900, Yoshihiro Kaneko wrote:
> From: Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
> 
> Document support for the sound modules in the Renesas M3-N (r8a77965)
> SoC.
> 
> No driver update is needed.
> 
> Signed-off-by: Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
> 
> This patch is based on the devel branch of Simon Horman's renesas tree.
> 
>  Documentation/devicetree/bindings/sound/renesas,rsnd.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.txt b/Documentation/devicetree/bindings/sound/renesas,rsnd.txt
> index b86d790..9e764270 100644
> --- a/Documentation/devicetree/bindings/sound/renesas,rsnd.txt
> +++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.txt
> @@ -352,6 +352,7 @@ Required properties:
>  				    - "renesas,rcar_sound-r8a7794" (R-Car E2)
>  				    - "renesas,rcar_sound-r8a7795" (R-Car H3)
>  				    - "renesas,rcar_sound-r8a7796" (R-Car M3-W)
> +				    - "renesas,rcar_sound-r8a77965" (R-Car M3-N)
>  - reg				: Should contain the register physical address.
>  				  required register is
>  				   SRU/ADG/SSI      if generation1
> -- 
> 1.9.1
> 
