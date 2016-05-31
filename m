Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:50523 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750884AbcEaXvX (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 31 May 2016 19:51:23 -0400
Date: Wed, 1 Jun 2016 08:51:20 +0900
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org,
	pawel.moll@arm.com, mark.rutland@arm.com,
	ijc+devicetree@hellion.org.uk, galak@codeaurora.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 11/13] DT: arm: shmobile: document Blanche board
Message-ID: <20160531235119.GA20527@verge.net.au>
References: <13205049.n7pM8utpHF@wasted.cogentembedded.com>
 <52321184.HGKDRaDOBe@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52321184.HGKDRaDOBe@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jun 01, 2016 at 01:30:39AM +0300, Sergei Shtylyov wrote:
> Document the Blanche device tree bindings, listing it as a supported board.
> 
> This allows to use checkpatch.pl to validate .dts files referring to the
> Blanche board.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

I think the prefix for patch 11 should be: "ARM: dts: blanche: "
It also looks like it could be squashed into patch 12 but I don't
feel strongly about that.

> ---
>  Documentation/devicetree/bindings/arm/shmobile.txt |    2 ++
>  1 file changed, 2 insertions(+)
> 
> Index: renesas/Documentation/devicetree/bindings/arm/shmobile.txt
> ===================================================================
> --- renesas.orig/Documentation/devicetree/bindings/arm/shmobile.txt
> +++ renesas/Documentation/devicetree/bindings/arm/shmobile.txt
> @@ -39,6 +39,8 @@ Boards:
>      compatible = "renesas,ape6evm", "renesas,r8a73a4"
>    - Atmark Techno Armadillo-800 EVA
>      compatible = "renesas,armadillo800eva"
> +  - Blanche (RTP0RC7792SEB00010S)
> +    compatible = "renesas,blanche", "renesas,r8a7792"
>    - BOCK-W
>      compatible = "renesas,bockw", "renesas,r8a7778"
>    - Genmai (RTK772100BC00000BR)
> 
