Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:37565 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752918AbeAOH4X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Jan 2018 02:56:23 -0500
Date: Mon, 15 Jan 2018 08:56:03 +0100
From: Simon Horman <horms@verge.net.au>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 05/10] ARM: dts: porter: Fix HDMI output routing
Message-ID: <20180115075602.gfstfimbcwh6uner@verge.net.au>
References: <20180112005858.26472-1-laurent.pinchart+renesas@ideasonboard.com>
 <20180112005858.26472-6-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180112005858.26472-6-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Jan 12, 2018 at 02:58:53AM +0200, Laurent Pinchart wrote:
> The HDMI encoder is connected to the RGB output of the DU, which is
> port@0, not port@1. Fix the incorrect DT description.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Should this have the following tag?

Fixes: c5af8a4248d3 ("ARM: dts: porter: add DU DT support")

If so, is it a fix to apply for v4.15 or a more regular patch
to apply for v4.16?
