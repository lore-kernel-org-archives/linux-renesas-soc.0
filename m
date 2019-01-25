Return-Path: <SRS0=AddW=QB=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D96DC282C0
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 25 Jan 2019 15:12:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5BFEE218D0
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 25 Jan 2019 15:12:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gn2eoqLK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726269AbfAYPMx (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 25 Jan 2019 10:12:53 -0500
Received: from mail-vs1-f66.google.com ([209.85.217.66]:36271 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726111AbfAYPMx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Jan 2019 10:12:53 -0500
Received: by mail-vs1-f66.google.com with SMTP id v205so5857292vsc.3;
        Fri, 25 Jan 2019 07:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qeeS4c88knSK89mk8R7AcXjNNhDwhbuq8XG6IWuEQUk=;
        b=gn2eoqLKbhkShzqIB3CeXdajIYFk17aTIdPZdkEeNNHuHTnorLv57GuUFcRyyRLpl/
         fJTwVJdNyXDk+somaX/sl7vN/EjYYZyrihbBBbSo6ZiyE0IJn8P5MMxI5pY8h9SE2VhM
         zKpG9/qf+nFTvbqr2By762JF/pDZeq+rDqW7Ry/cVEvV6AHDdcgG15vSM9tNsNxadfNE
         Pl8ISJlu5u+cVEEEz2hm74/KSsh8DO8wWOqYFB84KMOig9r6VNCDcmiLj1A8knbulC5I
         65lFE2rgoq48vrzmIoXYJaRX07PTCm+QQTPJWK2rEm9xPzL7EpaLVRysFVPbDu+doaoq
         0KLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qeeS4c88knSK89mk8R7AcXjNNhDwhbuq8XG6IWuEQUk=;
        b=aR4nwJQjnCI4YPWon8kaY3Y4uHdAOLj8PS3mJtIcAgb17qp4HhGHOJ9okAVPjEw1YN
         P1fGRMldV0SELflO8w5BwE8ZlULD/eviMwF851WXJkv6geNnoX1Xg2NWytBGAdxKhkeg
         IwjDzfkr6nxn4cnlIJX9QaXXFoJhrEnmNtXANzE3b4FbdTq4nUBFO4XdA35/19V6PMNI
         BUYJ0jPXjnOk/uAPkV6Pm/ULXAGQSY80TPGtFx9M62oHLkMxEbY9Jgp/L9RwKmxukWjY
         tMSR2S1lx0g+HTwMNBbOadSbZsg3Ak+BuyHDM5ZHTVRL8f40P1HDxvEhJPs/XQ7gbcFt
         s/hg==
X-Gm-Message-State: AJcUukcwRzgoc04DmuxSbuC34MBm+3P33pSznwqSkhj6Ifc7eQtGgYs5
        UWGHrQZUIpA3DUPQ61AjbQu5SfhK9GcsmJFvVLcyoA==
X-Google-Smtp-Source: ALg8bN4TdPePO5U3SZKFlVwm6CHk+iHb487nVCQWm00orfsqe8O/kc6JsiOLu8DUZqBq5yIaJW7RSm7lKVV6TgnDTu0=
X-Received: by 2002:a67:cf02:: with SMTP id y2mr4613740vsl.118.1548429171526;
 Fri, 25 Jan 2019 07:12:51 -0800 (PST)
MIME-Version: 1.0
References: <20190124165831.16427-1-daniel.vetter@ffwll.ch> <20190124165831.16427-2-daniel.vetter@ffwll.ch>
In-Reply-To: <20190124165831.16427-2-daniel.vetter@ffwll.ch>
From:   Emil Velikov <emil.l.velikov@gmail.com>
Date:   Fri, 25 Jan 2019 15:09:00 +0000
Message-ID: <CACvgo52A2Cb3RLRZdGopcbUb6424XnVJkU2PYC0sJGFie4ueyg@mail.gmail.com>
Subject: Re: [PATCH 01/26] drm/irq: Don't check for DRIVER_HAVE_IRQ in drm_irq_(un)install
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
        "open list:VIRTIO GPU DRIVER" 
        <virtualization@lists.linux-foundation.org>,
        linux-renesas-soc@vger.kernel.org,
        spice-devel@lists.freedesktop.org,
        linux-amlogic@lists.infradead.org, freedreno@lists.freedesktop.org,
        LAKML <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 24 Jan 2019 at 16:58, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> If a non-legacy driver calls these it's valid to assume there is
> interrupt support. The flag is really only needed for legacy drivers.

... legacy drivers which issue the IRQ via the DRM_IOCTL_CONTROL legacy IOCTL.

At a later stage, we might as well add LEGACY to the name:
DRIVER_LEGACY_HAVE_IRQ?


>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c      | 2 +-
>  drivers/gpu/drm/arm/hdlcd_drv.c              | 2 +-
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c | 2 +-
>  drivers/gpu/drm/drm_irq.c                    | 6 ------
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c    | 2 +-
>  drivers/gpu/drm/gma500/psb_drv.c             | 2 +-
>  drivers/gpu/drm/i915/i915_drv.c              | 2 +-
>  drivers/gpu/drm/meson/meson_drv.c            | 2 +-
>  drivers/gpu/drm/msm/msm_drv.c                | 3 +--
>  drivers/gpu/drm/mxsfb/mxsfb_drv.c            | 3 +--
>  drivers/gpu/drm/qxl/qxl_drv.c                | 2 +-
>  drivers/gpu/drm/radeon/radeon_drv.c          | 2 +-
>  drivers/gpu/drm/shmobile/shmob_drm_drv.c     | 2 +-
>  drivers/gpu/drm/tilcdc/tilcdc_drv.c          | 2 +-
>  drivers/gpu/drm/vc4/vc4_drv.c                | 1 -
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c          | 2 +-
>  drivers/staging/vboxvideo/vbox_drv.c         | 2 +-

Local grep shows one more non-legacy entry in
drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c

With that file addressed and trivial comment additions, patches: 1, 2,
3 and 26 are
Reviewed-by: Emil Velikov <emil.velikov@collabora.com>

HTH
Emil
