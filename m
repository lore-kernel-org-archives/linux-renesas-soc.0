Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:59106 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726753AbeIQQXS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Sep 2018 12:23:18 -0400
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH] drm: rcar-du: Revert "drm: rcar-du: Use
 __drm_atomic_helper_plane_reset instead of copying the logic"
To: Alexandru-Cosmin Gheorghe <Alexandru-Cosmin.Gheorghe@arm.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        David Airlie <airlied@linux.ie>
References: <20180914200949.25763-1-kieran.bingham+renesas@ideasonboard.com>
 <47884203-31b8-8389-d502-f5c0795c8d1d@ideasonboard.com>
 <20180917091035.GB31483@e114479-lin.cambridge.arm.com>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Message-ID: <013a8df0-6bea-e06e-4e69-a7669e8f1bb5@ideasonboard.com>
Date: Mon, 17 Sep 2018 11:56:23 +0100
MIME-Version: 1.0
In-Reply-To: <20180917091035.GB31483@e114479-lin.cambridge.arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Alexandru,

On 17/09/18 10:10, Alexandru-Cosmin Gheorghe wrote:
> Hi Kieran,
> 
> Sorry for that and thanks for getting to the bottom of it.

No worries,


> On Fri, Sep 14, 2018 at 11:28:05PM +0100, Kieran Bingham wrote:
>> Hi Laurent,
>>
>> I've looked through a bit further to try to understand this issue and I
>> think I have identified a possible/probable cause.
>>
>> Before commit 161ad653d6c9, we *always* set the plane->state->alpha as
>> DRM_BLEND_ALPHA_OPAQUE. (0xffff)
>>
>> After this commit, the __drm_atomic_helper_plane_reset() call will only
>> set state->alpha to 0xffff if the alpha_property is set:
>>
>>         if (plane->alpha_property)
>>                 state->alpha = plane->alpha_property->values[1];
>>
>> Then the state->alpha value is always referenced in
>> rcar_du_vsp_plane_setup() and passed to the VSP for that layer.
>>
>>
>> We can see in rcar_du_planes_init(), that all OVERLAY planes are
>> configured to have this propery with a call to
>> drm_plane_create_alpha_property(&plane->plane); however - the PRIMARY
>> plane is skipped over before setting this.
>>
>>
>> I believe I recall seeing that the kms-test-planeposition.py
>> successfully showed other planes which were not the back one (I'm now
>> going from hazy memory of this afternoon - but I am fairly sure I saw this)
>>
>>
>> This implies that the primary planes are being incorrectly configured -
>> but the overlay planes are still functioning as expected.
>>
>> So I believe we could move the call to create the alpha property:
>> 	drm_plane_create_alpha_property(&plane->plane);
>>
>> to occur before the if (type == DRM_PLANE_TYPE_PRIMARY) continue; statement.
>>
> 
> I don't see any reson why the primary plane shouldn't advertise an
> alpha as well.


OK - so I think we perhaps should make sure that we enable alpha for our
primary plane in rcar-du.


>> It may or may not make sense to have alpha blending support on the
>> PRIMARY plane. At the risk of sounding silly - can we have anything else
>> behind the PRIMARY plane ? (I doubt this, I don't think we have any
>> extra layers hiding anywhere)
> 
> I think the same question could apply to situations where PRIMARY is
> disabled and you have just one OVERLAY plane enabled.
> 
>>
>> Otherwise, I think we would need to intercept the configuration of the
>> alpha blending and make sure that all PRIMARY planes are configured to
>> be fully opaque in our layers. I think this is happening in
>> rcar_du_vsp_plane_setup().
>>
>> But rather than put in a conditional in there, I think I'd rather just
>> initialise the plane->state->alpha = DRM_BLEND_ALPHA_OPAQUE in our
>> rcar_du_vsp_plane_reset() call and be done with it.
> 
> I think you could do more and just go in
> __drm_atomic_helper_plane_reset and always initializes plane->alpha
> with DRM_BLEND_ALPHA_OPAQUE, this way nobody else hits this problem.

I think this sounds like a good thing too.

Is DRM_BLEND_ALPHA_OPAQUE a suitable initial value for all of the other
users of the helper ?

I suspect the answer is yes, but I'll try to do a bit of digging through
the other drivers tomorrow.

I presume we could then just remove the conditional check and always
initialise to OPAQUE ...

Or otherwise perhaps maybe initialising as an 'else' if no alpha
property is provided.

--
Regards

Kieran






>>
>> Anyway - just some musings and thoughts at this stage, we can
>> investigate in more detail next week.
>>
>> --
>> Regards
>>
>> Kieran
>>
>>
>> On 14/09/18 21:09, Kieran Bingham wrote:
>>> Commit: 161ad653d6c9 ("drm: rcar-du: Use __drm_atomic_helper_plane_reset
>>> instead of copying the logic") causes a regression in the R-Car DU
>>> display driver, and prevents any output from being displayed.
>>>
>>> The display appears to function correctly but only a black screen is
>>> ever visible.
>>>
>>> Revert the commit.
>>>
>>> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>>
>>> ---
>>>
>>> Looking through the code, the reason for this issue isn't particularly
>>> obvious - and will need some further exploration, which I can't look at
>>> until Tuesday. So I'm posting this revert patch to
>>>
>>>  A) Report the issue
>>>  B) Provide a temporary fix
>>>
>>> I suspect either the initial alpha value is not set correctly or setting
>>>
>>>          state->pixel_blend_mode = DRM_MODE_BLEND_PREMULTI;
>>>
>>> causes some side effect perhaps. There's not much else that could be
>>> different between the helper, and the original code.
>>>
>>>  drivers/gpu/drm/rcar-du/rcar_du_plane.c | 6 ++++--
>>>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c   | 5 ++++-
>>>  2 files changed, 8 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
>>> index 9e07758a755c..5c2462afe408 100644
>>> --- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
>>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
>>> @@ -686,12 +686,14 @@ static void rcar_du_plane_reset(struct drm_plane *plane)
>>>  	if (state == NULL)
>>>  		return;
>>>  
>>> -	__drm_atomic_helper_plane_reset(plane, &state->state);
>>> -
>>>  	state->hwindex = -1;
>>>  	state->source = RCAR_DU_PLANE_MEMORY;
>>>  	state->colorkey = RCAR_DU_COLORKEY_NONE;
>>>  	state->state.zpos = plane->type == DRM_PLANE_TYPE_PRIMARY ? 0 : 1;
>>> +
>>> +	plane->state = &state->state;
>>> +	plane->state->alpha = DRM_BLEND_ALPHA_OPAQUE;
>>> +	plane->state->plane = plane;
>>>  }
>>>  
>>>  static int rcar_du_plane_atomic_set_property(struct drm_plane *plane,
>>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
>>> index 4576119e7777..3170b126cfba 100644
>>> --- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
>>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
>>> @@ -341,8 +341,11 @@ static void rcar_du_vsp_plane_reset(struct drm_plane *plane)
>>>  	if (state == NULL)
>>>  		return;
>>>  
>>> -	__drm_atomic_helper_plane_reset(plane, &state->state);
>>> +	state->state.alpha = DRM_BLEND_ALPHA_OPAQUE;
>>>  	state->state.zpos = plane->type == DRM_PLANE_TYPE_PRIMARY ? 0 : 1;
>>> +
>>> +	plane->state = &state->state;
>>> +	plane->state->plane = plane;
>>>  }
>>>  
>>>  static const struct drm_plane_funcs rcar_du_vsp_plane_funcs = {
>>>
> 
