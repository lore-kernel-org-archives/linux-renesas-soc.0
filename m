Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:53238 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751257AbdGQH7o (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jul 2017 03:59:44 -0400
Subject: Re: [PATCH] drm: rcar-du: Setup planes before enabling CRTC to avoid
 flicker
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
References: <20170628185055.16379-1-laurent.pinchart+renesas@ideasonboard.com>
 <9120be80-cefe-e52a-e512-15145ded1e82@ideasonboard.com>
 <92490bac-1731-41b0-ac1c-93699963959c@ideasonboard.com>
 <4f6ab180-efbb-432d-a765-82f766da32c9@ideasonboard.com>
 <20170717063237.cozr3wednozvprxn@flea>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <b3e96478-6c0e-fd75-3cac-fd4bde74da25@ideasonboard.com>
Date: Mon, 17 Jul 2017 08:59:41 +0100
MIME-Version: 1.0
In-Reply-To: <20170717063237.cozr3wednozvprxn@flea>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Maxime,

On 17/07/17 07:32, Maxime Ripard wrote:
> On Thu, Jul 13, 2017 at 05:25:08PM +0100, Kieran Bingham wrote:
>>>>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
>>>>> index 82b978a5dae6..c2f382feca07 100644
>>>>> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
>>>>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
>>>>> @@ -255,9 +255,9 @@ static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
>>>>>  
>>>>>  	/* Apply the atomic update. */
>>>>>  	drm_atomic_helper_commit_modeset_disables(dev, old_state);
>>>>> -	drm_atomic_helper_commit_modeset_enables(dev, old_state);
>>>>>  	drm_atomic_helper_commit_planes(dev, old_state,
>>>>>  					DRM_PLANE_COMMIT_ACTIVE_ONLY);
>>>>
>>>> Except for DRM_PLANE_COMMIT_ACTIVE_ONLY, this function now looks very much like
>>>> the default drm_atomic_helper_commit_tail() code.
>>>>
>>>> Reading around other uses /variants of commit_tail() style functions in other
>>>> drivers has left me confused as to how the ordering affects things here.
>>>>
>>>> Could be worth adding a comment at least to describe why we can't use the
>>>> default helper...
>>>
>>> Or better still ... Use Maxime's new :
>>>
>>> [PATCH 1/4] drm/atomic: implement drm_atomic_helper_commit_tail for runtime_pm users
>>
>> Never mind - I've just looked again, and seen that this new helper function is
>> the ordering previous to *this* patch, and therefore isn't the same.
>>
>> However - it's worth noting that Maxime's patch converts this function to the
>> new helper - which contradicts this patch's motivations.
> 
> So I guess I should drop the renesas modifications in my serie then?

Yes, Please.

I think we have a few extra modifications in this function as well which will
take it further away from a default implementation.

Regards

Kieran

> 
> Maxime
> 
