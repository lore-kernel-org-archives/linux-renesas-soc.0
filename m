Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:50757 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751264AbeCLJHe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Mar 2018 05:07:34 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20180312090732euoutp014b0f1b0d71bd0e10fa0011c8ed3c5b03~bIRAZyW-D1167411674euoutp01B
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Mar 2018 09:07:32 +0000 (GMT)
Subject: Re: [PATCH v2 0/3] drm: Add LVDS decoder bridge
To: Jacopo Mondi <jacopo+renesas@jmondi.org>, architt@codeaurora.org,
        Laurent.pinchart@ideasonboard.com, airlied@linux.ie,
        horms@verge.net.au, magnus.damm@gmail.com, geert@linux-m68k.org,
        niklas.soderlund@ragnatech.se, sergei.shtylyov@cogentembedded.com,
        robh+dt@kernel.org, mark.rutland@arm.com
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <81b25fde-63fa-aacc-1bf4-f2a7b60b19ef@samsung.com>
Date: Mon, 12 Mar 2018 10:07:27 +0100
MIME-Version: 1.0
In-Reply-To: <1520603500-15218-1-git-send-email-jacopo+renesas@jmondi.org>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
References: <CGME20180309135207epcas3p32a7d3a0e9c9dae5af8fc855ff3c0e03b@epcas3p3.samsung.com>
        <1520603500-15218-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 09.03.2018 14:51, Jacopo Mondi wrote:
> Hello,
>    after some discussion on the proposed bindings for generic lvds decoder and
> Thine THC63LVD1024, I decided to drop the THC63 specific part and just live with
> a transparent decoder that does not support any configuration from DT.
>
> Dropping THC63 support to avoid discussion on how to better implement support
> for a DRM bridge with 2 input ports and focus on LVDS mode propagation through
> bridges as explained in v1 cover letter (for DRM people: please see [1] as why
> I find difficult to implement support for bridges with multiple input endpoints)
>
> Same base branch as v1, with same patches for V3M Eagle applied on top.
> git://jmondi.org/linux v3m/v4.16-rc3/base
>
> Thanks
>    j
>
> v1 -> v2:
> - Drop support for THC63LVD1024
>
> [1] I had a quick at how to model a DRM bridge with multiple input
> ports, and I see a blocker in how DRM identifies and matches bridges using
> the devices node in place of the endpoint nodes.
>
> As THC63LVD1024 supports up to 2 LVDS inputs and 2 LVDS outputs, I see only
> a few ways to support that:
>  1) register 2 drm bridges from the same driver (one for each input/output pair)
>     but they would both be matches on the same device node when the preceding
>     bridge calls "of_drm_find_bridge()".
>  2) register a single bridge with multiple "next bridges", but when the bridge
>     gets attached I don't see a way on how to identify on which next bridge
>     "drm_bridge_attach()" on, as it depends on the endpoint the current bridge
>     has been attached on first, and we don't have that information.
>  3) Register more instances of the same chip in DTS, one for each input/output
>     pair. They gonna share supplies and gpios, and I don't like that.
>
> I had a quick look at the currently in mainline bridges and none of them has
> multiple input endpoints, except for HDMI audio endpoint, which I haven't found
> in use in any DTS. I guess the problem has been already debated and maybe solved
> in the past, so feel free to point me to other sources.

I think this is is a step in wrong direction, IMHO. Your previous
patchset was quite OK, at least bindings, IMHO. Few things needed only
polishing.
Here we have unmanaged/transparent bridge, which is totally different,
what happened to regulators and gpios from previous iteration.
I do not have schematics of the board, but I guess respective pins of
the bridge must be connected somehow.
I think the problem you want to avoid (double bridge) should not be a
problem at all.
I suppose the most important is to have correct bindings - as they need
to be stable.
If you really must to do hacks better is to put them into driver.

Regards
Andrzej

>
> Jacopo Mondi (3):
>   dt-bindings: display: bridge: Document LVDS to parallel decoder
>   drm: bridge: Add LVDS decoder driver
>   arm64: dts: renesas: Add LVDS decoder to R-Car V3M Eagle
>
>  .../bindings/display/bridge/lvds-decoder.txt       |  42 ++++++
>  arch/arm64/boot/dts/renesas/r8a77970-eagle.dts     |  31 +++-
>  drivers/gpu/drm/bridge/Kconfig                     |   8 ++
>  drivers/gpu/drm/bridge/Makefile                    |   1 +
>  drivers/gpu/drm/bridge/lvds-decoder.c              | 157 +++++++++++++++++++++
>  5 files changed, 237 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/lvds-decoder.txt
>  create mode 100644 drivers/gpu/drm/bridge/lvds-decoder.c
>
> --
> 2.7.4
>
>
>
>
