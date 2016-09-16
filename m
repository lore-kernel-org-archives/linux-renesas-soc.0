Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:40393 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752575AbcIPJph (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Sep 2016 05:45:37 -0400
Date: Fri, 16 Sep 2016 11:45:32 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH 2/3] arm64: renesas: r8a7796: Add all SCIF nodes
Message-ID: <20160916094531.GC14562@verge.net.au>
References: <20160914164648.31403-1-ulrich.hecht+renesas@gmail.com>
 <20160914164648.31403-3-ulrich.hecht+renesas@gmail.com>
 <CAMuHMdU4+Q8QZeHs8DqXDZABHwVOvW=rdjFkLBO=0DyEr39vpw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdU4+Q8QZeHs8DqXDZABHwVOvW=rdjFkLBO=0DyEr39vpw@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Sep 15, 2016 at 08:33:38PM +0200, Geert Uytterhoeven wrote:
> On Wed, Sep 14, 2016 at 6:46 PM, Ulrich Hecht
> <ulrich.hecht+renesas@gmail.com> wrote:
> > Add the device nodes for all R-Car H3 SCIF serial ports, incl. clocks
> > and clock domain.
> >
> > Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Unfortunately this does not apply to my tree.

Ulrich, please consider rebasing the latest renesas/next branch
(currently renesas-next-20160908-v4.8-rc1 tag) and reposting.

I'd be happy to see this patch reposted without the rest of the series
if that would be most expedient for you.
