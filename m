Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:52811 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965891AbeBMWIH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Feb 2018 17:08:07 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kbingham@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 0/4] arm64: dts: renesas: r8a77995: Add VSP support
Date: Wed, 14 Feb 2018 00:08:39 +0200
Message-ID: <2529460.tBXLBqH5B5@avalon>
In-Reply-To: <1518550237-16753-1-git-send-email-kbingham@kernel.org>
References: <1518550237-16753-1-git-send-email-kbingham@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

Thank you for the patches.

On Tuesday, 13 February 2018 21:30:33 EET Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> The r8a77995-d3 platform supports 3 VSP instances. One VSPBS can be used
> as a dual-input image blender, while two VSPD instances can be utilised as
> part of a display (DU) pipeline.
> 
> Add support for these, along with their required FCPV nodes.
> 
> During review, Laurent noticed that the r8a7795 and r8a7796 were not mapping
> enough register space to handle RPFs with CLUT modules.
> 
> The last two patches fix this issue.
> 
> v2:
>  - Merge FCPV nodes to a single patch
>  - Merge VSP nodes to a single patch
>  - Fix VSP register map size
>  - Add fixes for r8a7795 and r8a7796
> 
> Kieran Bingham (4):
>   arm64: dts: renesas: r8a77995: add FCPV nodes
>   arm64: dts: renesas: r8a77995: add VSP instances
>   arm64: dts: renesas: r8a7795: Fix register mappings on VSPs

Do you plan to also address r8a7795-es1.dtsi ?

>   arm64: dts: renesas: r8a7796: Fix register mappings on VSPs
> 
>  arch/arm64/boot/dts/renesas/r8a7795.dtsi  |  6 ++--
>  arch/arm64/boot/dts/renesas/r8a7796.dtsi  |  6 ++--
>  arch/arm64/boot/dts/renesas/r8a77995.dtsi | 57 ++++++++++++++++++++++++++++
>  3 files changed, 63 insertions(+), 6 deletions(-)

-- 
Regards,

Laurent Pinchart
