Return-Path: <SRS0=drmD=QA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7455C282C3
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jan 2019 12:39:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 68BFB218AD
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jan 2019 12:39:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="Xs+sILNw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727808AbfAXMjr (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 24 Jan 2019 07:39:47 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:36823 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727562AbfAXMjq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Jan 2019 07:39:46 -0500
Received: by mail-ed1-f65.google.com with SMTP id f23so4456676edb.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Jan 2019 04:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=c1mNI5T4m20SpCB9OCXSFUEgo9wAKUIT7bb59B02sTo=;
        b=Xs+sILNwFnhsMsInizUcnZQT7V6t07Wg+2m5qm8T9+gfHD8JMXDGyRdXasDYGeBRu5
         jfY5eN5cBRzg5Km3phmLAArdGGj70YK8XC66ga0dLHTFYJi0rxT7RKfW0wqm/MaKA5Oi
         FmnqtX1mKk9fgUoAmJF4yfX9mLYc+pQLAInls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=c1mNI5T4m20SpCB9OCXSFUEgo9wAKUIT7bb59B02sTo=;
        b=V+cvZnihAhnipSpUF1uJbVBbxTxRKrT0jZDA++AzcESxkxXIqxiPTUk0/AxVV8kCRO
         GHEb3szgC/KdLDA5D1voknRdnwwhVXGThDn7K7gNYV7v1GExv+Pi/KEmhNZZxC+gx9F8
         YLC18xaV6QZpa0brDlJ+OGSP7KvgmuwfFGKvqtRCGXY2XbsitPyISClxr8fpv/8ArJic
         lbAUkpLgNe7iOthHyrGaI/KLA/oqqCcP6vFULKEYhTmLeT4n7mdYVtJCz+ZYd+WvUa7k
         ixArUjUkVzBh6if3WfrDtYdVQ2ZqUKe8wy2OjayAsaC2LFhS1Du9QCSY5Ht7S/K1zEX9
         YvYA==
X-Gm-Message-State: AJcUukdrUlMDowtrmv6r2xD4GqBU1YvRSeGZfWSY4C1kdQI9uSTMs42o
        sJHkZ9EmLH1N83Akb4Ex5v5zNw==
X-Google-Smtp-Source: ALg8bN6QWswlzohggrLEqf84UNCuXug1KlzboVlv+Uh2BRu5bdykRE7vK7zKCjeeWxzlybhwkDdnrg==
X-Received: by 2002:a17:906:3281:: with SMTP id 1-v6mr5845104ejw.103.1548333585024;
        Thu, 24 Jan 2019 04:39:45 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
        by smtp.gmail.com with ESMTPSA id x30sm10994617edd.30.2019.01.24.04.39.43
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Jan 2019 04:39:44 -0800 (PST)
Date:   Thu, 24 Jan 2019 13:39:41 +0100
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
Message-ID: <20190124123941.GW3271@phenom.ffwll.local>
References: <20190116181018.GA27364@ravnborg.org>
 <20190117210334.13234-1-daniel.vetter@ffwll.ch>
 <20190123170015.GA23138@ravnborg.org>
 <20190124094646.GR3271@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190124094646.GR3271@phenom.ffwll.local>
X-Operating-System: Linux phenom 4.19.0-1-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jan 24, 2019 at 10:46:47AM +0100, Daniel Vetter wrote:
> On Wed, Jan 23, 2019 at 06:00:15PM +0100, Sam Ravnborg wrote:
> > Hi Daniel.
> > 
> > On Thu, Jan 17, 2019 at 10:03:34PM +0100, Daniel Vetter wrote:
> > > Having the probe helper stuff (which pretty much everyone needs) in
> > > the drm_crtc_helper.h file (which atomic drivers should never need) is
> > > confusing. Split them out.
> > > 
> > > To make sure I actually achieved the goal here I went through all
> > > drivers. And indeed, all atomic drivers are now free of
> > > drm_crtc_helper.h includes.
> > 
> > How are the plans to get this patchset merged?
> > There were dependencies on onging drmP.h removal in i915 IIRC?
> > I guess my "Minimize drmP.h dependencies" patch-set also have a role in this.
> 
> Working on it, a pull request got lost. I originally wanted to get this
> all resolved this week, probably going to be next week now :-(

We're lucky, all sorted now & patch merged. I'm also merging your series,
correctly interleaved.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
