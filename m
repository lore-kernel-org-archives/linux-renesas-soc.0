Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:47856 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750922AbcK3N2u (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Nov 2016 08:28:50 -0500
Subject: Re: [PATCH v3 03/13] drm: bridge: Link encoder and bridge in core
 code
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <1480410283-28698-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <7224643.24NSiAqgQC@avalon>
 <3e8816d8-d461-d010-bff8-a38011e24a96@codeaurora.org>
 <2651171.INF8CSizt8@avalon>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Boris Brezillon <boris.brezillon@free-electrons.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Stefan Agner <stefan@agner.ch>,
        Alison Wang <alison.wang@freescale.com>,
        Xinliang Liu <z.liuxinliang@hisilicon.com>,
        Rongrong Zou <zourongrong@gmail.com>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Chen Feng <puck.chen@hisilicon.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        CK Hu <ck.hu@mediatek.com>, Rob Clark <robdclark@gmail.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Vincent Abriou <vincent.abriou@st.com>,
        Maxime Ripard <maxime.ripard@free-electrons.com>
From: Archit Taneja <architt@codeaurora.org>
Message-ID: <265154a1-2f23-2544-4203-db97a909bb7b@codeaurora.org>
Date: Wed, 30 Nov 2016 18:57:30 +0530
MIME-Version: 1.0
In-Reply-To: <2651171.INF8CSizt8@avalon>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>



On 11/30/2016 4:35 PM, Laurent Pinchart wrote:
> Hi Archit,
>
> On Wednesday 30 Nov 2016 16:30:53 Archit Taneja wrote:
>> On 11/30/2016 03:53 PM, Laurent Pinchart wrote:
>>> On Wednesday 30 Nov 2016 10:35:02 Archit Taneja wrote:
>>>> On 11/29/2016 11:27 PM, Laurent Pinchart wrote:
>>>>> On Tuesday 29 Nov 2016 15:57:06 Archit Taneja wrote:
>>>>>> On 11/29/2016 02:34 PM, Laurent Pinchart wrote:
>>>>>>> Instead of linking encoders and bridges in every driver (and getting
>>>>>>> it wrong half of the time, as many drivers forget to set the
>>>>>>> drm_bridge encoder pointer), do so in core code. The
>>>>>>> drm_bridge_attach() function needs the encoder and optional previous
>>>>>>> bridge to perform that task, update all the callers.
>>>>>>>
>>>>>>> Signed-off-by: Laurent Pinchart
>>>>>>> <laurent.pinchart+renesas@ideasonboard.com>
>>>>>>> ---
>
> [snip]
>
>>>>>> I think we could derive previous from the encoder itself. Something
>>>>>> like:
>>>>>>
>>>>>> 	previous = encoder->bridge;
>>>>>> 	while (previous && previous->next)
>>>>>> 		previous = previous->next;
>>>>>
>>>>> That's a very good point. It would however prevent us from catching
>>>>> drivers that attach bridges in the wrong order, which the !previous->dev
>>>>> currently allows us to do (and it should be turned into a WARN_ON as
>>>>> Daniel proposed).
>>>>
>>>> With the simpler API, I don't think we will ever hit the case of
>>>> !previous->dev. The previous bridge (if it exists) in the chain would
>>>> already have a dev attached to it. In other words, we would remove the
>>>> risk of the chance of the 'previous' bridge being unattached.
>>>>
>>>> I'm a bit unclear about what you mean about the order part. If a kms
>>>> driver
>>>> wants to create a chain: encoder->bridge1->bridge2, it should ideally do:
>>>>
>>>> drm_bridge_attach(encoder, bridge1, NULL);
>>>> drm_bridge_attach(encoder, bridge2, bridge1);
>>>
>>> Correct.
>>>
>>>> We can't do much if the kms driver does the opposite:
>>>>
>>>> drm_bridge_attach(encoder, bridge2, NULL);
>>>> drm_bridge_attach(encoder, bridge2, bridge1);
>>>
>>> That would certainly be a very stupid thing for a driver to do :-) The
>>> problem that we could catch with my current proposal is
>>>
>>> drm_bridge_attach(encoder, bridge2, bridge1);
>>> ...
>>> drm_bridge_attach(encoder, bridge1, NULL);
>>>
>>> which I expect to happen from time to time as the two bridge can be
>>> attached through separate code paths sometimes a bit difficult to trace.
>>> It's not a big deal though, you could convince me that the advantages of
>>> a simpler API exceed its drawbacks.
>>
>> Having no 'previous' argument would prevent the possibility of this
>> altogether, won't it?
>>
>> With no 'previous' arg in the API, the driver can only do:
>>
>> drm_bridge_attach(encoder, bridge1);
>> drm_bridge_attach(encoder, bridge2);
>>
>> or
>>
>> drm_bridge_attach(encoder, bridge2);
>> drm_bridge_attach(encoder, bridge1);
>
> Correct.
>
>> For the latter, we can't do much as discussed above.
>
> Except that with the currently proposed API the code would be
>
> drm_bridge_attach(encoder, bridge2, bridge1);
> drm_bridge_attach(encoder, bridge1, NULL);
>
> (correct case)
>
> or
>
> drm_bridge_attach(encoder, bridge2, bridge1);
> drm_bridge_attach(encoder, bridge1, NULL);
>
> (incorrect case)
>
> The second one could be caught by the drm_bridge_attach() function as bridge1-
>> dev will be NULL when attaching bridge2 in the incorrect case.

Okay, I got it now.

As you said, it does make sense for cases like analogix_dp, where one
attach is in the bridge driver, and the other is in the kms driver.
It makes things more legible too. Passing 'previous' as NULL makes it
clear in the code that we're attaching first bridge in the chain.
Let's stick to your proposal.

One additional thing we could do is to compare the 'previous' arg
passed by the API with the last bridge in the chain, and return
an error if they aren't the same, just as an additional safety
measure.

Archit

>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
