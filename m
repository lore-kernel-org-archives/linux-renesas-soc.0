Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:37330 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964811AbcDYVKw (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 25 Apr 2016 17:10:52 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] rcar-du: add/rename DEFR6 TCON bits
Date: Tue, 26 Apr 2016 00:11:15 +0300
Message-ID: <3463066.Db4xpr3SQR@avalon>
In-Reply-To: <2036550.BKBaf2zquB@wasted.cogentembedded.com>
References: <2036550.BKBaf2zquB@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

Thank you for the patch.

On Saturday 23 Apr 2016 01:56:07 Sergei Shtylyov wrote:
> The  TCNE2 bit  of the DEFR6 register was renamed to TCNE1 in the R-Car gen2
> manuals -- which makes more  sense as that bit controls whether DU1, not
> DU2 is connected to TCON.
> 
> While at it, add the TCNE0 bit which controls whether DU0 is connected to
> TCON.
> 
> Based on the large patch by Andrey Gusakov
> <andrey.gusakov@cogentembedded.com>.
> 
> Signed-off-by: Andrey Gusakov <andrey.gusakov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

and applied to my tree.

> ---
> The patch is against David Airlie's 'linux.git' repo's 'drm-next' branch.
> 
>  drivers/gpu/drm/rcar-du/rcar_du_regs.h |    5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> Index: linux/drivers/gpu/drm/rcar-du/rcar_du_regs.h
> ===================================================================
> --- linux.orig/drivers/gpu/drm/rcar-du/rcar_du_regs.h
> +++ linux/drivers/gpu/drm/rcar-du/rcar_du_regs.h
> @@ -195,9 +195,10 @@
>  #define DEFR6_ODPM12_DISP	(2 << 8)
>  #define DEFR6_ODPM12_CDE	(3 << 8)
>  #define DEFR6_ODPM12_MASK	(3 << 8)
> -#define DEFR6_TCNE2		(1 << 6)
> +#define DEFR6_TCNE1		(1 << 6)
> +#define DEFR6_TCNE0		(1 << 4)
>  #define DEFR6_MLOS1		(1 << 2)
> -#define DEFR6_DEFAULT		(DEFR6_CODE | DEFR6_TCNE2)
> +#define DEFR6_DEFAULT		(DEFR6_CODE | DEFR6_TCNE1)
> 
>  /* ------------------------------------------------------------------------
>   * R8A7790-only Control Registers

-- 
Regards,

Laurent Pinchart
