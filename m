Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52846 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751403AbdGNHaR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Jul 2017 03:30:17 -0400
Date: Fri, 14 Jul 2017 09:30:13 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: r8a7795: salvator-xs: Connect DU dot
 clocks 0 and 3
Message-ID: <20170714073012.GH12105@verge.net.au>
References: <20170713110653.7606-1-laurent.pinchart+renesas@ideasonboard.com>
 <20170713110953.8511-1-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdWJPRxjUhjLaU=0ph-hc-_riMzPxh=cNMqvFgatLh_SMQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWJPRxjUhjLaU=0ph-hc-_riMzPxh=cNMqvFgatLh_SMQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jul 13, 2017 at 01:20:16PM +0200, Geert Uytterhoeven wrote:
> On Thu, Jul 13, 2017 at 1:09 PM, Laurent Pinchart
> <laurent.pinchart+renesas@ideasonboard.com> wrote:
> > The DU dot clocks 0 and 3 are provided by the programmable VC6 clock
> > generator. Connect them to the clock source node.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for v4.14.
