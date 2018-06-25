Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:49122 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754359AbeFYJep (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Jun 2018 05:34:45 -0400
Date: Mon, 25 Jun 2018 11:34:41 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] [LOCAL/RFC] MAINTAINERS: renesas_defconfig does not
 exist upstream
Message-ID: <20180625093433.l6tt332iv5uavexu@verge.net.au>
References: <20180619181835.23926-1-geert+renesas@glider.be>
 <20180620090320.kxgq2cavrzg727p6@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180620090320.kxgq2cavrzg727p6@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jun 20, 2018 at 11:03:21AM +0200, Simon Horman wrote:
> On Tue, Jun 19, 2018 at 08:18:35PM +0200, Geert Uytterhoeven wrote:
> > Make sure patches for arch/arm64/configs/renesas_defconfig are sent to
> > the right people, and don't bother anyone outside linux-renesas-soc.
> > 
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Not intended for upstream merge.
> > 
> > Is this a good idea, or will it cause too many merge conflicts in
> > MAINTAINERS?
> 
> It seems like a good idea to me.
> We can drop it if it becomes a headache.

Geert, shall I apply this to topic/renesas-defconfig?
