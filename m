Return-Path: <SRS0=w5fC=RE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3D42C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Mar 2019 14:47:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A964920675
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Mar 2019 14:47:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387907AbfCAOrG (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 1 Mar 2019 09:47:06 -0500
Received: from mga01.intel.com ([192.55.52.88]:60692 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728395AbfCAOrG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Mar 2019 09:47:06 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 01 Mar 2019 06:47:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,427,1544515200"; 
   d="scan'208";a="278941164"
Received: from elsaidmo-mobl2.ger.corp.intel.com (HELO [10.252.61.31]) ([10.252.61.31])
  by orsmga004.jf.intel.com with ESMTP; 01 Mar 2019 06:47:03 -0800
Subject: Re: [PATCH 12/17] drm/rcar-du: Convert to using
 __drm_atomic_helper_crtc_reset() for reset.
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
References: <20190301125627.7285-1-maarten.lankhorst@linux.intel.com>
 <20190301125627.7285-13-maarten.lankhorst@linux.intel.com>
 <20190301131358.GC32244@pendragon.ideasonboard.com>
 <93a242fe-41fc-bbe5-0ccd-f26eb729fe85@linux.intel.com>
 <20190301143640.GD32244@pendragon.ideasonboard.com>
From:   Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <cb8c2c5d-5c20-8e79-39e5-a520479c5358@linux.intel.com>
Date:   Fri, 1 Mar 2019 15:47:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190301143640.GD32244@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Op 01-03-2019 om 15:36 schreef Laurent Pinchart:
> Hi Marteen,
>
> On Fri, Mar 01, 2019 at 03:08:20PM +0100, Maarten Lankhorst wrote:
>> Op 01-03-2019 om 14:13 schreef Laurent Pinchart:
>>> On Fri, Mar 01, 2019 at 01:56:22PM +0100, Maarten Lankhorst wrote:
>>>> Convert rcar-du to using __drm_atomic_helper_crtc_reset(), instead of
>>>> writing its own version. Instead of open coding destroy_state(), call
>>>> it directly for freeing the old state.
>>> I don't think the second sentence applies to this patch.
>>>
>>>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>>> Cc: linux-renesas-soc@vger.kernel.org
>>>> ---
>>>>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 11 +++--------
>>>>  1 file changed, 3 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
>>>> index 4cdea14d552f..7766551e67fc 100644
>>>> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
>>>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
>>>> @@ -891,22 +891,17 @@ static void rcar_du_crtc_cleanup(struct drm_crtc *crtc)
>>>>  
>>>>  static void rcar_du_crtc_reset(struct drm_crtc *crtc)
>>>>  {
>>>> -	struct rcar_du_crtc_state *state;
>>>> +	struct rcar_du_crtc_state *state = kzalloc(sizeof(*state), GFP_KERNEL);
>>>>  
>>>> -	if (crtc->state) {
>>>> +	if (crtc->state)
>>>>  		rcar_du_crtc_atomic_destroy_state(crtc, crtc->state);
>>>> -		crtc->state = NULL;
>>>> -	}
>>>>  
>>>> -	state = kzalloc(sizeof(*state), GFP_KERNEL);
>>>> +	__drm_atomic_helper_crtc_reset(crtc, &state->state);
>>> state may be NULL here if the above kzalloc() failed. Let's keep the
>>> original order of the function, and simply call
>>> __drm_atomic_helper_crtc_reset() after the NULL check below.
>> There were 10 different ways crtc was implemented, I felt it was good to settle on one.
>>
>> We don't handle during reset at all, would need to start propagating this first before we should handle errors, imho.
> That's not the point. As state can be NULL, you could end up
> dereferencing a NULL pointer. The fact that the base state is the first
> field in the rcar_du_crtc_state structure is just luck, and shouldn't be
> relied on.

Would it be ok if I changed it to state ? &state->state : NULL and let the compiler deal with it?

Will probably fix up all other patches as well before committing.

>> Looking more closely, it's the same way that errors in
>> rcar_du_plane_reset() are handled. :)
> It's not, the return value of kzalloc() is checked explicitly in
> rcar_du_plane_reset() before calling __drm_atomic_helper_plane_reset().
> Please copy the code flow of rcar_du_plane_reset() to implement
> rcar_du_crtc_reset().
>

