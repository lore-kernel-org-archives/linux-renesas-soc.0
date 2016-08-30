Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:34564 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750697AbcH3HGs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Aug 2016 03:06:48 -0400
Date: Tue, 30 Aug 2016 09:06:41 +0200
From: Simon Horman <horms@verge.net.au>
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] clk: renesas: rz: Select EXTAL vs USB clock
Message-ID: <20160830070640.GD12845@verge.net.au>
References: <20160825190518.20764-1-chris.brandt@renesas.com>
 <20160830031358.19468-1-chris.brandt@renesas.com>
 <20160830070443.GC12845@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160830070443.GC12845@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Aug 30, 2016 at 09:04:44AM +0200, Simon Horman wrote:
> On Mon, Aug 29, 2016 at 11:13:58PM -0400, Chris Brandt wrote:
> > Check the MD_CLK pin to determine the current clock mode in order to set
> > the pll clock parent correctly.
> > 
> > Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> > ---
> > v2:
> > * Switched to reading MD_CLK pin to determine mode
> 
> Thanks, I have queued this up.

Sorry, I hit reply to the wrong message
This patch is for Geert not me.
