Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:58601 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754769AbdGKXUm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Jul 2017 19:20:42 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Simon Horman <horms@verge.net.au>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 0/2] R-Car H3 ES2.0 Salvator-X: Enable DU support in DT
Date: Wed, 12 Jul 2017 02:20:43 +0300
Message-ID: <6134935.kQPbd6tkWq@avalon>
In-Reply-To: <20170711091616.GJ4517@verge.net.au>
References: <20170626162930.30240-1-laurent.pinchart+renesas@ideasonboard.com> <1672780.uyvZoTTfMK@avalon> <20170711091616.GJ4517@verge.net.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Tuesday 11 Jul 2017 11:16:17 Simon Horman wrote:
> On Mon, Jul 10, 2017 at 04:31:38PM +0300, Laurent Pinchart wrote:
> > On Monday 26 Jun 2017 19:29:28 Laurent Pinchart wrote:
> >> Hello,
> >> 
> >> This patch series enable DU support in DT for the R-Car H3 ES2.0
> >> Salvator-X board. Patch 1/2 extends the DT bindings as needed, and patch
> >> 2/2 then enables DU in the SoC DT.
> >> 
> >> The patches are based on top of Simon's arm64-dt-for-v4.14 branch.
> >> 
> >> Compared to v1
> >> 
> >> - the VSP DT bindings have been extended in patch 1/2
> >> - patch 2/2 has been updated accordingly
> >> - patch "arm64: dts: r8a7795: salvator-x: Unify DU node between ES1.x
> >>   and ES2.0" has been dropped
> >> 
> >> Laurent Pinchart (2):
> >>   drm: rcar-du: Add a VSP channel index to the vsps DT property
> >>   arm64: dts: r8a7795: Add support for the DU
> >>  
> >>  .../devicetree/bindings/display/renesas,du.txt     | 51 ++++++++-------
> >>  arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi       |  1 -
> >>  arch/arm64/boot/dts/renesas/r8a7795.dtsi           |  2 +
> >>  3 files changed, 32 insertions(+), 22 deletions(-)
> > 
> > Hi Simon,
> > 
> > Could you please pick this series for v4.14 ? I believe it has received
> > the necessary acks.
> 
> Hi Laurent,
> 
> sure, both patches applied for v4.14.

It looks like you've picked v2 instead of v2.1 for patch 2/2 :-/ Is it 
possible to fix that ?

-- 
Regards,

Laurent Pinchart
