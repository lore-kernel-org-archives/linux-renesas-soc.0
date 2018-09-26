Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:51870 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726777AbeIZPaA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Sep 2018 11:30:00 -0400
Date: Wed, 26 Sep 2018 11:17:56 +0200
From: Simon Horman <horms@verge.net.au>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 0/4] R-Car D3/E3 display DT enablement
Message-ID: <20180926091755.xgbgyoevo4vliv44@verge.net.au>
References: <20180925163337.31212-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180925163337.31212-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Sep 25, 2018 at 07:33:33PM +0300, Laurent Pinchart wrote:
> Hello,
> 
> The patches in this series enable display support for the D3 and E3 SoCs, on
> the Draak and Ebisu boards respectively. They were previously part of the
> "[PATCH v2 00/16] R-Car D3/E3 display support (with LVDS PLL)" series, and
> have been split out now that the DT bindings have been accepted andon their
> way to v4.20 through the DRM tree, along with the code changes.
> 
> Compared to v2, the VSPI MSTP clock index has been fixed, and the
> patches rebased on top of Simon's latest devel branch.
> 
> Simon, could you please consider this as an update for v4.20 ?

Thanks, applied for v4.20.
