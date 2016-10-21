Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:55450 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752203AbcJUKn3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Oct 2016 06:43:29 -0400
Subject: Re: [PATCH 2/8] drm: bridge: vga-dac: Add adi,adv7123 compatible
 string
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <1476887143-24831-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1476887143-24831-3-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <2e22947f-1c8c-710a-cb60-bd6b52f219eb@codeaurora.org>
 <295438587.dQSmbaFSXR@avalon>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org
From: Archit Taneja <architt@codeaurora.org>
Message-ID: <99996136-cb5b-d39a-2dc1-9ee06762cae3@codeaurora.org>
Date: Fri, 21 Oct 2016 16:13:23 +0530
MIME-Version: 1.0
In-Reply-To: <295438587.dQSmbaFSXR@avalon>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>



On 10/21/2016 03:52 PM, Laurent Pinchart wrote:
> Hi Archit,
>
> On Friday 21 Oct 2016 10:43:34 Archit Taneja wrote:
>> On 10/19/2016 07:55 PM, Laurent Pinchart wrote:
>>> The ADV7123 is a transparent VGA DAC. Unlike dumb VGA DACs it can be
>>> controlled through a power save pin, and requires a power supply.
>>> However, on most boards where the device is used neither the power save
>>> signal nor the power supply are controllable.
>>>
>>> To avoid developing a separate device-specific driver add an
>>> "adi,adv7123" compatible entry to the dumb-vga-dac driver. This will
>>> allow supporting most ADV7123-based boards easily, while allowing future
>>> development of an adv7123 driver when needed without breaking backward
>>> compatibility.
>>
>> Shouldn't we have a DT binding doc for ADV7123, even if it's sharing
>> the dumb vga driver for now?
>
> Documentation/devicetree/bindings/display/bridge/adi,adv7123.txt
>
>> Same query for the Thine LVDS encoder.
>
> Documentation/devicetree/bindings/display/bridge/thine,thc63lvdm83d.txt

Cool, didn't know these already existed :)

Thanks,
Archit

>
>>> Cc: devicetree@vger.kernel.org
>>> Signed-off-by: Laurent Pinchart
>>> <laurent.pinchart+renesas@ideasonboard.com>
>>> ---
>>>
>>>  drivers/gpu/drm/bridge/dumb-vga-dac.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/gpu/drm/bridge/dumb-vga-dac.c
>>> b/drivers/gpu/drm/bridge/dumb-vga-dac.c index afec232185a7..b33e3f829e4f
>>> 100644
>>> --- a/drivers/gpu/drm/bridge/dumb-vga-dac.c
>>> +++ b/drivers/gpu/drm/bridge/dumb-vga-dac.c
>>> @@ -204,6 +204,7 @@ static int dumb_vga_remove(struct platform_device
>>> *pdev)>
>>>  static const struct of_device_id dumb_vga_match[] = {
>>>
>>>  	{ .compatible = "dumb-vga-dac" },
>>> +	{ .compatible = "adi,adv7123" },
>>>  	{},
>>>  };
>>>  MODULE_DEVICE_TABLE(of, dumb_vga_match);
>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
