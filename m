Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52864 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751599AbcKORzw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Nov 2016 12:55:52 -0500
Date: Tue, 15 Nov 2016 18:55:47 +0100
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 09/11] ARM: shmobile: document SK-RZG1M board
Message-ID: <20161115175546.GE3979@verge.net.au>
References: <4121805.SRTmqJtRfv@wasted.cogentembedded.com>
 <3956722.6l6VXXKMOL@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3956722.6l6VXXKMOL@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sat, Oct 29, 2016 at 01:23:59AM +0300, Sergei Shtylyov wrote:
> Document the SK-RZG1E device tree bindings, listing it as a supported board.
> 
> This allows to use checkpatch.pl to validate .dts files referring to the
> SK-RZG1E board.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

I have queued this up after with s/SK-RZG1M/SK-RZG1E/

> ---
>  Documentation/devicetree/bindings/arm/shmobile.txt |    2 ++
>  1 file changed, 2 insertions(+)
> 
> Index: renesas/Documentation/devicetree/bindings/arm/shmobile.txt
> ===================================================================
> --- renesas.orig/Documentation/devicetree/bindings/arm/shmobile.txt
> +++ renesas/Documentation/devicetree/bindings/arm/shmobile.txt
> @@ -77,6 +77,8 @@ Boards:
>      compatible = "renesas,salvator-x", "renesas,r8a7796";
>    - SILK (RTP0RC7794LCB00011S)
>      compatible = "renesas,silk", "renesas,r8a7794"
> +  - SK-RZG1E (YR8A77450S000BE)
> +    compatible = "renesas,sk-rzg1e", "renesas,r8a7745"
>    - SK-RZG1M (YR8A77430S000BE)
>      compatible = "renesas,sk-rzg1m", "renesas,r8a7743"
>    - Wheat
> 
