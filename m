Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:60946 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387839AbeKPAlz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Nov 2018 19:41:55 -0500
Date: Thu, 15 Nov 2018 06:33:48 -0800
From: Simon Horman <horms@verge.net.au>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: defconfig: Enable CONFIG_PHY_RCAR_GEN3_PCIE
Message-ID: <20181115143347.f4wtdipdhhyooatu@verge.net.au>
References: <20181113152201.24476-1-geert+renesas@glider.be>
 <cb6b55cc-c91b-b3e2-bc04-d7dfb80cfa98@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cb6b55cc-c91b-b3e2-bc04-d7dfb80cfa98@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Nov 14, 2018 at 04:32:05PM +0100, Marek Vasut wrote:
> On 11/13/2018 04:22 PM, Geert Uytterhoeven wrote:
> > Enable R-Car Gen3 PCIe PHY support, which is needed for PCIe to function
> > on the Renesas Condor board.
> > 
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> This helps
> 
> Reviewed-by: Marek Vasut <marek.vasut@gmail.com>

Thanks, would it be better to use enable this driver as a module rather
than a built-in?

> 
> > ---
> >  arch/arm64/configs/defconfig | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > index 9d0b42d96f03156e..77f98a7e860b8850 100644
> > --- a/arch/arm64/configs/defconfig
> > +++ b/arch/arm64/configs/defconfig
> > @@ -657,6 +657,7 @@ CONFIG_PHY_HISI_INNO_USB2=y
> >  CONFIG_PHY_MVEBU_CP110_COMPHY=y
> >  CONFIG_PHY_QCOM_QMP=m
> >  CONFIG_PHY_QCOM_USB_HS=y
> > +CONFIG_PHY_RCAR_GEN3_PCIE=y
> >  CONFIG_PHY_RCAR_GEN3_USB2=y
> >  CONFIG_PHY_RCAR_GEN3_USB3=m
> >  CONFIG_PHY_ROCKCHIP_EMMC=y
> > 
> 
> 
> -- 
> Best regards,
> Marek Vasut
> 
