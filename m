Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33614 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754591AbdHVIHj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Aug 2017 04:07:39 -0400
Date: Tue, 22 Aug 2017 10:07:35 +0200
From: Simon Horman <horms@verge.net.au>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH ] ARM: dts: iwg20d-q7: Add chosen node
Message-ID: <20170822080735.GH30838@verge.net.au>
References: <1503075488-44304-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1503075488-44304-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Aug 18, 2017 at 05:58:08PM +0100, Biju Das wrote:
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
> This patch tested against renesas-dev tag renesas-devel-20170815-v4.13-rc5

Thanks, I have applied this for v4.15.

There was some fuzz when applying this patch.
Please check that it is correct when I have pushed today's devel tag to
the renesas tree.

> 
>  arch/arm/boot/dts/r8a7743-iwg20d-q7.dts | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/r8a7743-iwg20d-q7.dts b/arch/arm/boot/dts/r8a7743-iwg20d-q7.dts
> index 081af01..305a6a1 100644
> --- a/arch/arm/boot/dts/r8a7743-iwg20d-q7.dts
> +++ b/arch/arm/boot/dts/r8a7743-iwg20d-q7.dts
> @@ -19,6 +19,11 @@
>  		serial0 = &scif0;
>  		ethernet0 = &avb;
>  	};
> +
> +	chosen {
> +		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
> +		stdout-path = "serial0:115200n8";
> +	};
>  };
>  
>  &pfc {
> -- 
> 1.9.1
> 
