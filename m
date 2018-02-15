Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:36461 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1032091AbeBOAJi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Feb 2018 19:09:38 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 3/3] drm: rcar-du: lvds: Refactor LVDS startup
Date: Thu, 15 Feb 2018 02:10:11 +0200
Message-ID: <3774396.180UE1lcPs@avalon>
In-Reply-To: <559de74c-867e-a8f5-f23d-03b564da1f6e@cogentembedded.com>
References: <20180214181348.16258-1-laurent.pinchart+renesas@ideasonboard.com> <20180214181348.16258-4-laurent.pinchart+renesas@ideasonboard.com> <559de74c-867e-a8f5-f23d-03b564da1f6e@cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

On Wednesday, 14 February 2018 20:39:59 EET Sergei Shtylyov wrote:
> On 02/14/2018 09:13 PM, Laurent Pinchart wrote:
> > From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> > 
> > After the recent corrections to the R-Car gen2/3 LVDS startup code,
> > already similar enough at their ends rcar_lvds_enable_gen{2|3}() started
> > asking for a merge and it's becoming actually necessary with the addition
> > of the R-Car V3M (R8A77970) support -- this gen3 SoC has gen2-like
> > LVDPLLCR layout.
> > 
> > Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > Tested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> Well, your role wasn't limited to reviewning/testing, you'd clearly did
> some editing too... thus I was expecting to see some changelog.

My bad, it was an oversight. I'll add the following.

[Set the LVDS mode and input before turning channels on]
[Rebased, coding style changes]

> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>
> 
> Your variant of my patch looks good otherwise. :-)

Thank you :-) I've queued it in my tree.

-- 
Regards,

Laurent Pinchart
