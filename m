Return-Path: <SRS0=sDbg=P5=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2149FC282DB
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Jan 2019 10:18:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E76F02085A
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Jan 2019 10:18:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="im6jpF13"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725879AbfAUKSb (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 21 Jan 2019 05:18:31 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:33635 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726530AbfAUKSb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jan 2019 05:18:31 -0500
Received: by mail-ed1-f66.google.com with SMTP id p6so16180542eds.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Jan 2019 02:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/L7t6WlnyiZnK+tB77LMSTf3S73gisKWz/lu8tskLxg=;
        b=im6jpF13P+yzdCqOy1ZnOUWPz7ReSMkJQaklarwNkqL+vOtVeDBCOee1YzdeNgIQ0E
         qsRXhMNnosC8dukYYaWWSazLU4RleKXrGRSX9LyiMfzfSKdTjjYqoPNBtkXm/9nVxSv7
         bZ/Awmd2sLc0C7lFzls+LYrrmF1bo2HmCk1B4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=/L7t6WlnyiZnK+tB77LMSTf3S73gisKWz/lu8tskLxg=;
        b=Ix2jfUK8bdCdvm7bPKOYjX+wPYKLhc81+Z7z74bervklNdXNNafPHKx98VqbdhxF3k
         r1i/kTo6BnX/YzOJ3Tl0yepwETyWhz7VZacB+3Y+4rCC2u0i+v2I/0PkBcezLev6BhSN
         iav+cPz0kxmkiBgSI6cTL3yCyjl4fQy13pVf9HPBjkJq5VsW6ese5ggavWpGc7fxsi1M
         HLU93Kf1RFmgrMspt29cD76RdCj/VhklKF2pSqovEn9dBQz8wuJAtuy8h6E377DzuubJ
         0cmbVTYgrHOx15LK63ubaZxVA9TA1qX3P4T68IL0MDjomAKqrBRSnZ9AxM0pbk7qBA5K
         RhwQ==
X-Gm-Message-State: AJcUuker32nvG0i0btmOxsYmOgqoIEwXRWQovMc5YMHfbDhQbYr+716Z
        9/fpbXXSadwaEITQhGAyi6naJw==
X-Google-Smtp-Source: ALg8bN427M9lrSaya4WJSLySxlOUq3QoG/hX4fHGWfWnWGTADVebMFs4IG/X2vdceL1q0GKctqDkFA==
X-Received: by 2002:a17:906:1915:: with SMTP id a21-v6mr24212402eje.101.1548065909702;
        Mon, 21 Jan 2019 02:18:29 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
        by smtp.gmail.com with ESMTPSA id j4sm8893300edh.69.2019.01.21.02.18.28
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Jan 2019 02:18:28 -0800 (PST)
Date:   Mon, 21 Jan 2019 11:18:26 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH/RFC] drm: Remove unused Renesas SH Mobile DRM driver
Message-ID: <20190121101826.GT3271@phenom.ffwll.local>
References: <20190118162258.14592-1-geert+renesas@glider.be>
 <20190121093506.GQ3271@phenom.ffwll.local>
 <CAMuHMdUzhPg_sR93J2jADS-x-NFofPJR=d6a6qpt50mhyhU-xQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUzhPg_sR93J2jADS-x-NFofPJR=d6a6qpt50mhyhU-xQ@mail.gmail.com>
X-Operating-System: Linux phenom 4.19.0-1-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jan 21, 2019 at 11:03:44AM +0100, Geert Uytterhoeven wrote:
> Hi Daniel,
> 
> On Mon, Jan 21, 2019 at 10:35 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > On Fri, Jan 18, 2019 at 05:22:58PM +0100, Geert Uytterhoeven wrote:
> > > Since its incarnation in v3.7 almost 7 years ago, no users of the SH
> > > Mobile DRM driver have appeared.
> > >
> > > Hence remove the driver.  It can be resurrected from git history,
> > > if/when needed.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > I'd prefer removing the fbdev variant tbh ...
> 
> I understand ;-)
> 
> But sh_mobile_lcdc_fb is used on 5 legacy SuperH platforms, and 1 ARM
> platform. At least the latter is working fine.
> 
> > Not sure why exactly the switch never happened.
> 
> Me neither.  I^HGoogle can't even find posted patches of board integration.
> 
> Note that both drivers lack DT support, which would be very desirable on
> ARM, as graphics is the single remaining working driver on the Atmark
> Techno Armadillo 800 EVA board not using DT.

Ah I wondered why the drm driver isn't just automatically picked up in
today's neat world of DT (if you enable it in .config instead of the fbdev
one). It's not even using DT yet :-/
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
