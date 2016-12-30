Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:36696 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751119AbcL3Gpd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Dec 2016 01:45:33 -0500
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-transfer-encoding: 8BIT
Message-id: <58660289.6080906@samsung.com>
Date: Fri, 30 Dec 2016 15:45:29 +0900
From: Chanwoo Choi <cw00.choi@samsung.com>
To: Felipe Balbi <balbi@kernel.org>, gregkh@linuxfoundation.org,
        kishon@ti.com, sre@kernel.org
Cc: Peter.Chen@nxp.com, wens@csie.org,
        yoshihiro.shimoda.uh@renesas.com, maxime.ripard@free-electrons.com,
        b-liu@ti.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, chanwoo@kernel.org
Subject: Re: [PATCH 06/12] usb: dwc3: omap: Replace the extcon API
In-reply-to: <5865CA76.1020001@samsung.com>
References: <1480485460-2663-1-git-send-email-cw00.choi@samsung.com>
 <1480485460-2663-7-git-send-email-cw00.choi@samsung.com>
 <CGME20161130103827epcas4p268ee1cbc6b7b2ace7c987dd7baba82d4@epcas4p2.samsung.com>
 <877f7lntjq.fsf@linux.intel.com> <58412848.5070209@samsung.com>
 <87fum6vh1p.fsf@linux.intel.com> <5865CA76.1020001@samsung.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Felipe,

On 2016년 12월 30일 11:46, Chanwoo Choi wrote:
> Hi Felipe,
> 
> On 2016년 12월 02일 18:03, Felipe Balbi wrote:
>>
>> Hi,
>>
>> Chanwoo Choi <cw00.choi@samsung.com> writes:
>>> Hi Felipe,
>>>
>>> On 2016년 11월 30일 19:36, Felipe Balbi wrote:
>>>>
>>>> Hi,
>>>>
>>>> Chanwoo Choi <cw00.choi@samsung.com> writes:
>>>>> This patch uses the resource-managed extcon API for extcon_register_notifier()
>>>>> and replaces the deprecated extcon API as following:
>>>>> - extcon_get_cable_state_() -> extcon_get_state()
>>>>>
>>>>> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
>>>>
>>>> Acked-by: Felipe Balbi <felipe.balbi@linux.intel.com>
>>>>
>>>
>>> Thanks for your review.
>>>
>>> Each patch has no any dependency among patches.
>>> So, If possible, could you pick the patch6/8/9/10/11/12 on your tree?
>>
>> my tree is closed for v4.10, I can pick it up for v4.11
> 
> Could you please pick up these patches(patch6/8/9/10/11/12)?
> These patches were already reviewed by you.
> 

I sent v2 patchset.
[1] https://www.spinics.net/lists/kernel/msg2410950.html
- "[PATCH v2 0/6] usb: Replace the deprecated extcon API"

-- 
Regards,
Chanwoo Choi
