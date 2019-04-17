Return-Path: <SRS0=NjMp=ST=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28B72C10F12
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 17 Apr 2019 06:37:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DEA4120835
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 17 Apr 2019 06:37:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="U5Gsup+4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725767AbfDQGhB (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 17 Apr 2019 02:37:01 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:44708 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729782AbfDQGhB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Apr 2019 02:37:01 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3H6akxd127992;
        Wed, 17 Apr 2019 01:36:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1555483006;
        bh=tjGnXmiTxnSDuV72STszyM7Q/5OCjyBXNNEyyAvcSf4=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=U5Gsup+42TkdPq9nXWQ/ZNS9fkPk/M48Hux1a6MgtEsw4J69hL3GCI51aiASNd68r
         w03AOc5c9idYU5h0HXkm35WEihtps5dgsxrvEDHdcRgyiVFmj14aY5C6kemHa5AGPP
         6rjuRHXgTW5KqBXwYwQEpxfUJhYWE0inEPvfUJIQ=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3H6akXr004613
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 17 Apr 2019 01:36:46 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 17
 Apr 2019 01:36:45 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 17 Apr 2019 01:36:45 -0500
Received: from [172.24.190.233] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3H6aeHQ033904;
        Wed, 17 Apr 2019 01:36:41 -0500
Subject: Re: [PATCH 2/4] phy: renesas: rcar-gen3-usb2: No need to request IRQ
 for non-OTG
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
References: <1551438348-22119-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1551438348-22119-3-git-send-email-fabrizio.castro@bp.renesas.com>
 <54573748-18bd-1ece-f6e1-bd7801503715@ti.com>
 <TYAPR01MB4271A67EA5A43F11656DD34AD8560@TYAPR01MB4271.jpnprd01.prod.outlook.com>
 <TY1PR01MB17703687A7ECF803B338834EC0570@TY1PR01MB1770.jpnprd01.prod.outlook.com>
From:   Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <cae6c938-6949-2d4f-2dda-65de85d460e6@ti.com>
Date:   Wed, 17 Apr 2019 12:05:33 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <TY1PR01MB17703687A7ECF803B338834EC0570@TY1PR01MB1770.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On 03/04/19 3:54 PM, Fabrizio Castro wrote:
> Hello Yoshihiro-san, Kishon
> 
>> From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>> Sent: 02 April 2019 03:11
>> Subject: RE: [PATCH 2/4] phy: renesas: rcar-gen3-usb2: No need to request IRQ for non-OTG
>>
>> Hi Kishon, Fabrizio,
>>
>>> From: Kishon Vijay Abraham I, Sent: Monday, April 1, 2019 9:26 PM
>>>
>>> On 01/03/19 4:35 PM, Fabrizio Castro wrote:
>>>> As stated in the comment found on top of rcar_gen3_phy_usb2_work,
>>>> we should not be registering the IRQ if !otg_channel || !uses_otg_pins.
>>>> On top of that, we should also make sure that extcon has been
>>>> allocated before requesting the irq as rcar_gen3_phy_usb2_work
>>>> uses it, hence the patch.
>>>>
>>>> Fixes: 2b38543c8db1 ("phy: rcar-gen3-usb2: add extcon support")
>>>> Fixes: 73801b90a38f ("phy: renesas: rcar-gen3-usb2: change a condition "dr_mode"")
>>>> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
>>>
>>> merged, thanks.
>>
>> I'm very sorry, I didn't notice this patch...
>> I'd like to fix this patch because this patch breaks for R-Car D3.
>> In this case, should I submit an incremental patch?
> 
> Kishon, is it too late to drop the patch?

I have to send a new pul request. I'll drop this patch then. Thanks for letting
me know.

-Kishon

> 
>>
>>> -Kishon
>>>> ---
>>>>  drivers/phy/renesas/phy-rcar-gen3-usb2.c | 26 +++++++++++++-------------
>>>>  1 file changed, 13 insertions(+), 13 deletions(-)
>>>>
>>>> diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
>>>> index 0a34782..be1a392 100644
>>>> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
>>>> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
>>>> @@ -447,20 +447,8 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
>>>>  	if (IS_ERR(channel->base))
>>>>  		return PTR_ERR(channel->base);
>>>>
>>>> -	/* call request_irq for OTG */
>>>> -	irq = platform_get_irq(pdev, 0);
>>>> -	if (irq >= 0) {
>>>> -		INIT_WORK(&channel->work, rcar_gen3_phy_usb2_work);
>>>> -		irq = devm_request_irq(dev, irq, rcar_gen3_phy_usb2_irq,
>>>> -				       IRQF_SHARED, dev_name(dev), channel);
>>>> -		if (irq < 0)
>>>> -			dev_err(dev, "No irq handler (%d)\n", irq);
>>>> -	}
>>>> -
>>>>  	channel->dr_mode = of_usb_get_dr_mode_by_phy(dev->of_node, 0);
>>>> -	if (channel->dr_mode != USB_DR_MODE_UNKNOWN) {
>>>> -		int ret;
>>>> -
>>>> +	if (channel->dr_mode == USB_DR_MODE_OTG) {
>>
>> R-Car D3 (r8a77995-draak.dts) has dr_mode with "host". So, the board can use host mode
>> as default and "role" mode to switch the role for peripheral later. However, after we
>> applied this patch, the R-Car D3 USB2.0 cannot switch to the peripheral mode.
> 
> I understand, I am sorry for breaking it.
> The probing function still needs some fixing, devm_request_irq uses rcar_gen3_phy_usb2_irq,
> rcar_gen3_phy_usb2_irq  calls rcar_gen3_device_recognition, rcar_gen3_device_recognition may
> call either rcar_gen3_init_for_host or rcar_gen3_init_for_peri, both rcar_gen3_init_for_host and
> rcar_gen3_init_for_peri schedule work for the work queue that calls into rcar_gen3_phy_usb2_work,
> rcar_gen3_phy_usb2_work uses extcon, extcon gets initialized after devm_request_irq, which
> means we should move devm_request_irq after extcon gets initialized,.
> Also, we may register the irq, and never deal with extcon if dr_mode == USB_DR_MODE_UNKNOWN.
> 
> Would you like to come up with a patch to address those points?
> 
> Thanks,
> Fab
> 
>>
>> Best regards,
>> Yoshihiro Shimoda
>>
>>>>  		channel->is_otg_channel = true;
>>>>  		channel->uses_otg_pins = !of_property_read_bool(dev->of_node,
>>>>  							"renesas,no-otg-pins");
>>>> @@ -476,6 +464,18 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
>>>>  		}
>>>>  	}
>>>>
>>>> +	if (channel->is_otg_channel && channel->uses_otg_pins) {
>>>> +		/* call request_irq for OTG */
>>>> +		irq = platform_get_irq(pdev, 0);
>>>> +		if (irq >= 0) {
>>>> +			INIT_WORK(&channel->work, rcar_gen3_phy_usb2_work);
>>>> +			irq = devm_request_irq(dev, irq, rcar_gen3_phy_usb2_irq,
>>>> +					       IRQF_SHARED, dev_name(dev), channel);
>>>> +			if (irq < 0)
>>>> +				dev_err(dev, "No irq handler (%d)\n", irq);
>>>> +		}
>>>> +	}
>>>> +
>>>>  	/*
>>>>  	 * devm_phy_create() will call pm_runtime_enable(&phy->dev);
>>>>  	 * And then, phy-core will manage runtime pm for this device.
>>>>
