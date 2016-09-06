Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:41428 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932687AbcIFKo0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Sep 2016 06:44:26 -0400
Date: Tue, 6 Sep 2016 12:44:21 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v3 0/4] Initial r8a7796 PFC support
Message-ID: <20160906104420.GD16304@verge.net.au>
References: <1471525955-11713-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <CAMuHMdU3g6UF+4HUsDo806XQ9sv3QWe-zxGv0fu3jC3xrW_Bag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdU3g6UF+4HUsDo806XQ9sv3QWe-zxGv0fu3jC3xrW_Bag@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Aug 19, 2016 at 11:17:51AM +0200, Geert Uytterhoeven wrote:
> Hi Ulrich,
> 
> On Thu, Aug 18, 2016 at 3:12 PM, Ulrich Hecht
> <ulrich.hecht+renesas@gmail.com> wrote:
> > This implements a minimal set of PFC functionality for the M3 and sits on
> > top of renesas-drivers-2016-08-09-v4.8-rc1.  It includes the SCIF pin groups
> > and enables pin control for the serial console (SCIF2) on the Salvator-X
> > board.
> >
> > This revision has scif_clk support, no bogus pin assignments, and enhanced
> > ePAPR compliance.  See below for details.
> 
> Thank you, I've applied the first two patches to sh-pfc-for-v4.9.

I have queued up the remaining two patches on a branch based on
the sh-pfc-for-v4.9-tag2 tag of Geert's tree.
