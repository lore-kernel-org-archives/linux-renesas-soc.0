Return-Path: <SRS0=/dFS=SL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40CDBC10F0E
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  9 Apr 2019 11:29:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 062FB20857
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  9 Apr 2019 11:29:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="xWKU/pR8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726352AbfDIL3a (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 9 Apr 2019 07:29:30 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:53450 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726129AbfDIL3a (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Apr 2019 07:29:30 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x39BT9Ux072868;
        Tue, 9 Apr 2019 06:29:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1554809349;
        bh=wwyQnJqHI3UvveGVSz/iWUANsBd15YL/VX7mszwYtf8=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=xWKU/pR8soSkRe3pcrlCKMX8/Yj9/JXLhc6X+CKsDM9udzBV45Y4zISD9OW/wKzed
         42oe4VdotJiC0hnAMqP01jOOTv3TowzjHgxRR+1DxV+2ouX31VAfAW5HWX1MFDEOMY
         ydk/NvK6ph80KhfuvNePFjHsXgPVtVqFS2fxz/J4=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x39BT90c023686
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 9 Apr 2019 06:29:09 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 9 Apr
 2019 06:29:08 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 9 Apr 2019 06:29:08 -0500
Received: from [172.24.190.233] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x39BT3wd103635;
        Tue, 9 Apr 2019 06:29:04 -0500
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
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
References: <1554287324-22312-1-git-send-email-biju.das@bp.renesas.com>
 <1554287324-22312-5-git-send-email-biju.das@bp.renesas.com>
 <acaa3754-0fb0-c50b-4fc3-3f15a0612d4e@ti.com>
 <TYAPR01MB2111193B54726C0ACDDFAB7FB82D0@TYAPR01MB2111.jpnprd01.prod.outlook.com>
From:   Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <f335f523-78fa-7611-7adc-01670eba9dbb@ti.com>
Date:   Tue, 9 Apr 2019 16:58:02 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <TYAPR01MB2111193B54726C0ACDDFAB7FB82D0@TYAPR01MB2111.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On 09/04/19 4:50 PM, Biju Das wrote:
> Hi Kishon,
> 
> Thanks for the feedback.
> 
>> Subject: Re: [PATCH V3 04/13] phy: rcar-gen3-usb2: Add support for r8a77470
>>
>> Hi Biju,
>>
>> On 03/04/19 3:58 PM, Biju Das wrote:
>>> This patch adds support for r8a77470 (RZ/G1C). We can reuse this
>>> driver for initializing timing/interrupt generation registers.
>>>
>>> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
>>> ---
>>> V1-->V2
>>>  * Incorporated shimoda-san's review comment
>>>  Ref: https://patchwork.kernel.org/patch/10655855/
>>> ---
>>>  drivers/phy/renesas/Kconfig              |  2 +-
>>>  drivers/phy/renesas/phy-rcar-gen3-usb2.c | 19 ++++++++++++++++++-
>>>  2 files changed, 19 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/phy/renesas/Kconfig b/drivers/phy/renesas/Kconfig
>>> index e340a92..961ccb1 100644
>>> --- a/drivers/phy/renesas/Kconfig
>>> +++ b/drivers/phy/renesas/Kconfig
>>> @@ -19,7 +19,7 @@ config PHY_RCAR_GEN3_PCIE  config
>> PHY_RCAR_GEN3_USB2
>>>  	tristate "Renesas R-Car generation 3 USB 2.0 PHY driver"
>>>  	depends on ARCH_RENESAS
>>> -	depends on EXTCON
>>> +	depends on EXTCON || ARCH_R8A77470
>>>  	depends on USB_SUPPORT
>>>  	select GENERIC_PHY
>>>  	select USB_COMMON
>>> diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
>>> b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
>>> index 0a34782..ac33a02 100644
>>> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
>>> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
>>> @@ -22,6 +22,7 @@
>>>  #include <linux/regulator/consumer.h>  #include <linux/usb/of.h>
>>> #include <linux/workqueue.h>
>>> +#include <linux/sys_soc.h>
>>>
>>>  /******* USB2.0 Host registers (original offset is +0x200) *******/
>>>  #define USB2_INT_ENABLE		0x000
>>> @@ -393,6 +394,12 @@ static const struct phy_ops
>> rcar_gen3_phy_usb2_ops = {
>>>  	.owner		= THIS_MODULE,
>>>  };
>>>
>>> +static const struct phy_ops rz_g1c_phy_usb2_ops = {
>>> +	.init		= rcar_gen3_phy_usb2_init,
>>> +	.exit		= rcar_gen3_phy_usb2_exit,
>>> +	.owner		= THIS_MODULE,
>>> +};
>>> +
>>>  static irqreturn_t rcar_gen3_phy_usb2_irq(int irq, void *_ch)  {
>>>  	struct rcar_gen3_chan *ch = _ch;
>>> @@ -411,6 +418,7 @@ static irqreturn_t rcar_gen3_phy_usb2_irq(int irq,
>>> void *_ch)  }
>>>
>>>  static const struct of_device_id rcar_gen3_phy_usb2_match_table[] = {
>>> +	{ .compatible = "renesas,usb2-phy-r8a77470" },
>>>  	{ .compatible = "renesas,usb2-phy-r8a7795" },
>>>  	{ .compatible = "renesas,usb2-phy-r8a7796" },
>>>  	{ .compatible = "renesas,usb2-phy-r8a77965" }, @@ -425,12 +433,18
>> @@
>>> static const unsigned int rcar_gen3_phy_cable[] = {
>>>  	EXTCON_NONE,
>>>  };
>>>
>>> +static struct soc_device_attribute soc_r8a77470[] = {
>>> +	{ .soc_id = "r8a77470" },
>>> +	{ /* sentinel */ }
>>> +};
>>> +
>>>  static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)  {
>>>  	struct device *dev = &pdev->dev;
>>>  	struct rcar_gen3_chan *channel;
>>>  	struct phy_provider *provider;
>>>  	struct resource *res;
>>> +	const struct phy_ops *phy_usb2_ops = &rcar_gen3_phy_usb2_ops;
>>>  	int irq, ret = 0;
>>>
>>>  	if (!dev->of_node) {
>>> @@ -481,7 +495,10 @@ static int rcar_gen3_phy_usb2_probe(struct
>> platform_device *pdev)
>>>  	 * And then, phy-core will manage runtime pm for this device.
>>>  	 */
>>>  	pm_runtime_enable(dev);
>>> -	channel->phy = devm_phy_create(dev, NULL,
>> &rcar_gen3_phy_usb2_ops);
>>> +	if (soc_device_match(soc_r8a77470))
>>> +		phy_usb2_ops = &rz_g1c_phy_usb2_ops;
>>
>> Why not have the phy_ops in driver_data since you anyways have a new
>> compatible for r8a77470?
> 
> SoC device match will take care of SoC revision. We have multiple revision of SoC variants like ES1.0, ES1.1
> There is another  SoC similar to RZ/G1C known as R-Car E2X.   If you add it in compatible, it takes care only about the SoC , not the SoC revisions.

We should add that when there's really a configuration change between ES1.0 and
ES1.1. Even the phy_ops can be the same with power_on/power_off return for
r8a77470 unless you have planned to add something later.

Thanks
Kishon
