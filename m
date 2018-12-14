Return-Path: <SRS0=qJci=OX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7631C67839
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 14 Dec 2018 08:05:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8F49D20866
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 14 Dec 2018 08:05:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fPF7tNdx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F49D20866
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727604AbeLNIF6 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 14 Dec 2018 03:05:58 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:48950 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726520AbeLNIF5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Dec 2018 03:05:57 -0500
Received: from avalon.localnet (dfj612ybrt5fhg77mgycy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:2e86:4862:ef6a:2804])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2577A549;
        Fri, 14 Dec 2018 09:05:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1544774755;
        bh=++hnR/4DZRVo6l2Zhnl01j9X8ac9O0Jg52ynw9ErNqQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fPF7tNdx8580/BlzX2HU0Y9XE+X4rkZognGeSwlzI4ttDpYid2L9SjcPuyX04yUvK
         i/UtV6qQ5zDWOAJQSEwxsub3CRWbe2GRe0qWdKZJQKnzW7xdG8eqQTXAZf72vK0DZ3
         sJSpCN0eKUlLQgIO0PVEvlqa8a5yw7GIiJ1dOavU=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     kieran.bingham+renesas@ideasonboard.com
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] drm: rcar-du: Convert live DT patches to sugar syntax
Date:   Fri, 14 Dec 2018 10:06:42 +0200
Message-ID: <2994853.jny44fDVje@avalon>
Organization: Ideas on Board Oy
In-Reply-To: <a11c8c6f-533d-df5f-85df-694c7441f579@ideasonboard.com>
References: <20181129105850.10953-1-geert+renesas@glider.be> <1754701.jL1l6Xu3AY@avalon> <a11c8c6f-533d-df5f-85df-694c7441f579@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

On Friday, 14 December 2018 09:39:55 EET Kieran Bingham wrote:
> On 29/11/2018 12:43, Laurent Pinchart wrote:
> > On Thursday, 29 November 2018 12:58:50 EET Geert Uytterhoeven wrote:
> >> Using overlay sugar syntax makes the DTS files easier to read (and
> >> write).
> >> 
> >> Overlay syntactic sugar for generating target-path fragments is
> >> supported by the version of dtc supplied with the kernel since commit
> >> 50aafd60898a8b3e ("scripts/dtc: Update to upstream version
> >> v1.4.6-21-g84e414b0b5bc").
> >> 
> >> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >> ---
> >> The generated dtbs before/after are identical.
> > 
> > I was going to ask whether you had tested the patch, but this should be
> > good enough :-)
> > 
> > The result is nicer to read, thanks.
> 
> I agree!
> 
> FWIW:
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > and taken in my tree.
> 
> I was hoping to reference this patch - but I can't see it in a tree
> anywhere.
> 
> Is there a branch/repo that this is available in now?

I've pushed the pending DRM patches to

	git://linuxtv.org/pinchartl/media.git drm/du/next

-- 
Regards,

Laurent Pinchart



