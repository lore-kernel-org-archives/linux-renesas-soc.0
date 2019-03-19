Return-Path: <SRS0=zxXW=RW=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D663C43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Mar 2019 10:12:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DB80020828
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Mar 2019 10:12:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Z/psTm9Y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727521AbfCSKMq (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 19 Mar 2019 06:12:46 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:47784 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727017AbfCSKMq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Mar 2019 06:12:46 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BEAAF33A;
        Tue, 19 Mar 2019 11:12:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1552990364;
        bh=T110Kze3rVTxp1gnk7MkkWPVRtgeB6clY2uvfabqLns=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Z/psTm9Y0rUPds/3DetpImYjzWzqW6nJw1AMtfnomjNRQ25dmEf7Yb7pNmtVFhjac
         1c2gfBsbYs1kcYrBV5V8WAKrUkmJ5LxpbcuWFMcv3mfxui+pH8xg6WWVHYooT8aTGx
         ViyhUp/xoMKdRan4uyQn00iqmcVL9uZfnqaG62Pk=
Date:   Tue, 19 Mar 2019 12:12:37 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [GIT PULL FOR renesas-drivers] du/for-renesas-drivers
Message-ID: <20190319101237.GD4765@pendragon.ideasonboard.com>
References: <20190317200953.16323-1-kieran.bingham+renesas@ideasonboard.com>
 <CAMuHMdUKk=kU-kGBPg6jHkgd2ba1tiCzVLjwvfxfhMWq8GqWWg@mail.gmail.com>
 <CAMuHMdVFR3G394exJAgXmPxndsNNeRkfQF5GQdbwFMjk2Kbrfg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdVFR3G394exJAgXmPxndsNNeRkfQF5GQdbwFMjk2Kbrfg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Tue, Mar 19, 2019 at 10:04:02AM +0100, Geert Uytterhoeven wrote:
> On Mon, Mar 18, 2019 at 9:14 AM Geert Uytterhoeven wrote:
> > On Sun, Mar 17, 2019 at 9:09 PM Kieran Bingham wrote:
> >> Please consider including this release in renesas-drivers.
> >
> > Thanks for your pull request!
> >
> >> The following changes since commit 0f1d37e65a59e9db33ab85f6e2c9784768ef80f4:
> >>
> >>   Merge branch 'drm-next-5.1' of git://people.freedesktop.org/~agd5f/linux into drm-next (2019-03-14 12:15:02 +1000)
> >>
> >> are available in the Git repository at:
> >>
> >>   git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git du/for-renesas-drivers
> >>
> >> for you to fetch changes up to 99deb47fa63bb9fc7bd691e358fea1c5bccc1da2:
> >>
> >>   drm: rcar-du: Add group hooks for atomic-commit (2019-03-17 19:29:37 +0000)
> >
> > This has a merge conflict in drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> > with Laurent's pull request for
> > git://linuxtv.org/pinchartl/media.git drm/du/lvds/dual-link~2
> >
> >> Laurent Pinchart (1):
> >>       drm: rcar-du: Support panels connected directly to the DPAD outputs
> >
> > Both branches contain the above commit, but with different commit IDs,
> > and Laurent's "drm: rcar-du: Skip LVDS1 output on Gen3 when using
> > dual-link LVDS mode" builds on top of that.
> 
> JFYI, I found a third copy in Laurent's drm/du/next branch.

It's all work in progress I'm afraid, so this doesn't surprise me. I'll
send a pull request to Dave soon, all this will be fixed.

> > Nothing I can't handle, though.
> 
> Idem ditto.

-- 
Regards,

Laurent Pinchart
