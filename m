Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:59942 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751230AbcF2XtZ (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 29 Jun 2016 19:49:25 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Simon Horman <simon@horms.net>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/4] R-Car Gen3 DU enablement on Salvator-X board
Date: Thu, 30 Jun 2016 02:49:45 +0300
Message-ID: <16321774.A4HfHXgEKJ@avalon>
In-Reply-To: <1461458095-12212-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1461458095-12212-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

The FCP DT bindings have been merged upstream, could you apply patches 1/4 and 
2/4 from this series to your tree ? I'll retest patch 3/4 and 4/4 and then ask 
you to apply them as well.

On Sunday 24 Apr 2016 03:34:51 Laurent Pinchart wrote:
> Hello,
> 
> This patch series enables DU support on the Salvator-X board. The first
> three patches add the FCPV, VSP and DU devices to the r8a7795 .dtsi, while
> the last patch enables DU support for the board. Only the VGA output is
> currently supported, support for HDMI is work in progress.
> 
> The FCP DT bindings have been posted for review [1] but haven't been
> approved yet. As the bindings are simple I expect that last missing
> dependency to be accepted very soon, in which case this series could be
> merged for v4.7. Early review would be appreciated to make sure this could
> happen.
> 
> [1] https://patchwork.linuxtv.org/patch/33006/
> 
> Laurent Pinchart (4):
>   arm64: dts: renesas: r8a7795: Add FCPV nodes
>   arm64: dts: renesas: r8a7795: Add VSP instances
>   arm64: dts: renesas: r8a7795: Add DU device to DT
>   arm64: dts: renesas: salvator-x: Enable DU
> 
>  arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts |  44 +++++
>  arch/arm64/boot/dts/renesas/r8a7795.dtsi           | 199 ++++++++++++++++++
>  2 files changed, 243 insertions(+)

-- 
Regards,

Laurent Pinchart
