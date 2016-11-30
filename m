Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:59864 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754813AbcK3LOZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Nov 2016 06:14:25 -0500
Subject: Re: [PATCH v3 03/13] drm: bridge: Link encoder and bridge in core
 code
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <1480410283-28698-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <3126195.dNH0p7KEJE@avalon>
 <6fc7176b-1a45-7679-a0ed-84aadab6d136@codeaurora.org>
 <7224643.24NSiAqgQC@avalon>
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
Message-ID: <3e8816d8-d461-d010-bff8-a38011e24a96@codeaurora.org>
Date: Wed, 30 Nov 2016 16:30:53 +0530
MIME-Version: 1.0
In-Reply-To: <7224643.24NSiAqgQC@avalon>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>



On 11/30/2016 03:53 PM, Laurent Pinchart wrote:
> Hi Archit,
>
> On Wednesday 30 Nov 2016 10:35:02 Archit Taneja wrote:
>> On 11/29/2016 11:27 PM, Laurent Pinchart wrote:
>>> On Tuesday 29 Nov 2016 15:57:06 Archit Taneja wrote:
>>>> On 11/29/2016 02:34 PM, Laurent Pinchart wrote:
>>>>> Instead of linking encoders and bridges in every driver (and getting it
>>>>> wrong half of the time, as many drivers forget to set the drm_bridge
>>>>> encoder pointer), do so in core code. The drm_bridge_attach() function
>>>>> needs the encoder and optional previous bridge to perform that task,
>>>>> update all the callers.
>>>>>
>>>>> Signed-off-by: Laurent Pinchart
>>>>> <laurent.pinchart+renesas@ideasonboard.com>
>>>>> ---
>>>>>
>>>>>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c   |  4 +-
>>>>>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |  4 +-
>>>>>  drivers/gpu/drm/bridge/dw-hdmi.c                   |  3 +-
>>>>>  drivers/gpu/drm/drm_bridge.c                       | 46 ++++++++++-----
>>>>>  drivers/gpu/drm/drm_simple_kms_helper.c            |  4 +-
>>>>>  drivers/gpu/drm/exynos/exynos_dp.c                 |  5 +--
>>>>>  drivers/gpu/drm/exynos/exynos_drm_dsi.c            |  6 +--
>>>>>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c          |  5 +--
>>>>>  drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c       |  5 +--
>>>>>  drivers/gpu/drm/imx/imx-ldb.c                      |  6 +--
>>>>>  drivers/gpu/drm/imx/parallel-display.c             |  4 +-
>>>>>  drivers/gpu/drm/mediatek/mtk_dpi.c                 |  8 ++--
>>>>>  drivers/gpu/drm/mediatek/mtk_dsi.c                 | 24 ++---------
>>>>>  drivers/gpu/drm/mediatek/mtk_hdmi.c                | 11 +++---
>>>>>  drivers/gpu/drm/msm/dsi/dsi_manager.c              | 17 +++++---
>>>>>  drivers/gpu/drm/msm/edp/edp_bridge.c               |  2 +-
>>>>>  drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             |  2 +-
>>>>>  drivers/gpu/drm/rcar-du/rcar_du_hdmienc.c          |  5 +--
>>>>>  drivers/gpu/drm/sti/sti_dvo.c                      |  3 +-
>>>>>  drivers/gpu/drm/sti/sti_hda.c                      |  3 +-
>>>>>  drivers/gpu/drm/sti/sti_hdmi.c                     |  3 +-
>>>>>  drivers/gpu/drm/sun4i/sun4i_rgb.c                  | 13 +++---
>>>>>  include/drm/drm_bridge.h                           |  3 +-
>>>>>  23 files changed, 83 insertions(+), 103 deletions(-)
>>>
>>> [snip]
>>>
>>>>> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
>>>>> index 0ee052b7c21a..850bd6509ef1 100644
>>>>> --- a/drivers/gpu/drm/drm_bridge.c
>>>>> +++ b/drivers/gpu/drm/drm_bridge.c
>>>
>>> [snip]
>>>
>>>>> @@ -92,32 +93,53 @@ void drm_bridge_remove(struct drm_bridge *bridge)
>>>>>  EXPORT_SYMBOL(drm_bridge_remove);
>>>>>
>>>>>  /**
>>>>> - * drm_bridge_attach - associate given bridge to our DRM device
>>>>> + * drm_bridge_attach - attach the bridge to an encoder's chain
>>>>>   *
>>>>> - * @dev: DRM device
>>>>> - * @bridge: bridge control structure
>>>>> + * @encoder: DRM encoder
>>>>> + * @bridge: bridge to attach
>>>>> + * @previous: previous bridge in the chain (optional)
>>>>>   *
>>>>> - * Called by a kms driver to link one of our encoder/bridge to the
>>>>> given
>>>>> - * bridge.
>>>>> + * Called by a kms driver to link the bridge to an encoder's chain. The
>>>>> previous
>>>>> + * argument specifies the previous bridge in the chain. If NULL, the
>>>>> bridge is
>>>>> + * linked directly at the encoder's output. Otherwise it is linked at
>>>>> the
>>>>> + * previous bridge's output.
>>>>>   *
>>>>> - * Note that setting up links between the bridge and our encoder/bridge
>>>>> - * objects needs to be handled by the kms driver itself.
>>>>> + * If non-NULL the previous bridge must be already attached by a call
>>>>> to this
>>>>> + * function.
>>>>>   *
>>>>>   * RETURNS:
>>>>>   * Zero on success, error code on failure
>>>>>   */
>>>>> -int drm_bridge_attach(struct drm_device *dev, struct drm_bridge
>>>>> *bridge)
>>>>> +int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge
>>>>> *bridge,
>>>>> +		      struct drm_bridge *previous)
>>>>>  {
>>>>> -	if (!dev || !bridge)
>>>>> +	int ret;
>>>>> +
>>>>> +	if (!encoder || !bridge)
>>>>> +		return -EINVAL;
>>>>
>>>> I think we could derive previous from the encoder itself. Something like:
>>>> 	previous = encoder->bridge;
>>>> 	while (previous && previous->next)
>>>> 	
>>>> 		previous = previous->next;
>>>
>>> That's a very good point. It would however prevent us from catching
>>> drivers that attach bridges in the wrong order, which the !previous->dev
>>> currently allows us to do (and it should be turned into a WARN_ON as
>>> Daniel proposed).
>>
>> With the simpler API, I don't think we will ever hit the case of
>> !previous->dev. The previous bridge (if it exists) in the chain would
>> already have a dev attached to it. In other words, we would remove the
>> risk of the chance of the 'previous' bridge being unattached.
>>
>> I'm a bit unclear about what you mean about the order part. If a kms driver
>> wants to create a chain: encoder->bridge1->bridge2, it should ideally do:
>>
>> drm_bridge_attach(encoder, bridge1, NULL);
>> drm_bridge_attach(encoder, bridge2, bridge1);
>
> Correct.
>
>> We can't do much if the kms driver does the opposite:
>>
>> drm_bridge_attach(encoder, bridge2, NULL);
>> drm_bridge_attach(encoder, bridge2, bridge1);
>
> That would certainly be a very stupid thing for a driver to do :-) The problem
> that we could catch with my current proposal is
>
> drm_bridge_attach(encoder, bridge2, bridge1);
> ...
> drm_bridge_attach(encoder, bridge1, NULL);
>
> which I expect to happen from time to time as the two bridge can be attached
> through separate code paths sometimes a bit difficult to trace. It's not a big
> deal though, you could convince me that the advantages of a simpler API exceed
> its drawbacks.

Having no 'previous' argument would prevent the possibility of this altogether,
won't it?

With no 'previous' arg in the API, the driver can only do:

drm_bridge_attach(encoder, bridge1);
drm_bridge_attach(encoder, bridge2);

or

drm_bridge_attach(encoder, bridge2);
drm_bridge_attach(encoder, bridge1);

For the latter, we can't do much as discussed above.

Archit

>
>>> I'm fine losing that ability, as your proposal makes the API simpler. I'll
>>> let you decide, which option do you prefer ?
>>
>> I prefer the simpler API. I guess the main aim of the patch was to prevent
>> the driver setting up the encoder<->bridge links, which will be done
>> anyway.
>
> If you still prefer the simpler API after reading the above, I'll update my
> patch.
>
>>>>> +
>>>>> +	if (previous && (!previous->dev || previous->encoder != encoder))
>>>>>  		return -EINVAL;
>>>>>  	
>>>>>  	if (bridge->dev)
>>>>>  		return -EBUSY;
>>>>>
>>>>> -	bridge->dev = dev;
>>>>> +	bridge->dev = encoder->dev;
>>>>> +	bridge->encoder = encoder;
>>>>> +
>>>>> +	if (bridge->funcs->attach) {
>>>>> +		ret = bridge->funcs->attach(bridge);
>>>>> +		if (ret < 0) {
>>>>> +			bridge->dev = NULL;
>>>>> +			bridge->encoder = NULL;
>>>>> +			return ret;
>>>>> +		}
>>>>> +	}
>>>>>
>>>>> -	if (bridge->funcs->attach)
>>>>> -		return bridge->funcs->attach(bridge);
>>>>> +	if (previous)
>>>>> +		previous->next = bridge;
>>>>> +	else
>>>>> +		encoder->bridge = bridge;
>>>>>
>>>>>  	return 0;
>>>>>  }
>>>>
>>>> <snip>
>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
