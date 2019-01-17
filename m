Return-Path: <SRS0=aD2s=PZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C333C43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 16:45:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DDE1C20859
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 16:45:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="XpIqV969"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728515AbfAQQpr (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 17 Jan 2019 11:45:47 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:42496 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728848AbfAQQpr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Jan 2019 11:45:47 -0500
Received: by mail-ed1-f68.google.com with SMTP id y20so8852455edw.9
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Jan 2019 08:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=G44vzWv8v93dtiLWgCKhFpfQv+w1VJ2+/PDzCiGfXJg=;
        b=XpIqV969SvphAZ4y55B9XsKLgH5TOJSk0+trqqG8gDbFtpm4Avk64xaCR7WNFFsl5S
         JMleF9lJImURSKKsp62Ic+TwgHzTXVrtXdZPwnZwJH3YhEsrURl89JNSvJGmelZGHx2G
         5Z521lKbdU6z8w08x0T017vudJpBi/+iK7KBk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=G44vzWv8v93dtiLWgCKhFpfQv+w1VJ2+/PDzCiGfXJg=;
        b=LZ1fuZP24W0Uk7dmLvrPvY2/Tt4/FJfFIlMe9w3mVYJw7fTid1OxC/5ps9MJkNmjfO
         fe4/u1FRubdB3v4rRYAIePrDcF74l3DkGv3gJI8xknMrIswmhyEg490Q52+SomrH4h77
         o5PqN5my/SaVJL2lTj8yhJYqi1QQYsUeZhgq+4476GF+CA4KPluhWJIowGyMeHVwYDbj
         reZjIR9/ZqXeg2Sk3i+snBKj2vKp31ZvHU6duEEGGLVntjNHBLZl90CrlmwlRG8fiM0v
         hkDpE2ENPUka+Ie6BSU/A7Uky/zfPKe+J7vxCGZjHZ1OztW9EFoqxUbslf0B/0QGwwsp
         jSmw==
X-Gm-Message-State: AJcUukfxavZ+srY2KXdl1WyWYjYOOWLKybBiFd4sE5CnFDivO0QXJgsl
        2Dpah09LveWW03LMpuFA1WrziQ==
X-Google-Smtp-Source: ALg8bN48Ho/mM8Q7a3cuSaUxZAOeetJgITKLeb5lpfoqSNcRkQ2JHWoWIcrUFnFvvuK4Y1nyvIf4ig==
X-Received: by 2002:a17:906:3105:: with SMTP id 5-v6mr11397796ejx.122.1547743544951;
        Thu, 17 Jan 2019 08:45:44 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
        by smtp.gmail.com with ESMTPSA id g37sm6730501edb.85.2019.01.17.08.45.43
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Jan 2019 08:45:44 -0800 (PST)
Date:   Thu, 17 Jan 2019 17:45:41 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Jani Nikula <jani.nikula@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
        CK Hu <ck.hu@mediatek.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        linux-arm-kernel@lists.infradead.org,
        virtualization@lists.linux-foundation.org,
        etnaviv@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        intel-gfx@lists.freedesktop.org,
        linux-mediatek@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        spice-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-tegra@vger.kernel.org, xen-devel@lists.xen.org
Subject: Re: [PATCH] drm: Split out drm_probe_helper.h
Message-ID: <20190117164541.GE3271@phenom.ffwll.local>
References: <20190116163442.12622-1-daniel.vetter@ffwll.ch>
 <20190116181018.GA27364@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190116181018.GA27364@ravnborg.org>
X-Operating-System: Linux phenom 4.19.0-1-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jan 16, 2019 at 07:10:18PM +0100, Sam Ravnborg wrote:
> Hi Daniel.
> 
> > v5: Actually try to sort them, and while at it, sort all the ones I
> > touch.
> 
> Applied this variant on top of drm-misc and did a build test.
> Looked good for ia64, x86 and alpha.
> 
> Took a closer look at the changes to atmel_hlcd - and they looked OK.
> 
> But I noticed that atmel_hlcdc uses only drm_kms_helper_poll_init() and
> drm_kms_helper_poll_fini().
> But there are no hits on DRM_CONNECTOR_POLL - so I think we maybe
> have a driver here where we have plugged the drm_poll infrastructure,
> but it is not in use.
> 
> >  include/drm/drm_crtc_helper.h                 | 16 -----------
> 
> The list of include files in this file could be dropped and replaced by:
> struct drm_connector;
> struct drm_device;
> struct drm_display_mode;
> struct drm_encoder;
> struct drm_framebuffer;
> struct drm_mode_set;
> struct drm_modeset_acquire_ctx;
> 
> I tried to do so on top of your patch.
> But there were too many build errros and I somehow lost the motivation.

Yeah the drm_crtc_helper.h header is a bit the miniature drmP.h for legacy
kms drivers. Just removing it from all the atomic drivers caused lots of
fallout, I expect even more if you entirely remove the includes it has.
Maybe a todo, care to pls create that patch since it's your idea?
-Daniel

> 
> 
> >  include/drm/drm_probe_helper.h                | 27 +++++++++++++++++++
> This on the other hand is fine - as expected as this is a new file.
> 
> But the above is just some random comments so:
> 
> Acked-by: Sam Ravnborg <sam@ravnborg.org>

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
