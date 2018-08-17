Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp1.de.adit-jv.com ([62.225.105.245]:43622 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726815AbeHQTAv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Aug 2018 15:00:51 -0400
Date: Fri, 17 Aug 2018 17:56:47 +0200
From: Eugeniu Rosca <erosca@de.adit-jv.com>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
CC: Eugeniu Rosca <roscaeugeniu@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Niklas Soderlund <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Magnus Damm <damm+renesas@opensource.se>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        <linux-renesas-soc@vger.kernel.org>,
        Eugeniu Rosca <erosca@de.adit-jv.com>
Subject: Re: [PATCH v2 2/7] dt-bindings: can: rcar_can: document r8a77965 can
 support
Message-ID: <20180817155647.GA7057@vmlxhi-102.adit-jv.com>
References: <20180812133149.7710-1-erosca@de.adit-jv.com>
 <20180812133149.7710-2-erosca@de.adit-jv.com>
 <7f6c5c87-bcee-51dd-66a4-a47798397e7f@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7f6c5c87-bcee-51dd-66a4-a47798397e7f@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Kieran,

On Fri, Aug 17, 2018 at 02:44:25PM +0100, Kieran Bingham wrote:
> Hi Eugeniu
> 
> Thank you for the patch.
> 
> On 12/08/18 14:31, Eugeniu Rosca wrote:
> > Document the support for rcar_can on R8A77965 SoC devices.
> > Add R8A77965 to the list of SoCs which require the "assigned-clocks" and
> > "assigned-clock-rates" properties (thanks, Sergei). Rewrap text.
> 
> I don't think you needed to say you rewrapped the text in the commit log
> - but it's fine :)

IMHO "Rewrap text" is pretty much from the same category as "no
functional change was intended". As a reviewer, I would take these
details in the commit description any day (and sometimes I would NAK a
patch which lacks these details), since they precisely express the goals
set by the author and make reviewer's life easier.

But, of course, preferences vary and therefore I won't elaborate on that
too much.

> 
> > Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 

Best regards,
Eugeniu.
