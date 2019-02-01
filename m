Return-Path: <SRS0=i8oE=QI=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B3F4C282D8
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Feb 2019 15:16:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 29A0121872
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Feb 2019 15:16:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CroUqSah"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729818AbfBAPQ3 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 1 Feb 2019 10:16:29 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:40182 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728326AbfBAPQ3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Feb 2019 10:16:29 -0500
Received: from pendragon.ideasonboard.com (85-76-34-136-nat.elisa-mobile.fi [85.76.34.136])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 449A54F7;
        Fri,  1 Feb 2019 16:16:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1549034187;
        bh=IFVPh3R5RY5uY0RBTggpyS0tKeZfh3iul5fss0YwXqM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CroUqSahpnH7l10To2X9/BmmGqupB8Hh0TTPh9Wm7Bsq/wCL7zOCA9fa6z7jeuxTe
         XUGpYQZAF3VdD9mXLemcD/yOEp0mFKcG+BOSzBcjw3ECTvYUp3yg27PIZ6kBMj/5I+
         kCknONsYpDtpduL42P8H9s65jcGpCK2zQlUfcEy0=
Date:   Fri, 1 Feb 2019 17:16:24 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: display: renesas: lvds: Document
 r8a7744 bindings
Message-ID: <20190201151624.GB4359@pendragon.ideasonboard.com>
References: <1548170749-12773-1-git-send-email-biju.das@bp.renesas.com>
 <1548170749-12773-3-git-send-email-biju.das@bp.renesas.com>
 <20190122154428.GE11461@pendragon.ideasonboard.com>
 <20190130163910.GA29033@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190130163910.GA29033@bogus>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

On Wed, Jan 30, 2019 at 10:39:10AM -0600, Rob Herring wrote:
> On Tue, Jan 22, 2019 at 05:44:28PM +0200, Laurent Pinchart wrote:
> > On Tue, Jan 22, 2019 at 03:25:46PM +0000, Biju Das wrote:
> >> Document the RZ/G1N (R8A7744) LVDS bindings.
> >> 
> >> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > and taken in my tree.
> 
> But not in linux-next? Or you did some $subject fixups which breaks my 
> detecting that. :(

My tree isn't part of linux-next. I'll send a pull reques to Dave very
soon.

-- 
Regards,

Laurent Pinchart
