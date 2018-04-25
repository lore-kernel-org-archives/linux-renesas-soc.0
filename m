Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36624 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751698AbeDZGM5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Apr 2018 02:12:57 -0400
Date: Wed, 25 Apr 2018 09:13:53 +0200
From: Simon Horman <horms@verge.net.au>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm: rcar-du: Use NULL for table initialisation
Message-ID: <20180425071353.guapvaa2crfppahk@verge.net.au>
References: <20180424154003.2604-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180424154003.2604-1-kieran.bingham+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Apr 24, 2018 at 04:40:03PM +0100, Kieran Bingham wrote:
> Replace the initialisation of the vsps table with a NULL specifier.
> 
> Fixes the following warning:
>  linux/drivers/gpu/drm/rcar-du/rcar_du_kms.c:483:40:
>     warning: Using plain integer as NULL pointer
>       CC      drivers/gpu/drm/rcar-du/rcar_du_kms.o
> 
> Fixes: 3e81374e2014 ("drm: rcar-du: Support multiple sources from the same VSP")
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
