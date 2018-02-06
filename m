Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:58805 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752403AbeBFMp7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Feb 2018 07:45:59 -0500
Date: Tue, 6 Feb 2018 13:45:55 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 02/11] soc: renesas: rcar-rst: add R8A77980 support
Message-ID: <20180206124555.62vty4lwp7gakmgi@verge.net.au>
References: <46fca582-220d-e5a7-62cd-2fc77a29846b@cogentembedded.com>
 <76b4144e-423a-65fd-fe17-bfedbc0deb8e@cogentembedded.com>
 <CAMuHMdVcKEH4FMf8UazacV86DFtJq8sdxfT+c7UX+67k5vXugA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVcKEH4FMf8UazacV86DFtJq8sdxfT+c7UX+67k5vXugA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Feb 05, 2018 at 01:37:04PM +0100, Geert Uytterhoeven wrote:
> On Fri, Feb 2, 2018 at 7:27 PM, Sergei Shtylyov
> <sergei.shtylyov@cogentembedded.com> wrote:
> > Add support for R-Car V3H (R8A77980) to the R-Car RST driver -- this driver
> > is  needed  for the clock driver to work.
> 
> Please drop the extra spaces in between words that are part of the same
> sentence.
> 
> > Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied with whitespace fixes suggested above.
