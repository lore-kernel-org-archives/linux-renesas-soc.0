Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <1823154.LT2zYSFJ4j@avalon>
References: <cover.75b0c7f741ed33015a7ad44941bed1f6152a48a9.1499956639.git-series.maxime.ripard@free-electrons.com>
 <aeeb8f778dae8f170294b6da92819973b742feb2.1499956639.git-series.maxime.ripard@free-electrons.com>
 <1823154.LT2zYSFJ4j@avalon>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 14 Jul 2017 07:37:54 +0200
Message-ID: <CAKMK7uE4j3Dy4qOd+WbTxg1BrYfPXGZVsxMWgPSx_1a1OhKu7A@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/atomic: implement drm_atomic_helper_commit_tail
 for runtime_pm users
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>,
        "open list:DRM DRIVERS FOR RENESAS"
        <linux-renesas-soc@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Jul 14, 2017 at 1:43 AM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>> Commit 52055bafa1ff ("drm: rcar-du: Move plane commit code from CRTC
>> start to CRTC resume") changed the order of the plane commit and CRTC
>> enable operations to accommodate the runtime PM requirements. However,
>> this introduced corruption in the first displayed frame, as the CRTC is
>> now enabled without any plane configured. On Gen2 hardware the first
>> frame will be black and likely unnoticed, but on Gen3 hardware we end up
>> starting the display before the VSP compositor, which is more
>> noticeable.
>>
>> To fix this, revert the order of the commit operations back, and handle
>> runtime PM requirements in the CRTC .atomic_begin() and .atomic_enable()
>> helper operation handlers.
>
> I believe that the "runtime PM" order is problematic in most drivers. The
> problem usually goes unnoticed as most monitors will not even display the
> first frame, and I assume many devices will just output it black, but it's an
> issue nonetheless.
>
> Note that my driver hasn't lost the "runtime PM" requirements, so I had to
> support them with the "standard" order. The best way I've found was to runtime
> resume in the one of .atomic_begin() and .enable() that is run first. Not very
> neat, as similar code would be needed in most drivers. I wonder whether it
> wouldn't be useful to add resume/suspend helper callbacks for the CRTC.

I discussed this with Laurent and explained that "first black frame"
is exactly what i915 does. I'd say given special customer requests we
don't yet have to bother with this in general ...

Wrt adding more hooks for rpm: I honestly don't like that, because
then someone else wants to add a hook for clocks, or for the sideband
and then we have a horror show of hooks where every driver uses just a
very small subset. The point of atomic helpers is to make them
modular, if one part doesn't fit, just redo in your driver. Goal
should be that shared parts are good for about 90% of
drivers/use-cases (maybe even less, there's sooooo many special
cases).

tldr; I still think the _runtime_pm variant is the recommended way to do this.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
