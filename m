Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:34606 "EHLO
	mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750909AbcHIXve (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 9 Aug 2016 19:51:34 -0400
Date: Tue, 9 Aug 2016 18:51:32 -0500
From: Rob Herring <robh@kernel.org>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: laurent.pinchart@ideasonboard.com, airlied@linux.ie,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	mark.rutland@arm.com, devicetree@vger.kernel.org
Subject: Re: [PATCH] rcar-du: add R8A7792 support
Message-ID: <20160809235132.GA25576@rob-hp-laptop>
References: <1934824.sESTIjSbbp@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1934824.sESTIjSbbp@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Aug 04, 2016 at 03:01:02PM -0700, Sergei Shtylyov wrote:
> Add support for the R8A7792 DU; it has 2 DPAD (RGB) outputs.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> This patch is against the 'drm/next/du' branch of Laurent Pinchart's 'media.git'
> repo...
> 
>  Documentation/devicetree/bindings/display/renesas,du.txt |    4 ++
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c                    |   22 +++++++++++++++
>  2 files changed, 25 insertions(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>
