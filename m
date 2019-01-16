Return-Path: <SRS0=SHeS=PY=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07355C43387
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 16 Jan 2019 03:30:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C33C32086D
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 16 Jan 2019 03:30:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uFLLHJdd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731019AbfAPDa0 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 15 Jan 2019 22:30:26 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:46719 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730639AbfAPDa0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Jan 2019 22:30:26 -0500
Received: by mail-wr1-f65.google.com with SMTP id l9so5210130wrt.13;
        Tue, 15 Jan 2019 19:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DAB7bOvCpjeEgqAU23iWSznTCf2WSBgkvOBydTcb6wI=;
        b=uFLLHJddp3hHH4nf6OgRarrAc4KoBIr18Rg8TI2mRyVZwatnUMvF8Oz2lx8HRiQ43K
         60CBvCl/+IJbH40zxdlD1OCusEm/kNHS1bLeKkz9ksUjPUIdF6EF0TvnHH3fRlJh9Mxi
         JFrGHdknEZWggYUo8qkgdxFvjcsDDsiPZsOq7xHrLN8gDyYX1SX8eN8l4nvSWhhBU+Jx
         vADM7lSxRTt9/G8iXSbxhnMMJHxGkLYUpi/UHI501Hgr6ZLNijXRqSPqr+wHTjoD02gn
         5T47olbOz3ahOnG/2xJgXfwJH1rTtVv5zLYfuJ1eZYWfHhOwRhgawQmxExSqitbHTpSK
         dpkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DAB7bOvCpjeEgqAU23iWSznTCf2WSBgkvOBydTcb6wI=;
        b=DtRke3F3GFGz2RC2JVkuQRWetJjM9mQGS6Y4qlgud/6uuStmMJLedq5sIQ2D9Zz7Ti
         jn5cA20ynnOyMU8mvB27+3cEDjnoNwkS/7Zso8DX9pmAmFraegQmpyfcPnhPujUEYKKA
         lJmC+e+klqbBefV8CrUlKHj+zGcgnZzkXomubEU//G8nOZlKflTkwBI7bNACxbWvERO9
         ftPUJAUGbBrKg7HWwxv0MOR2sFEvy/WGCd8pE1oR/LbBe5ySfCc6NINufvm38BxN/3hP
         F5geGyKz59r82L9cfJxNK6dJPjx8BcX2YMq1SszpSh6i6mavUNk+Lo6QniMak0iJgh7k
         xkBQ==
X-Gm-Message-State: AJcUukfDnFR/nt3NwBBaN+x1NnxmjnTyqxJdZgD8ujAz3cEA8r95V79/
        DUA2Jmy9DXGtCcmjIYUaY3TCTE1sXTFEKUNnUSz/2XUfa8Q=
X-Google-Smtp-Source: ALg8bN7cxSJGppag4xxGzhM4PxdbCoQCVPdZ0OtFy2Ew9NaqrdEByk31K9k1/6DgDg1uk9zX2XiehKYFhzIF7C9uslQ=
X-Received: by 2002:a5d:488f:: with SMTP id g15mr5564831wrq.15.1547609423651;
 Tue, 15 Jan 2019 19:30:23 -0800 (PST)
MIME-Version: 1.0
References: <20190115104137.25695-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20190115104137.25695-1-daniel.vetter@ffwll.ch>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Tue, 15 Jan 2019 22:30:11 -0500
Message-ID: <CADnq5_Oa0dj1+eOcAF6QxVxy0XRXNggZT+4K=Cm_=G80V-ejGQ@mail.gmail.com>
Subject: Re: [PATCH] drm: Split out drm_probe_helper.h
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        "open list:VIRTIO CORE, NET..." 
        <virtualization@lists.linux-foundation.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-samsung-soc@vger.kernel.org,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        linux-rockchip@lists.infradead.org,
        nouveau <nouveau@lists.freedesktop.org>,
        spice-devel@lists.freedesktop.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        etnaviv@lists.freedesktop.org,
        Jani Nikula <jani.nikula@linux.intel.com>,
        linux-mediatek@lists.infradead.org,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, xen-devel@lists.xen.org,
        linux-renesas-soc@vger.kernel.org,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jan 15, 2019 at 5:41 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> Having the probe helper stuff (which pretty much everyone needs) in
> the drm_crtc_helper.h file (which atomic drivers should never need) is
> confusing. Split them out.
>
> To make sure I actually achieved the goal here I went through all
> drivers. And indeed, all atomic drivers are now free of
> drm_crtc_helper.h includes.
>
> v2: Make it compile. There was so much compile fail on arm drivers
> that I figured I'll better not include any of the acks on v1.
>
> v3: Massive rebase because i915 has lost a lot of drmP.h includes, but
> not all: Through drm_crtc_helper.h > drm_modeset_helper.h -> drmP.h
> there was still one, which this patch largely removes. Which means
> rolling out lots more includes all over.
>
> This will also conflict with ongoing drmP.h cleanup by others I
> expect.
>
> v3: Rebase on top of atomic bochs.
>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com> (v2)
> Acked-by: Benjamin Gaignard <benjamin.gaignard@linaro.org> (v2)
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: virtualization@lists.linux-foundation.org
> Cc: etnaviv@lists.freedesktop.org
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: intel-gfx@lists.freedesktop.org
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-amlogic@lists.infradead.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Cc: spice-devel@lists.freedesktop.org
> Cc: amd-gfx@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> Cc: linux-rockchip@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-tegra@vger.kernel.org
> Cc: xen-devel@lists.xen.org
> ---
> Merging this is going to be a bit a mess due to all the ongoing drmP.h
> cleanups. I think the following should work:
> - Apply Sam's prep patches for removing drmP.h from
>   drm_modeset_helper.h
> - Get the i915 drmP.h cleanup backmerged into drm-misc-next
> - Apply this patch.
> - Apply Sam's patch to remove drmP.h from drm_modeset_helper.h
> - All through drm-misc-next, which has some potential for trivial
>   conflicts around #includes with other drivers unfortunately.
>
> I hope there's no other driver who'll blow up accidentally because
> someone else is doing a drmP.h cleanup. Laurent maybe?
>
> Jani, ack on this?
> -Daniel

amdgpu and radeon:
Acked-by: Alex Deucher <alexander.deucher@amd.com>
