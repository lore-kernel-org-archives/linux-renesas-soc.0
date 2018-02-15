Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52658 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1163568AbeBOSSc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Feb 2018 13:18:32 -0500
Date: Thu, 15 Feb 2018 19:18:28 +0100
From: Simon Horman <horms@verge.net.au>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v3 05/12] ARM: dts: porter: Fix HDMI output routing
Message-ID: <20180215181825.rp675mizp3s63xi3@verge.net.au>
References: <20180215000415.19077-1-laurent.pinchart+renesas@ideasonboard.com>
 <20180215000415.19077-6-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180215000415.19077-6-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Feb 15, 2018 at 02:04:08AM +0200, Laurent Pinchart wrote:
> The HDMI encoder is connected to the RGB output of the DU, which is
> port@0, not port@1. Fix the incorrect DT description.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

This patch is already queued up for v4.17.
