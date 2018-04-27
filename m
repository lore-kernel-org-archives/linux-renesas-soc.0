Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:49444 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757645AbeD0KOj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Apr 2018 06:14:39 -0400
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [PATCH 07/17] drm: rcar-du: Add R8A77965 support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, David Airlie <airlied@linux.ie>,
        "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20180426165346.494-1-kieran.bingham+renesas@ideasonboard.com>
 <20180426165346.494-8-kieran.bingham+renesas@ideasonboard.com>
 <1954980.A0ABKULED7@avalon>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Message-ID: <cfe1b007-de3e-d8c0-90f8-4be8f36b324d@ideasonboard.com>
Date: Fri, 27 Apr 2018 11:14:34 +0100
MIME-Version: 1.0
In-Reply-To: <1954980.A0ABKULED7@avalon>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 26/04/18 21:43, Laurent Pinchart wrote:
> Hi Kieran,
> 
> Thank you for the patch.
> 
> On Thursday, 26 April 2018 19:53:36 EEST Kieran Bingham wrote:
>> The R8A77965 (M3-N) SoC provides VGA, HDMI and LVDS output.
>>
>> This platform is unusual in that the VGA is connected to DU3 leaving DU2
>> unpopulated. This is reflected by the channel_mask accordingly.
> 
> I'd write s/VGA/DPAD/g (or s/VGA/RGB/g) as the DPAD output can be used for 
> other purposes than VGA.
> 
>> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>> ---
>>  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 29 +++++++++++++++++++++++++++
>>  1 file changed, 29 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
>> b/drivers/gpu/drm/rcar-du/rcar_du_drv.c index d6ebc628fc22..4d195ff8c569
>> 100644
>> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
>> @@ -246,6 +246,34 @@ static const struct rcar_du_device_info
>> rcar_du_r8a7796_info = { .dpll_ch =  BIT(1),
>>  };
>>
>> +static const struct rcar_du_device_info rcar_du_r8a77965_info = {
>> +	.gen = 3,
>> +	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
>> +		  | RCAR_DU_FEATURE_EXT_CTRL_REGS
>> +		  | RCAR_DU_FEATURE_VSP1_SOURCE,
>> +	.channel_mask = BIT(0) | BIT(1) | BIT(3),
> 
> Depending on what you think of my suggestions for patch 05/17, you might want 
> to reverse the bit order here.

Done.

> 
>> +	.routes = {
>> +		/*
>> +		 * R8A77965 has one RGB output, one LVDS output and one HDMI
>> +		 * output.
>> +		 */
>> +		[RCAR_DU_OUTPUT_DPAD0] = {
>> +			.possible_crtcs = BIT(2),
>> +			.port = 0,
>> +		},
>> +		[RCAR_DU_OUTPUT_HDMI0] = {
>> +			.possible_crtcs = BIT(1),
>> +			.port = 1,
>> +		},
>> +		[RCAR_DU_OUTPUT_LVDS0] = {
>> +			.possible_crtcs = BIT(0),
> 
> I wonder whether it wouldn't be easier to read if we replaced possible_crtcs 
> with possible_channels, as this structure describes the hardware and had its 
> num_crtcs field replaced with a channel_mask. This would require converting 
> the possible_channels field to a possible_crtcs field in 
> rcar_du_modeset_init(), and I think that no change would be needed in 
> rcar_du_group_setup_defr8() (but please double check). On the other hand, no 
> code would be simplified, and rcar_du_modeset_init() would gain some 
> additional complexity, so it might not be worth it.

I think we can leave this for now and consider it later if worth while.

> 
> Either way this patch looks good to me.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks, collected.

--
Kieran


> 
>> +			.port = 2,
>> +		},
>> +	},
>> +	.num_lvds = 1,
>> +	.dpll_ch =  BIT(1),
>> +};
>> +
>>  static const struct rcar_du_device_info rcar_du_r8a77970_info = {
>>  	.gen = 3,
>>  	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
>> @@ -277,6 +305,7 @@ static const struct of_device_id rcar_du_of_table[] = {
>>  	{ .compatible = "renesas,du-r8a7794", .data = &rcar_du_r8a7794_info },
>>  	{ .compatible = "renesas,du-r8a7795", .data = &rcar_du_r8a7795_info },
>>  	{ .compatible = "renesas,du-r8a7796", .data = &rcar_du_r8a7796_info },
>> +	{ .compatible = "renesas,du-r8a77965", .data = &rcar_du_r8a77965_info },
>>  	{ .compatible = "renesas,du-r8a77970", .data = &rcar_du_r8a77970_info },
>>  	{ }
>>  };
> 
