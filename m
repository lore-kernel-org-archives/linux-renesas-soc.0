Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33482 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751521AbdIUI6Y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Sep 2017 04:58:24 -0400
Date: Thu, 21 Sep 2017 10:58:03 +0200
From: Simon Horman <horms@verge.net.au>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 4/4] arm64: dts: renesas: r8a77995: draak: enable USB2.0
 Host (EHCI/OHCI)
Message-ID: <20170921085803.GQ15749@verge.net.au>
References: <1505385043-1554-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1505385043-1554-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1505385043-1554-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

[CC Geert]

On Thu, Sep 14, 2017 at 07:30:43PM +0900, Yoshihiro Shimoda wrote:
> This patch enables USB2.0 Host (EHCI/OHCI) for r8a77995.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Hi Geert,

thanks for reviewing patches 1-3 of this series.
I think you missed this one.

> ---
>  arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> index 1c55d8a..7771af8 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> @@ -73,6 +73,14 @@
>  	};
>  };
>  
> +&ehci0 {
> +	status = "okay";
> +};
> +
> +&ohci0 {
> +	status = "okay";
> +};
> +
>  &scif2 {
>  	pinctrl-0 = <&scif2_pins>;
>  	pinctrl-names = "default";
> -- 
> 1.9.1
> 
