Return-Path: <SRS0=l30p=SD=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5C31C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  1 Apr 2019 12:27:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 812CF206DD
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  1 Apr 2019 12:27:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="pEm3AsrO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726284AbfDAM1n (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 1 Apr 2019 08:27:43 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:35638 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726083AbfDAM1m (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Apr 2019 08:27:42 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x31CRNEp096844;
        Mon, 1 Apr 2019 07:27:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1554121643;
        bh=Db6Jres54DlwBqNXUa5V+THABSWQXbvXgaL86zYw2SU=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=pEm3AsrOSpxn9kd9Z4gLHh6kW7uOvbRu01VtDsa/cLun/a0+tp7d7OZSu7/BsUAlZ
         Y3JvKDbu6WYat8FslTDhuMdw7KlvpKxyBuJrLLs5N3W2DnFDWCSA3MzBvgiCE2nzSi
         I7PiQ63OfNoVPonBTMP9pW/sNYqBp/46ijqhQ5Zo=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x31CRNRl120070
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 1 Apr 2019 07:27:23 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 1 Apr
 2019 07:27:22 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 1 Apr 2019 07:27:22 -0500
Received: from [172.24.190.233] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x31CRKR8078287;
        Mon, 1 Apr 2019 07:27:21 -0500
Subject: Re: [PATCH 2/4] phy: renesas: rcar-gen3-usb2: No need to request IRQ
 for non-OTG
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
CC:     <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
References: <1551438348-22119-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1551438348-22119-3-git-send-email-fabrizio.castro@bp.renesas.com>
From:   Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <54573748-18bd-1ece-f6e1-bd7801503715@ti.com>
Date:   Mon, 1 Apr 2019 17:56:25 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1551438348-22119-3-git-send-email-fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org



On 01/03/19 4:35 PM, Fabrizio Castro wrote:
> As stated in the comment found on top of rcar_gen3_phy_usb2_work,
> we should not be registering the IRQ if !otg_channel || !uses_otg_pins.
> On top of that, we should also make sure that extcon has been
> allocated before requesting the irq as rcar_gen3_phy_usb2_work
> uses it, hence the patch.
> 
> Fixes: 2b38543c8db1 ("phy: rcar-gen3-usb2: add extcon support")
> Fixes: 73801b90a38f ("phy: renesas: rcar-gen3-usb2: change a condition "dr_mode"")
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

merged, thanks.

-Kishon
> ---
>  drivers/phy/renesas/phy-rcar-gen3-usb2.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> index 0a34782..be1a392 100644
> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> @@ -447,20 +447,8 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
>  	if (IS_ERR(channel->base))
>  		return PTR_ERR(channel->base);
>  
> -	/* call request_irq for OTG */
> -	irq = platform_get_irq(pdev, 0);
> -	if (irq >= 0) {
> -		INIT_WORK(&channel->work, rcar_gen3_phy_usb2_work);
> -		irq = devm_request_irq(dev, irq, rcar_gen3_phy_usb2_irq,
> -				       IRQF_SHARED, dev_name(dev), channel);
> -		if (irq < 0)
> -			dev_err(dev, "No irq handler (%d)\n", irq);
> -	}
> -
>  	channel->dr_mode = of_usb_get_dr_mode_by_phy(dev->of_node, 0);
> -	if (channel->dr_mode != USB_DR_MODE_UNKNOWN) {
> -		int ret;
> -
> +	if (channel->dr_mode == USB_DR_MODE_OTG) {
>  		channel->is_otg_channel = true;
>  		channel->uses_otg_pins = !of_property_read_bool(dev->of_node,
>  							"renesas,no-otg-pins");
> @@ -476,6 +464,18 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> +	if (channel->is_otg_channel && channel->uses_otg_pins) {
> +		/* call request_irq for OTG */
> +		irq = platform_get_irq(pdev, 0);
> +		if (irq >= 0) {
> +			INIT_WORK(&channel->work, rcar_gen3_phy_usb2_work);
> +			irq = devm_request_irq(dev, irq, rcar_gen3_phy_usb2_irq,
> +					       IRQF_SHARED, dev_name(dev), channel);
> +			if (irq < 0)
> +				dev_err(dev, "No irq handler (%d)\n", irq);
> +		}
> +	}
> +
>  	/*
>  	 * devm_phy_create() will call pm_runtime_enable(&phy->dev);
>  	 * And then, phy-core will manage runtime pm for this device.
> 
