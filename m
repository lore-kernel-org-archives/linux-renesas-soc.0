Return-Path: <SRS0=QNR1=P6=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D922C282C4
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Jan 2019 08:03:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D359320879
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Jan 2019 08:03:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="JAqpKWef"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727468AbfAVIDv (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 22 Jan 2019 03:03:51 -0500
Received: from mail-it1-f194.google.com ([209.85.166.194]:37485 "EHLO
        mail-it1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727165AbfAVIDu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jan 2019 03:03:50 -0500
Received: by mail-it1-f194.google.com with SMTP id b5so18909091iti.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Jan 2019 00:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2Syz3w5shfKU03CRg/FlS++679Lm7R5GpEIXI8UEMKo=;
        b=JAqpKWefehuaNt0Qvb3M0k2K3z1oFQ8Nox2oy5czaf4vTWIA32EmFoKNfRfjlsoT/i
         i3E+lG32p1/4LqWufFYz+bMeVzxItpRy9d1J+8A55lcpAZWEtlQgle2vbLq+OlVrOH7x
         KpYbEiVDYzzAk2hNws+TpocOMtpnvK6CeVE34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2Syz3w5shfKU03CRg/FlS++679Lm7R5GpEIXI8UEMKo=;
        b=Hx9p2/WxUnkdQztRH5Kfj0BtG+dssvYqv1XpQvshRaLnYnlcQ1I2bESzMxYuElzcjV
         4fBNM+KJHddGOgbDVU5DXKy0iBFf/t8fQtTXYclPwOA+YE8g2GJG3XmSbbkvVdo73vT2
         ge4TbcnUJ4Yfm8xM6Sx0/vj97BlQcTqH/PnsbOADFgMJS0m7j8UYR09y2YRgEEIH67ey
         T6bzNd/VmOWpqapkGQDjIywm8Sd/2JROV4gSbNizugqooVmJ2fAAqQqrbjM1VdVxpfMB
         CkgnttgiyXt8gGHdpcpakovGl5SZWpBkmanAM63YciNbKhO9rDL2yDo3GFdmFq6DNhRr
         2v/A==
X-Gm-Message-State: AJcUukcTLaGThrWbX6y/L7lQ/YEEN5u/3W7uHD0oqrKfnvFq0zRifDvf
        BH47ck+zwcsG+eJGSpajyz0XIEUrBCNvKwn3xpQDPA==
X-Google-Smtp-Source: AHgI3IaSUhfZRCtrbe2ENHC18/zT0bn+kGk8z+bxXZ+/UY7ss+m81axiyhxuMy5rCoQi27V6DiuFUB9EPuP06OatQRo=
X-Received: by 2002:a24:94cb:: with SMTP id j194mr1502533ite.117.1548144227888;
 Tue, 22 Jan 2019 00:03:47 -0800 (PST)
MIME-Version: 1.0
References: <20190116163442.12622-1-daniel.vetter@ffwll.ch>
 <20190116181018.GA27364@ravnborg.org> <20190117164541.GE3271@phenom.ffwll.local>
 <20190117174531.GA14041@ravnborg.org> <20190121221329.GA6512@ravnborg.org>
In-Reply-To: <20190121221329.GA6512@ravnborg.org>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Tue, 22 Jan 2019 09:03:36 +0100
Message-ID: <CAKMK7uF_8yRycA4ZUyudH7dM23DOiFEkKStAbbAvD=79y_UE_Q@mail.gmail.com>
Subject: Re: [PATCH] drm: Split out drm_probe_helper.h
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        "open list:VIRTIO CORE, NET..." 
        <virtualization@lists.linux-foundation.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Nouveau Dev <nouveau@lists.freedesktop.org>,
        "open list:DRM DRIVER FOR QXL VIRTUAL GPU" 
        <spice-devel@lists.freedesktop.org>,
        Jani Nikula <jani.nikula@intel.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        The etnaviv authors <etnaviv@lists.freedesktop.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        xen-devel@lists.xen.org,
        "open list:DRM DRIVERS FOR RENESAS" 
        <linux-renesas-soc@vger.kernel.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jan 21, 2019 at 11:13 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Daniel et al.
>
> > >
> > > Yeah the drm_crtc_helper.h header is a bit the miniature drmP.h for legacy
> > > kms drivers. Just removing it from all the atomic drivers caused lots of
> > > fallout, I expect even more if you entirely remove the includes it has.
> > > Maybe a todo, care to pls create that patch since it's your idea?
> >
> > The main reason I bailed out initially was that this would create
> > small changes to several otherwise seldomly touched files.
> > And then we would later come and remove drmP.h - so lots of
> > small but incremental changes to the same otherwise seldomly
> > edited files.
> > And the job was only partially done.
> >
> > I will try to experiment with an approach where I clean up the
> > include/drm/*.h files a little (like suggested above, +delete drmP.h
> > and maybe a bit more).
> >
> > Then to try on a driver by driver basis to make it build with a
> > cleaned set of include files.
> > I hope that the cleaned up driver can still build without the
> > cleaned header files so the changes can be submitted piecemal.
> >
> > Will do so with an eye on the lesser maintained drivers to try it
> > out to avoid creating too much chrunch for others.
>
> I have now a few patches queued, but the result is not too pretty.
> I did the following:
>
> - For all files in include/drm/*.h the set of include files
>   were adjusted to the minimum number of files required to make
>   them build without any other files included first.
>
>   Created one .c file for each .h file. Then included the .h
>   file and adjusted to the minimal set of include files.
>   In the process a lot of forwards were added.
>
> - Deleted drmP.h
>
> - Fixed build of a few drivers: sti, tilcdc, gma500, tve200, via
>
> Some observations:
>
> - Killing all the includes not needed in the headers files
>   results in a a lot of extra changes.
>   Examples:
>     drm_modseset_helper_vtables.h is no longer
>     included by anyone, so needs to be added in many files
>
>     drm_atomic_state_helper.h is no longer included
>     by anyone so likewise needs to be added in many files
>
> - It is very tedious to do this properly.
>   The process I followed was:
>   - delete / comment out all include files
>   - add back the obvious from a quick scan of the code
>   - build - fix - build - fix - build - fix ...
>   -   next file...
>
> - The result is errorprone as only the allyesconfig + allmodconfig
>   variants are tested. But reallife configurations are more diverse.
>
> Current diffstat:
>    111 files changed, 771 insertions(+), 401 deletions(-)
>
> This is for the 5 drivers alone and not the header cleanup.
> So long story short - this is not good and not the way forward.
>
> I will try to come up with a few improvements to make the
> headers files selfcontained, but restricted to the changes that
> add forwards/include to avoid the chrunch in all the drivers.
>
> And then post for review a few patches to clean up some headers.
> If the cleanup gets a go I will try to persuade the introduction
> of these.
> This will include, but will not be limited to, the above mentioned
> drm_crtc_helper.h header file.
>
> For now too much time was already spent on this, so it is at the
> moment pushed back on my TODO list.
> This mail serve also as a kind of "where had I left", when/if I
> pick this up again.
>
> If there are anyone that knows some tooling that can help in the
> process of adjusting the header files I am all ears.

Yeah in the process of splitting up drmP.h we've created a few smaller
such piles of headers. I think in some cases it's just not going to be
worth it to fully split them up, e.g. drm_crtc_helper.h is going to be
a pure legacy helper, only needed by pre-atomic drivers. Splitting
that up doesn't seem to useful to me. Similarly we might want
drm_atomic_helper.h to keep pulling in the other helper headers. So
probably going to be a judgement call on a case-by-case basis.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
