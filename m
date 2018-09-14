Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:34158 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727686AbeINP0h (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Sep 2018 11:26:37 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-kernel@vger.kernel.org, kbingham@kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/4] MAINTAINERS: rcar-du: Add co-maintainer
Date: Fri, 14 Sep 2018 13:13:02 +0300
Message-ID: <1652490.uiGxaAVbv9@avalon>
In-Reply-To: <20180806143904.4716-1-kieran.bingham@ideasonboard.com>
References: <20180806143904.4716-1-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

Thank you for the patch.

On Monday, 6 August 2018 17:39:01 EEST Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> Add myself as a co-maintainer for the Renesas DRM drivers.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

and applied to my tree.

Thank you for your help with the R-Car DU driver !

> ---
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> 
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7cebd5bba8a8..c7cecb9201b3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4764,6 +4764,7 @@
> F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-
host1x.tx
> t
> 
>  DRM DRIVERS FOR RENESAS
>  M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> +M:	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>  L:	dri-devel@lists.freedesktop.org
>  L:	linux-renesas-soc@vger.kernel.org
>  T:	git git://linuxtv.org/pinchartl/fbdev

-- 
Regards,

Laurent Pinchart
