Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:51418 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1424039AbeBOQgz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Feb 2018 11:36:55 -0500
Date: Thu, 15 Feb 2018 17:36:51 +0100
From: Simon Horman <horms@verge.net.au>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Kieran Bingham <kbingham@kernel.org>,
        linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH v3 0/5] arm64: dts: renesas: r8a77995: Add VSP support
Message-ID: <20180215163651.ecp5nemhjmrpqb2i@verge.net.au>
References: <1518602108-1724-1-git-send-email-kbingham@kernel.org>
 <567eee0d-0f2a-cb19-4d75-812f640e7f27@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <567eee0d-0f2a-cb19-4d75-812f640e7f27@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Feb 15, 2018 at 04:24:46PM +0000, Kieran Bingham wrote:
> Hi Simon,
> 
> On 14/02/18 09:55, Kieran Bingham wrote:
> > From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > 
> > The r8a77995-d3 platform supports 3 VSP instances. One VSPBS can be used
> > as a dual-input image blender, while two VSPD instances can be utilised as
> > part of a display (DU) pipeline.
> > 
> > Add support for these, along with their required FCPV nodes.
> > 
> > During review, Laurent noticed that the r8a7795 and r8a7796 were not mapping
> > enough register space to handle RPFs with CLUT modules.
> > 
> > The last three patches fix this issue.
> > 
> > v2:
> >  - Merge FCPV nodes to a single patch
> >  - Merge VSP nodes to a single patch
> >  - Fix VSP register map size
> >  - Add fixes for r8a7795 and r8a7796
> > 
> > v3:
> >  - Fix VSBB register map size
> >  - Add r8a7795-es1 vspd3
> 
> *This* is the correct version of this series.

Sorry about that. I've dropped the patch I had locally queued up from
an earlier series.
