Return-Path: <SRS0=/dFS=SL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C707C10F0E
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  9 Apr 2019 10:29:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 464D920830
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  9 Apr 2019 10:29:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Lc808bGm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726129AbfDIK3w (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 9 Apr 2019 06:29:52 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:38446 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726371AbfDIK3w (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Apr 2019 06:29:52 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x39ATToL035083;
        Tue, 9 Apr 2019 05:29:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1554805769;
        bh=1xCdShSc5srg+8ItH1gfVErGjS2E/KF/eNB/UaLtPF8=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Lc808bGmC+kqcIGBVnA+fbLsjyFQM9HvzaFDakdMK/vU3UoO3a1wnT++FRTEh/2sU
         /ahXhD3DMBI/U7GwgAEIyVPPxKPi3bWG2Ie6mDw4KUTlRrTbvqr5IIIIsGCe/Xpkua
         jKNFvde52+1HRmHjEFttUZvDXYPuqgNpV6IlxUzA=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x39ATTCi111508
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 9 Apr 2019 05:29:29 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 9 Apr
 2019 05:29:29 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 9 Apr 2019 05:29:29 -0500
Received: from [172.24.190.233] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x39ATOTM128397;
        Tue, 9 Apr 2019 05:29:25 -0500
Subject: Re: [PATCH V3 04/13] phy: rcar-gen3-usb2: Add support for r8a77470
To:     Biju Das <biju.das@bp.renesas.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
CC:     Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        <linux-renesas-soc@vger.kernel.org>
References: <1554287324-22312-1-git-send-email-biju.das@bp.renesas.com>
 <1554287324-22312-5-git-send-email-biju.das@bp.renesas.com>
From:   Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <acaa3754-0fb0-c50b-4fc3-3f15a0612d4e@ti.com>
Date:   Tue, 9 Apr 2019 15:58:23 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1554287324-22312-5-git-send-email-biju.das@bp.renesas.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On 03/04/19 3:58 PM, Biju Das wrote:
> This patch adds support for r8a77470 (RZ/G1C). We can reuse this driver for
> initializing timing/interrupt generation registers.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
> V1-->V2
>  * Incorporated shimoda-san's review comment
>  Ref: https://patchwork.kernel.org/patch/10655855/
> ---
>  drivers/phy/renesas/Kconfig              |  2 +-
>  drivers/phy/renesas/phy-rcar-gen3-usb2.c | 19 ++++++++++++++++++-
>  2 files changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/renesas/Kconfig b/drivers/phy/renesas/Kconfig
> index e340a92..961ccb1 100644
> --- a/drivers/phy/renesas/Kconfig
> +++ b/drivers/phy/renesas/Kconfig
> @@ -19,7 +19,7 @@ config PHY_RCAR_GEN3_PCIE
>  config PHY_RCAR_GEN3_USB2
>  	tristate "Renesas R-Car generation 3 USB 2.0 PHY driver"
>  	depends on ARCH_RENESAS
> -	depends on EXTCON
> +	depends on EXTCON || ARCH_R8A77470
>  	depends on USB_SUPPORT
>  	select GENERIC_PHY
>  	select USB_COMMON
> diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> index 0a34782..ac33a02 100644
> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> @@ -22,6 +22,7 @@
>  #include <linux/regulator/consumer.h>
>  #include <linux/usb/of.h>
>  #include <linux/workqueue.h>
> +#include <linux/sys_soc.h>
>  
>  /******* USB2.0 Host registers (original offset is +0x200) *******/
>  #define USB2_INT_ENABLE		0x000
> @@ -393,6 +394,12 @@ static const struct phy_ops rcar_gen3_phy_usb2_ops = {
>  	.owner		= THIS_MODULE,
>  };
>  
> +static const struct phy_ops rz_g1c_phy_usb2_ops = {
> +	.init		= rcar_gen3_phy_usb2_init,
> +	.exit		= rcar_gen3_phy_usb2_exit,
> +	.owner		= THIS_MODULE,
> +};
> +
>  static irqreturn_t rcar_gen3_phy_usb2_irq(int irq, void *_ch)
>  {
>  	struct rcar_gen3_chan *ch = _ch;
> @@ -411,6 +418,7 @@ static irqreturn_t rcar_gen3_phy_usb2_irq(int irq, void *_ch)
>  }
>  
>  static const struct of_device_id rcar_gen3_phy_usb2_match_table[] = {
> +	{ .compatible = "renesas,usb2-phy-r8a77470" },
>  	{ .compatible = "renesas,usb2-phy-r8a7795" },
>  	{ .compatible = "renesas,usb2-phy-r8a7796" },
>  	{ .compatible = "renesas,usb2-phy-r8a77965" },
> @@ -425,12 +433,18 @@ static const unsigned int rcar_gen3_phy_cable[] = {
>  	EXTCON_NONE,
>  };
>  
> +static struct soc_device_attribute soc_r8a77470[] = {
> +	{ .soc_id = "r8a77470" },
> +	{ /* sentinel */ }
> +};
> +
>  static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct rcar_gen3_chan *channel;
>  	struct phy_provider *provider;
>  	struct resource *res;
> +	const struct phy_ops *phy_usb2_ops = &rcar_gen3_phy_usb2_ops;
>  	int irq, ret = 0;
>  
>  	if (!dev->of_node) {
> @@ -481,7 +495,10 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
>  	 * And then, phy-core will manage runtime pm for this device.
>  	 */
>  	pm_runtime_enable(dev);
> -	channel->phy = devm_phy_create(dev, NULL, &rcar_gen3_phy_usb2_ops);
> +	if (soc_device_match(soc_r8a77470))
> +		phy_usb2_ops = &rz_g1c_phy_usb2_ops;

Why not have the phy_ops in driver_data since you anyways have a new compatible
for r8a77470?

Thanks
Kishon
