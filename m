Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:55919 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753188AbeAOIZb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Jan 2018 03:25:31 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Simon Horman <horms@verge.net.au>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 05/10] ARM: dts: porter: Fix HDMI output routing
Date: Mon, 15 Jan 2018 10:25:34 +0200
Message-ID: <2396985.RUYR8QAblK@avalon>
In-Reply-To: <20180115075602.gfstfimbcwh6uner@verge.net.au>
References: <20180112005858.26472-1-laurent.pinchart+renesas@ideasonboard.com> <20180112005858.26472-6-laurent.pinchart+renesas@ideasonboard.com> <20180115075602.gfstfimbcwh6uner@verge.net.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Monday, 15 January 2018 09:56:03 EET Simon Horman wrote:
> On Fri, Jan 12, 2018 at 02:58:53AM +0200, Laurent Pinchart wrote:
> > The HDMI encoder is connected to the RGB output of the DU, which is
> > port@0, not port@1. Fix the incorrect DT description.
> > 
> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>
> 
> Should this have the following tag?
> 
> Fixes: c5af8a4248d3 ("ARM: dts: porter: add DU DT support")

That would make sense, yes.

> If so, is it a fix to apply for v4.15 or a more regular patch
> to apply for v4.16?

I believe we can wait for v4.16. HDMI output works on Porter at the moment due 
to a separate bug in the DU driver that clones outputs by default when it 
shouldn't. There's however no harm in backporting the patch to stable series 
if desired, but it's not required.

-- 
Regards,

Laurent Pinchart
