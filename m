Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from fllnx209.ext.ti.com ([198.47.19.16]:62042 "EHLO
        fllnx209.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750855AbdAPJNT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Jan 2017 04:13:19 -0500
Subject: Re: [PATCH] drivers: phy: constify phy_ops structures
To: Bhumika Goyal <bhumirks@gmail.com>, <julia.lawall@lip6.fr>,
        <rjui@broadcom.com>, <sbranden@broadcom.com>,
        <jonmason@broadcom.com>, <bcm-kernel-feedback-list@broadcom.com>,
        <chunfeng.yun@mediatek.com>, <yoshihiro.shimoda.uh@renesas.com>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-renesas-soc@vger.kernel.org>
References: <1483871756-19008-1-git-send-email-bhumirks@gmail.com>
From: Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <587C8E36.6050703@ti.com>
Date: Mon, 16 Jan 2017 14:41:18 +0530
MIME-Version: 1.0
In-Reply-To: <1483871756-19008-1-git-send-email-bhumirks@gmail.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>



On Sunday 08 January 2017 04:05 PM, Bhumika Goyal wrote:
> Declare phy_ops structures as const as they are only passed as an
> argument to the function devm_phy_create. This argument is of type const
> struct phy_ops *, so phy_ops structures having this property can be
> declared as const.
> Done using Coccinelle:

removed the rest of commit message and merged.

Thanks
Kishon

> 
> @r1 disable optional_qualifier @
> identifier i;
> position p;
> @@
> static struct phy_ops i@p = {...};
> 
> @ok1@
> identifier r1.i;
> position p;
> @@
> devm_phy_create(...,&i@p)
> 
> @bad@
> position p!={r1.p,ok1.p};
> identifier r1.i;
> @@
> i@p
> 
> @depends on !bad disable optional_qualifier@
> identifier r1.i;
> @@
> +const
> struct phy_ops i;
> 
> File size details:
> 
>    text	   data	    bss	    dec	    hex	filename
>    1504	    264	      0	   1768	    6e8	phy/phy-bcm-cygnus-pcie.o
>    1576	    192	      0	   1768	    6e8	phy/phy-bcm-cygnus-pcie.o
> 
>    1083	    264	      0	   1347	    543	phy/phy-hi6220-usb.o
>    1155	    192	      0	   1347	    543	phy/phy-hi6220-usb.o
> 
>    2767	    264	      0	   3031	    bd7	phy/phy-mt65xx-usb3.o
>    2829	    192	      0	   3021	    bcd	phy/phy-mt65xx-usb3.o
> 
>    2710	    304	      0	   3014	    bc6	phy/phy-rcar-gen3-usb2.o
>    2766	    240	      0	   3006	    bbe	phy/phy-rcar-gen3-usb2.o
> 
> Signed-off-by: Bhumika Goyal <bhumirks@gmail.com>
> ---
>  drivers/phy/phy-bcm-cygnus-pcie.c | 2 +-
>  drivers/phy/phy-hi6220-usb.c      | 2 +-
>  drivers/phy/phy-mt65xx-usb3.c     | 2 +-
>  drivers/phy/phy-rcar-gen3-usb2.c  | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/phy/phy-bcm-cygnus-pcie.c b/drivers/phy/phy-bcm-cygnus-pcie.c
> index 082c03f..0f4ac5d 100644
> --- a/drivers/phy/phy-bcm-cygnus-pcie.c
> +++ b/drivers/phy/phy-bcm-cygnus-pcie.c
> @@ -114,7 +114,7 @@ static int cygnus_pcie_phy_power_off(struct phy *p)
>  	return cygnus_pcie_power_config(phy, false);
>  }
>  
> -static struct phy_ops cygnus_pcie_phy_ops = {
> +static const struct phy_ops cygnus_pcie_phy_ops = {
>  	.power_on = cygnus_pcie_phy_power_on,
>  	.power_off = cygnus_pcie_phy_power_off,
>  	.owner = THIS_MODULE,
> diff --git a/drivers/phy/phy-hi6220-usb.c b/drivers/phy/phy-hi6220-usb.c
> index b2141cb..398c102 100644
> --- a/drivers/phy/phy-hi6220-usb.c
> +++ b/drivers/phy/phy-hi6220-usb.c
> @@ -112,7 +112,7 @@ static int hi6220_phy_exit(struct phy *phy)
>  	return hi6220_phy_setup(priv, false);
>  }
>  
> -static struct phy_ops hi6220_phy_ops = {
> +static const struct phy_ops hi6220_phy_ops = {
>  	.init		= hi6220_phy_start,
>  	.exit		= hi6220_phy_exit,
>  	.owner		= THIS_MODULE,
> diff --git a/drivers/phy/phy-mt65xx-usb3.c b/drivers/phy/phy-mt65xx-usb3.c
> index 4d85e73..d972067 100644
> --- a/drivers/phy/phy-mt65xx-usb3.c
> +++ b/drivers/phy/phy-mt65xx-usb3.c
> @@ -506,7 +506,7 @@ static struct phy *mt65xx_phy_xlate(struct device *dev,
>  	return instance->phy;
>  }
>  
> -static struct phy_ops mt65xx_u3phy_ops = {
> +static const struct phy_ops mt65xx_u3phy_ops = {
>  	.init		= mt65xx_phy_init,
>  	.exit		= mt65xx_phy_exit,
>  	.power_on	= mt65xx_phy_power_on,
> diff --git a/drivers/phy/phy-rcar-gen3-usb2.c b/drivers/phy/phy-rcar-gen3-usb2.c
> index c63da1b..17be045 100644
> --- a/drivers/phy/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/phy-rcar-gen3-usb2.c
> @@ -350,7 +350,7 @@ static int rcar_gen3_phy_usb2_power_off(struct phy *p)
>  	return ret;
>  }
>  
> -static struct phy_ops rcar_gen3_phy_usb2_ops = {
> +static const struct phy_ops rcar_gen3_phy_usb2_ops = {
>  	.init		= rcar_gen3_phy_usb2_init,
>  	.exit		= rcar_gen3_phy_usb2_exit,
>  	.power_on	= rcar_gen3_phy_usb2_power_on,
> 
