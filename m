Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:44795 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754442AbeDWKco (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Apr 2018 06:32:44 -0400
Date: Mon, 23 Apr 2018 12:32:40 +0200
From: Simon Horman <horms@verge.net.au>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v6 0/3] R-Car DU: Fix LVDS output on Gen2 boards
Message-ID: <20180423103239.oofry7je4gznpjsj@verge.net.au>
References: <20180420115754.4136-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180420115754.4136-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Apr 20, 2018 at 02:57:51PM +0300, Laurent Pinchart wrote:
> Hello,
> 
> This patch series fixes LVDS output support on the Lager, Koelsh, Porter and
> Gose boards that broke in v4.17-rc1 due to the combination of the R-Car DU
> LVDS driver rework and the DT move of all on-SoC peripherals to a /soc node.
> 
> We could handle the problem in the R-Car DU LVDS DT backward compatibility
> code, but that fix would only be used for v4.17 as in v4.18 the Gen2 DT will
> move to the new LVDS DT bindings. I thus propose merging these three patches
> in v4.17 already to fix the problem as this is the simplest solution.
> 
> The patches are based on top of v4.17-rc1. Simon, could you please queue them
> up as fixes for v4.17 ?

Yes. This is in keeping with what we previously discussed.
Thanks for following up on this. I have applied the patches as fixes
for v4.17.
