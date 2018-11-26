Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:59459 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726157AbeKZT3z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Nov 2018 14:29:55 -0500
Date: Mon, 26 Nov 2018 09:36:28 +0100
From: Simon Horman <horms@verge.net.au>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        kieran.bingham@ideasonboard.com
Subject: Re: [PATCH 1/5] drm: rcar-du: Replace EXT_CTRL_REGS feature flag
 with generation check
Message-ID: <20181126083627.dk6irxqxqtkwmpdi@verge.net.au>
References: <20181125144031.4407-1-laurent.pinchart+renesas@ideasonboard.com>
 <20181125144031.4407-2-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181125144031.4407-2-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sun, Nov 25, 2018 at 04:40:27PM +0200, Laurent Pinchart wrote:
> The RCAR_DU_FEATURE_EXT_CTRL_REGS feature flag is missing for H1 only,
> which is a first generation device, not a second generation device as
> reported in the device information table. Fix the H1 generation and use
> generation checks to replace the feature flag.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
