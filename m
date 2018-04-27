Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:49460 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757807AbeD0KPV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Apr 2018 06:15:21 -0400
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [PATCH 05/17] drm: rcar-du: Split CRTC handling to support
 hardware indexing
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, David Airlie <airlied@linux.ie>,
        "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20180426165346.494-1-kieran.bingham+renesas@ideasonboard.com>
 <20180426165346.494-6-kieran.bingham+renesas@ideasonboard.com>
 <8207827.UIER1Ri0ED@avalon>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Message-ID: <807bf256-9a0a-4341-b827-5e748e8f6e3e@ideasonboard.com>
Date: Fri, 27 Apr 2018 11:15:16 +0100
MIME-Version: 1.0
In-Reply-To: <8207827.UIER1Ri0ED@avalon>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On 26/04/18 21:30, Laurent Pinchart wrote:
> Hi Kieran,
> 
> Thank you for the patch.
> 
> On Thursday, 26 April 2018 19:53:34 EEST Kieran Bingham wrote:
>> The DU CRTC driver does not support distinguishing between a hardware
>> index, and a software (CRTC) index in the event that a DU channel might
>> not be populated by the hardware.
>>
>> Support this by adapting the rcar_du_device_info structure to store a
>> bitmask of available channels rather than a count of CRTCs. The count
>> can then be obtained by determining the hamming weight of the bitmask.
>>
>> This allows the rcar_du_crtc_create() function to distinguish between
>> both index types, and non-populated DU channels will be skipped without
>> leaving a gap in the software CRTC indexes.
>>
>> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>> ---
>>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 26 ++++++++++++++------------
>>  drivers/gpu/drm/rcar-du/rcar_du_crtc.h |  3 ++-
>>  drivers/gpu/drm/rcar-du/rcar_du_drv.c  | 20 ++++++++++----------
>>  drivers/gpu/drm/rcar-du/rcar_du_drv.h  |  4 ++--
>>  drivers/gpu/drm/rcar-du/rcar_du_kms.c  | 17 ++++++++++++-----
>>  5 files changed, 40 insertions(+), 30 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
>> b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c index 5a15dfd66343..36ce194c13b5
>> 100644
>> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
>> @@ -902,7 +902,8 @@ static irqreturn_t rcar_du_crtc_irq(int irq, void *arg)
>>   * Initialization
>>   */
>>
>> -int rcar_du_crtc_create(struct rcar_du_group *rgrp, unsigned int index)
>> +int rcar_du_crtc_create(struct rcar_du_group *rgrp, unsigned int swindex,
>> +			unsigned int hwindex)
>>  {
>>  	static const unsigned int mmio_offsets[] = {
>>  		DU0_REG_OFFSET, DU1_REG_OFFSET, DU2_REG_OFFSET, DU3_REG_OFFSET
>> @@ -910,7 +911,7 @@ int rcar_du_crtc_create(struct rcar_du_group *rgrp,
>> unsigned int index)
>>
>>  	struct rcar_du_device *rcdu = rgrp->dev;
>>  	struct platform_device *pdev = to_platform_device(rcdu->dev);
>> -	struct rcar_du_crtc *rcrtc = &rcdu->crtcs[index];
>> +	struct rcar_du_crtc *rcrtc = &rcdu->crtcs[swindex];
>>  	struct drm_crtc *crtc = &rcrtc->crtc;
>>  	struct drm_plane *primary;
>>  	unsigned int irqflags;
>> @@ -922,7 +923,7 @@ int rcar_du_crtc_create(struct rcar_du_group *rgrp,
>> unsigned int index)
>>
>>  	/* Get the CRTC clock and the optional external clock. */
>>  	if (rcar_du_has(rcdu, RCAR_DU_FEATURE_CRTC_IRQ_CLOCK)) {
>> -		sprintf(clk_name, "du.%u", index);
>> +		sprintf(clk_name, "du.%u", hwindex);
>>  		name = clk_name;
>>  	} else {
>>  		name = NULL;
>> @@ -930,16 +931,16 @@ int rcar_du_crtc_create(struct rcar_du_group *rgrp,
>> unsigned int index)
>>
>>  	rcrtc->clock = devm_clk_get(rcdu->dev, name);
>>  	if (IS_ERR(rcrtc->clock)) {
>> -		dev_err(rcdu->dev, "no clock for CRTC %u\n", index);
>> +		dev_err(rcdu->dev, "no clock for CRTC %u\n", swindex);
> 
> How about
> 
> 		dev_err(rcdu->dev, "no clock for DU channel %u\n", hwindex);
> 
> I think that would be clearer, because at this stage we're dealing with 
> hardware resources, so matching the datasheet numbers seems better to me.

Yes, I agree.
Changed.


>>  		return PTR_ERR(rcrtc->clock);
>>  	}
>>
>> -	sprintf(clk_name, "dclkin.%u", index);
>> +	sprintf(clk_name, "dclkin.%u", hwindex);
>>  	clk = devm_clk_get(rcdu->dev, clk_name);
>>  	if (!IS_ERR(clk)) {
>>  		rcrtc->extclock = clk;
>>  	} else if (PTR_ERR(rcrtc->clock) == -EPROBE_DEFER) {
>> -		dev_info(rcdu->dev, "can't get external clock %u\n", index);
>> +		dev_info(rcdu->dev, "can't get external clock %u\n", hwindex);
>>  		return -EPROBE_DEFER;
>>  	}
>>
>> @@ -948,13 +949,13 @@ int rcar_du_crtc_create(struct rcar_du_group *rgrp,
>> unsigned int index) spin_lock_init(&rcrtc->vblank_lock);
>>
>>  	rcrtc->group = rgrp;
>> -	rcrtc->mmio_offset = mmio_offsets[index];
>> -	rcrtc->index = index;
>> +	rcrtc->mmio_offset = mmio_offsets[hwindex];
>> +	rcrtc->index = hwindex;
>>
>>  	if (rcar_du_has(rcdu, RCAR_DU_FEATURE_VSP1_SOURCE))
>>  		primary = &rcrtc->vsp->planes[rcrtc->vsp_pipe].plane;
>>  	else
>> -		primary = &rgrp->planes[index % 2].plane;
>> +		primary = &rgrp->planes[hwindex % 2].plane;
> 
> This shouldn't make a difference because when RCAR_DU_FEATURE_VSP1_SOURCE 
> isn't set we're running on Gen2, and don't need to deal with indices, but from 
> a conceptual point of view, wouldn't the software index be better here ? 
> Missing hardware channels won't be visible from userspace, so taking the first 
> plane of the group as the primary plane would seem better to me.

That's fine by me - updated.


> 
>>  	ret = drm_crtc_init_with_planes(rcdu->ddev, crtc, primary, NULL,
>>  					rcdu->info->gen <= 2 ?
>> @@ -970,7 +971,8 @@ int rcar_du_crtc_create(struct rcar_du_group *rgrp,
>> unsigned int index)
>>
>>  	/* Register the interrupt handler. */
>>  	if (rcar_du_has(rcdu, RCAR_DU_FEATURE_CRTC_IRQ_CLOCK)) {
>> -		irq = platform_get_irq(pdev, index);
>> +		/* The IRQ's are associated with the CRTC (sw)index */
> 
> s/index/index./
> 
>> +		irq = platform_get_irq(pdev, swindex);
>>  		irqflags = 0;
>>  	} else {
>>  		irq = platform_get_irq(pdev, 0);
>> @@ -978,7 +980,7 @@ int rcar_du_crtc_create(struct rcar_du_group *rgrp,
>> unsigned int index) }
>>
>>  	if (irq < 0) {
>> -		dev_err(rcdu->dev, "no IRQ for CRTC %u\n", index);
>> +		dev_err(rcdu->dev, "no IRQ for CRTC %u\n", swindex);
>>  		return irq;
>>  	}
>>
>> @@ -986,7 +988,7 @@ int rcar_du_crtc_create(struct rcar_du_group *rgrp,
>> unsigned int index) dev_name(rcdu->dev), rcrtc);
>>  	if (ret < 0) {
>>  		dev_err(rcdu->dev,
>> -			"failed to register IRQ for CRTC %u\n", index);
>> +			"failed to register IRQ for CRTC %u\n", swindex);
>>  		return ret;
>>  	}
>>
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
>> b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h index 518ee2c60eb8..5f003a16abc5
>> 100644
>> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
>> @@ -99,7 +99,8 @@ enum rcar_du_output {
>>  	RCAR_DU_OUTPUT_MAX,
>>  };
>>
>> -int rcar_du_crtc_create(struct rcar_du_group *rgrp, unsigned int index);
>> +int rcar_du_crtc_create(struct rcar_du_group *rgrp, unsigned int swindex,
>> +			unsigned int hwindex);
>>  void rcar_du_crtc_suspend(struct rcar_du_crtc *rcrtc);
>>  void rcar_du_crtc_resume(struct rcar_du_crtc *rcrtc);
>>
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
>> b/drivers/gpu/drm/rcar-du/rcar_du_drv.c index 05745e86d73e..d6ebc628fc22
>> 100644
>> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
>> @@ -40,7 +40,7 @@ static const struct rcar_du_device_info
>> rzg1_du_r8a7743_info = { .gen = 2,
>>  	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
>>  		  | RCAR_DU_FEATURE_EXT_CTRL_REGS,
>> -	.num_crtcs = 2,
>> +	.channel_mask = BIT(0) | BIT(1),
> 
> I'd write it BIT(1) | BIT(0) to match the usual little-endian order. Same 
> comment for the other info structure instances.
> 

Not a fan - but it's ok with me. :) Changed.

This is different to the usage on the .dpll_ch though ...

>>  	.routes = {
>>  		/*
>>  		 * R8A7743 has one RGB output and one LVDS output
>> @@ -61,7 +61,7 @@ static const struct rcar_du_device_info
>> rzg1_du_r8a7745_info = { .gen = 2,
>>  	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
>>  		  | RCAR_DU_FEATURE_EXT_CTRL_REGS,
>> -	.num_crtcs = 2,
>> +	.channel_mask = BIT(0) | BIT(1),
>>  	.routes = {
>>  		/*
>>  		 * R8A7745 has two RGB outputs
>> @@ -80,7 +80,7 @@ static const struct rcar_du_device_info
>> rzg1_du_r8a7745_info = { static const struct rcar_du_device_info
>> rcar_du_r8a7779_info = {
>>  	.gen = 2,
>>  	.features = 0,
>> -	.num_crtcs = 2,
>> +	.channel_mask = BIT(0) | BIT(1),
>>  	.routes = {
>>  		/*
>>  		 * R8A7779 has two RGB outputs and one (currently unsupported)
>> @@ -102,7 +102,7 @@ static const struct rcar_du_device_info
>> rcar_du_r8a7790_info = { .features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
>>  		  | RCAR_DU_FEATURE_EXT_CTRL_REGS,
>>  	.quirks = RCAR_DU_QUIRK_ALIGN_128B,
>> -	.num_crtcs = 3,
>> +	.channel_mask = BIT(0) | BIT(1) | BIT(2),
>>  	.routes = {
>>  		/*
>>  		 * R8A7790 has one RGB output, two LVDS outputs and one
>> @@ -129,7 +129,7 @@ static const struct rcar_du_device_info
>> rcar_du_r8a7791_info = { .gen = 2,
>>  	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
>>  		  | RCAR_DU_FEATURE_EXT_CTRL_REGS,
>> -	.num_crtcs = 2,
>> +	.channel_mask = BIT(0) | BIT(1),
>>  	.routes = {
>>  		/*
>>  		 * R8A779[13] has one RGB output, one LVDS output and one
>> @@ -151,7 +151,7 @@ static const struct rcar_du_device_info
>> rcar_du_r8a7792_info = { .gen = 2,
>>  	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
>>  		  | RCAR_DU_FEATURE_EXT_CTRL_REGS,
>> -	.num_crtcs = 2,
>> +	.channel_mask = BIT(0) | BIT(1),
>>  	.routes = {
>>  		/* R8A7792 has two RGB outputs. */
>>  		[RCAR_DU_OUTPUT_DPAD0] = {
>> @@ -169,7 +169,7 @@ static const struct rcar_du_device_info
>> rcar_du_r8a7794_info = { .gen = 2,
>>  	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
>>  		  | RCAR_DU_FEATURE_EXT_CTRL_REGS,
>> -	.num_crtcs = 2,
>> +	.channel_mask = BIT(0) | BIT(1),
>>  	.routes = {
>>  		/*
>>  		 * R8A7794 has two RGB outputs and one (currently unsupported)
>> @@ -191,7 +191,7 @@ static const struct rcar_du_device_info
>> rcar_du_r8a7795_info = { .features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
>>  		  | RCAR_DU_FEATURE_EXT_CTRL_REGS
>>  		  | RCAR_DU_FEATURE_VSP1_SOURCE,
>> -	.num_crtcs = 4,
>> +	.channel_mask = BIT(0) | BIT(1) | BIT(2) | BIT(3),
>>  	.routes = {
>>  		/*
>>  		 * R8A7795 has one RGB output, two HDMI outputs and one
>> @@ -223,7 +223,7 @@ static const struct rcar_du_device_info
>> rcar_du_r8a7796_info = { .features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
>>  		  | RCAR_DU_FEATURE_EXT_CTRL_REGS
>>  		  | RCAR_DU_FEATURE_VSP1_SOURCE,
>> -	.num_crtcs = 3,
>> +	.channel_mask = BIT(0) | BIT(1) | BIT(2),
>>  	.routes = {
>>  		/*
>>  		 * R8A7796 has one RGB output, one LVDS output and one HDMI
>> @@ -251,7 +251,7 @@ static const struct rcar_du_device_info
>> rcar_du_r8a77970_info = { .features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
>>  		  | RCAR_DU_FEATURE_EXT_CTRL_REGS
>>  		  | RCAR_DU_FEATURE_VSP1_SOURCE,
>> -	.num_crtcs = 1,
>> +	.channel_mask = BIT(0),
>>  	.routes = {
>>  		/* R8A77970 has one RGB output and one LVDS output. */
>>  		[RCAR_DU_OUTPUT_DPAD0] = {
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
>> b/drivers/gpu/drm/rcar-du/rcar_du_drv.h index 5c7ec15818c7..7a5de66deec2
>> 100644
>> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
>> @@ -52,7 +52,7 @@ struct rcar_du_output_routing {
>>   * @gen: device generation (2 or 3)
>>   * @features: device features (RCAR_DU_FEATURE_*)
>>   * @quirks: device quirks (RCAR_DU_QUIRK_*)
>> - * @num_crtcs: total number of CRTCs
>> + * @channel_mask: bit mask of supported DU channels
> 
> Nitpicking, how about channels_mask ?
> 
>>   * @routes: array of CRTC to output routes, indexed by output
>> (RCAR_DU_OUTPUT_*) * @num_lvds: number of internal LVDS encoders
>>   */
>> @@ -60,7 +60,7 @@ struct rcar_du_device_info {
>>  	unsigned int gen;
>>  	unsigned int features;
>>  	unsigned int quirks;
>> -	unsigned int num_crtcs;
>> +	unsigned int channel_mask;
>>  	struct rcar_du_output_routing routes[RCAR_DU_OUTPUT_MAX];
>>  	unsigned int num_lvds;
>>  	unsigned int dpll_ch;
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
>> b/drivers/gpu/drm/rcar-du/rcar_du_kms.c index cf5b422fc753..19a445fbc879
>> 100644
>> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
>> @@ -559,6 +559,7 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
>>  	struct drm_fbdev_cma *fbdev;
>>  	unsigned int num_encoders;
>>  	unsigned int num_groups;
>> +	unsigned int swi, hwi;
> 
> One variable per line please. I would also call them swindex and hwindex, that 
> would be clearer in my opinion.
> 

Fixed (on both accounts)


>>  	unsigned int i;
>>  	int ret;
>>
>> @@ -571,7 +572,7 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
>>  	dev->mode_config.funcs = &rcar_du_mode_config_funcs;
>>  	dev->mode_config.helper_private = &rcar_du_mode_config_helper;
>>
>> -	rcdu->num_crtcs = rcdu->info->num_crtcs;
>> +	rcdu->num_crtcs = hweight8(rcdu->info->channel_mask);
>>
>>  	ret = rcar_du_properties_init(rcdu);
>>  	if (ret < 0)
>> @@ -581,7 +582,7 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
>>  	 * Initialize vertical blanking interrupts handling. Start with vblank
>>  	 * disabled for all CRTCs.
>>  	 */
>> -	ret = drm_vblank_init(dev, (1 << rcdu->info->num_crtcs) - 1);
>> +	ret = drm_vblank_init(dev, (1 << rcdu->num_crtcs) - 1);
>>  	if (ret < 0)
>>  		return ret;
>>
>> @@ -623,10 +624,16 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
>>  	}
>>
>>  	/* Create the CRTCs. */
>> -	for (i = 0; i < rcdu->num_crtcs; ++i) {
>> -		struct rcar_du_group *rgrp = &rcdu->groups[i / 2];
>> +	for (swi = 0, hwi = 0; swi < rcdu->num_crtcs; ++hwi) {
>> +		struct rcar_du_group *rgrp;
>> +
>> +		/* Skip unpopulated DU channels */
> 
> s/channels/channels./

Done.


> 
>> +		if (!(rcdu->info->channel_mask & BIT(hwi)))
>> +			continue;
>> +
>> +		rgrp = &rcdu->groups[hwi / 2];
>>
>> -		ret = rcar_du_crtc_create(rgrp, i);
>> +		ret = rcar_du_crtc_create(rgrp, swi++, hwi);
>>  		if (ret < 0)
>>  			return ret;
>>  	}
> 
> This is going to turn into an infinite loop if we ever get the num_crtcs 
> calculation wrong, but I don't see why that should be the case, so I'm OK with 
> the implementation.

Yes, I have considered this. I actually started out by making the loop condition
based on "swi < hweight8(rcdu->info->channel_mask)" because of this. Thus that
would ensure that if the channel_mask was ever unset or 0 then the loop would exit.

However then I figured there's no point duplicating the hweight8 call and that
the num_crtc's should represent the same value.

As long as no one tries to increment the num_crtc's arbitrarily - this should be
safe even if the rcdu->info->channel_mask is blank.


> With all those small issues fixed,
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks, Tag collected.

--
Kieran
