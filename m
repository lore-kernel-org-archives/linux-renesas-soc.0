Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f67.google.com ([209.85.218.67]:35311 "EHLO
        mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754098AbcIBPT4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Sep 2016 11:19:56 -0400
Date: Fri, 2 Sep 2016 10:19:55 -0500
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: renesas: r8a7796/salvator-x: Add board part
 number to DT bindings
Message-ID: <20160902151955.GA27150@rob-hp-laptop>
References: <1472635054-24372-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1472635054-24372-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Aug 31, 2016 at 11:17:34AM +0200, Geert Uytterhoeven wrote:
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/arm/shmobile.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
> index 90cf237ee5581978..42a046a97acba00f 100644
> --- a/Documentation/devicetree/bindings/arm/shmobile.txt
> +++ b/Documentation/devicetree/bindings/arm/shmobile.txt
> @@ -65,7 +65,7 @@ Boards:
>      compatible = "renesas,porter", "renesas,r8a7791"
>    - Salvator-X (RTP0RC7795SIPB0010S)
>      compatible = "renesas,salvator-x", "renesas,r8a7795";
> -  - Salvator-X
> +  - Salvator-X (RTP0RC7796SIPB0011S)
>      compatible = "renesas,salvator-x", "renesas,r8a7796";

Seems like these should be different compatibles rather than the 
combination here defining exactly which board. 

>    - SILK (RTP0RC7794LCB00011S)
>      compatible = "renesas,silk", "renesas,r8a7794"
> -- 
> 1.9.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
