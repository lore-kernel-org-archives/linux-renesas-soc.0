Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:60201 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751387AbcITJUX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Sep 2016 05:20:23 -0400
Date: Tue, 20 Sep 2016 11:20:16 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/4] ARM: dts: rcar-gen2: Correct SCIFB reg properties to
 cover all
Message-ID: <20160920092015.GD30286@verge.net.au>
References: <1474294736-24339-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1474294736-24339-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Sep 19, 2016 at 04:18:52PM +0200, Geert Uytterhoeven wrote:
> 	Hi Simon, Magnus,
> 
> Several SCIFB registers reside outside the register ranges as specified
> by the "reg" properties of the various R-Car Gen2 DTSes.  Fortunately
> this works (on Linux), due to the PAGE_SIZE granularity of ioremap().
> 
> Extend the sizes from 64 to 0x100 bytes to fix this, like is done on
> SH/R-Mobile SoCs.

Thanks, I have queued these up.
