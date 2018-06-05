Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:56150 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752305AbeFEUYY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Jun 2018 16:24:24 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] dt-bindings: display: renesas: du: document R8A77980 bindings
Date: Tue, 05 Jun 2018 23:24:35 +0300
Message-ID: <4427404.jlkXCGIJ77@avalon>
In-Reply-To: <50730759-dfda-12c5-a7f3-4e8a9b7b1eb9@cogentembedded.com>
References: <2a775652-604c-6379-b807-19979f164f84@cogentembedded.com> <3434502.pBJZTsWR88@avalon> <50730759-dfda-12c5-a7f3-4e8a9b7b1eb9@cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

On Tuesday, 5 June 2018 22:49:57 EEST Sergei Shtylyov wrote:
> On 06/05/2018 10:16 PM, Laurent Pinchart wrote:
> >>>> Document the R-Car V3H (R8A77980) SoC in the R-Car DU bindings; the DU
> >>>> hardware seems the same as in the R-Car V3M (R8A77970).
> >>> 
> >>> How about "the DU hardware has the same topology as in the R-Car V3M
> >>> (R8A77970)" ? "seems" sounds like we're very unsure :-)
> >> 
> >> That's probably better, indeed.
> >> 
> >>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> >>>> 
> >>>> ---
> >>>> The patch is against the 'drm-next' branch of David Airlie's
> >>>> 'linux.git' repo.
> >>> 
> >>> Then you might want to switch to git://anongit.freedesktop.org/drm/drm
> >>> :-)
> >> 
> >> No, the corresponding MAINTAINERS records don't include
> >> drivers/gpu/drm/rcar-du/ or worse yet, the DU bindings. :-)
> 
> Well, there is still no corresponding record, actually...
> 
> > My point is that Dave's tree has moved.
> 
> How am I supposed to learn about it, from gossips? :-)

I learnt it the hard way when a pull request I had prepared against the old 
tree conflicted (at compile time) with patches merged in the new tree. This 
broke the build, and I learnt about the new tree from a kbuild bot report.

> >> Seriously, I thought you've done a patch to remove your dead 'fbdev' repo
> >> months ago and IO'm still seeing it listed... :-/
> > 
> > I'll address that now.
> 
> TIA.
> 
> >>> Apart from that,
> >>> 
> >>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>> 
> >>> If you agree with the small change to the commit message I'll fix the
> >>> conflict locally, there's no need to resubmit.
> >> 
> >> I do agree, except I don't know what conflict you mean.
> >> 
> >> [...]
> > 
> > I mean the conflict with
> > 
> > commit dc8142901befabea974393d49b803f131243feb4
> > Author: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > Date:   Thu Apr 26 17:53:31 2018 +0100
> > 
> >     dt-bindings: display: renesas: du: Document the r8a77965 bindings
> > 
> > that is present in Dave's new tree.
> 
> Ah... TIA again. :-)

-- 
Regards,

Laurent Pinchart
