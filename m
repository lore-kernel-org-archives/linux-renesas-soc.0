Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:58466 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726826AbeIQO6K (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Sep 2018 10:58:10 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>
Subject: Re: [GIT PULL FOR renesas-drivers] D3 and E3 HDMI output support
Date: Mon, 17 Sep 2018 12:31:49 +0300
Message-ID: <2909393.cgpMFW7bCi@avalon>
In-Reply-To: <CAMuHMdV0vqNgbqeX_Wmo+2M=DebrusVeu8CwatDKYK0dpNDLLA@mail.gmail.com>
References: <1562156.yf6H1RoyJV@avalon> <CAMuHMdV0vqNgbqeX_Wmo+2M=DebrusVeu8CwatDKYK0dpNDLLA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

Simon, there's a question for your below.

On Monday, 17 September 2018 10:53:33 EEST Geert Uytterhoeven wrote:
> On Sat, Sep 15, 2018 at 4:44 PM Laurent Pinchart wrote:
> > The following changes since commit 
6e1637c91742570ff873433ed27227933b792af4:
> >   drm: rcar-du: Remove packed VYUY support (2018-09-15 17:28:34 +0300)
> > 
> > are available in the Git repository at:
> >   git://linuxtv.org/pinchartl/media.git for/renesas-drivers
> > 
> > for you to fetch changes up to d7e0cb47e1d06d3033812281fe98528d1713ec16:
> >   Merge tag 'drm-du-dt-lvds-pll-v1-20180915' into for/renesas-drivers
> > 
> > (2018-09-15 17:38:05 +0300)
> > 
> > Please note that the for/renesas-drivers branch is a merge of a code and a
> > DT branch (available under the drm-du-lvds-pll-v1-20180915 and
> > drm-du-dt-lvds- pll-v1-20180915 tags respectively). Those two branches
> > have different bases (drm-next from Dave's tree and devel from Simon's
> > tree respectively), I've thus edited the diffstat below manually.
> 
> Thanks for your pull request!
> 
> This causes merge conflicts with next-20180913 in
> 
>     arch/arm64/boot/dts/renesas/r8a774a1.dtsi
>     arch/arm64/boot/dts/renesas/r8a77990.dtsi
>     arch/arm64/boot/dts/renesas/r8a77995-draak.dts

What would be a better base than Simon's devel branch for DT patches ?

> and with Kieran's du/2018q3 in
> 
>     drivers/gpu/drm/rcar-du/rcar_du_crtc.c
>     drivers/gpu/drm/rcar-du/rcar_du_drv.h
>     drivers/gpu/drm/rcar-du/rcar_lvds.c
> 
> While the DT conflicts may not be unavoidedable, please coordinate with
> Kieran for the rcar-du conflicts.

Apart from the topmost patch ("drm: rcar-du: Revert "drm: rcar-du: Use 
__drm_atomic_helper_plane_reset instead of copying the logic"") which Kieran's 
added due the last minute discovery of a 4.19-rc regression, Kieran's branch 
is identical in content with the base of my pull request. The commit IDs are 
not the same though, as I've since then rebased my tree to prepare it for 
upstream, but only one commit message has changed, without touching the code 
itself.

git seems not to be doing a great job here. If you merge my drm/du/next branch 
into Kieran's du/2018q3 branch, and then merge my for/renesas-drivers branch, 
it will all merge cleanly (drm/du/next is included in for/renesas-drivers). 
However, merging for/renesas-drivers results in merge conflicts.

-- 
Regards,

Laurent Pinchart
