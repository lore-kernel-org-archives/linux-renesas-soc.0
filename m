Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:45361 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751751AbdBMKQj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Feb 2017 05:16:39 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [GIT PULL FOR renesas-drivers] R-Car DU fences support
Date: Mon, 13 Feb 2017 12:17:02 +0200
Message-ID: <247832795.fTsiDZqEps@avalon>
In-Reply-To: <CAMuHMdUFtcFMB-dto17br7Uy=dOvczMzm4Wz4SnSD83DOYP+Eg@mail.gmail.com>
References: <2544319.rV1JboMAgI@avalon> <CAMuHMdXvYOuXMFLNMoyZ7t14-Vfx9YhP+aJ7faw_tz3JimHVdQ@mail.gmail.com> <CAMuHMdUFtcFMB-dto17br7Uy=dOvczMzm4Wz4SnSD83DOYP+Eg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Monday 13 Feb 2017 11:13:31 Geert Uytterhoeven wrote:
> On Mon, Feb 13, 2017 at 11:05 AM, Geert Uytterhoeven wrote:
> > On Sun, Feb 12, 2017 at 2:13 PM, Laurent Pinchart wrote:
> >> The following changes since commit 
5685cab84a6dc376a8d0e4534ae4b973546158b4:
> >>   Merge remote-tracking branch 'drm-misc/drm-misc-next' into
> >>   drm/next/base
> >> 
> >> (2017-02-12 13:18:50 +0200)
> >> 
> >> are available in the git repository at:
> >>   git://linuxtv.org/pinchartl/media.git drm/next/du
> >> 
> >> for you to fetch changes up to a194138cd82dff52d4c39895fd89dc6f26eafc97:
> >>   drm: rcar-du: Use DRM core's atomic commit helper (2017-02-12 14:15:36
> >> 
> >> +0200)
> > 
> > Thank you, scheduled for inclusion in next renesas-drivers release
> > (probably renesas-drivers-2017-02-21-v4.10).
> 
> Hit send too soon...
> 
> Note that it already fails to merge cleanly into today's linux-next (holding
> wood, rabbit ears and tails, ... for next week).

Hardly a surprise, drm-misc evolves really fast, any patch series that touches 
the DRM core has a high risk of conflicting. I hope that Maarten will resubmit 
his patches soon and get them merged.

> My untested resolution:

Looks good to me.

> diff --cc drivers/gpu/drm/drm_atomic.c
> index a5673107db26c403,428743efc031e717..0000000000000000
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@@ -1938,8 -1949,8 +1949,8 @@@ static int prepare_crtc_signaling(struc
>         if (arg->flags & DRM_MODE_ATOMIC_TEST_ONLY)
>                 return 0;
> 
> -       for_each_crtc_in_state(state, crtc, crtc_state, i) {
> +       for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
>  -              u64 __user *fence_ptr;
>  +              s32 __user *fence_ptr;
> 
>                 fence_ptr = get_out_fence_for_crtc(crtc_state->state, crtc);
> 
> @@@ -2018,17 -2029,14 +2029,17 @@@ static void complete_crtc_signaling(str
>                 return;
>         }
> 
> -       for_each_crtc_in_state(state, crtc, crtc_state, i) {
> +       for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
>  +              struct drm_pending_vblank_event *event = crtc_state->event;
>                 /*
>  -               * TEST_ONLY and PAGE_FLIP_EVENT are mutually
>  -               * exclusive, if they weren't, this code should be
>  -               * called on success for TEST_ONLY too.
>  +               * Free the allocated event. drm_atomic_helper_setup_commit
>  +               * can allocate an event too, so only free it if it's ours
>  +               * to prevent a double free in drm_atomic_state_clear.
>                  */
>  -              if (crtc_state->event)
>  -                      drm_event_cancel_free(dev,
> &crtc_state->event->base); +              if (event && (event->base.fence
> || event->base.file_priv)) { +                     
> drm_event_cancel_free(dev, &event->base);
>  +                      crtc_state->event = NULL;
>  +              }
>         }
> 
>         if (!fence_state)

-- 
Regards,

Laurent Pinchart
