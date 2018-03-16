Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:39405 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751524AbeCPQZZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Mar 2018 12:25:25 -0400
Date: Fri, 16 Mar 2018 17:25:20 +0100
From: Simon Horman <horms@verge.net.au>
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH 42/52] ARM: dts: r7s72100: add USB device to device tree
Message-ID: <20180316162516.6qidilshycg7lg2n@verge.net.au>
References: <cover.1521208546.git.horms+renesas@verge.net.au>
 <faa6c0071114fd433e83dddd3a42fba547ca9a67.1521208546.git.horms+renesas@verge.net.au>
 <TY1PR01MB1562ED183D137FA48FCBC7DB8AD70@TY1PR01MB1562.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY1PR01MB1562ED183D137FA48FCBC7DB8AD70@TY1PR01MB1562.jpnprd01.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Mar 16, 2018 at 03:02:13PM +0000, Chris Brandt wrote:
> Hi Simon,
> 
> On Friday, March 16, 2018 1, Simon Horman wrote:
> > From: Chris Brandt <chris.brandt@renesas.com>
> > 
> > Add USB device support.
> > 
> > Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> 
> This patch is already in mainline:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8a99b6ad4da2f90969bb2ebb426c1d3dd0089fa4
> 
> Pushed by Greg.
> 
> At one point Greg applied it, then reverted it (as requested by Geert), 
> but then somehow it still went in.

Ok, that is a bit unfortunate.

I'll repost with that patch and the cleanup patches that depend on it
dropped.
