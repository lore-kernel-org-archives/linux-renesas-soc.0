Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp1.de.adit-jv.com ([62.225.105.245]:40466 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727510AbeHFLoF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Aug 2018 07:44:05 -0400
Date: Mon, 6 Aug 2018 11:28:13 +0200
From: Eugeniu Rosca <erosca@de.adit-jv.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        <linux-renesas-soc@vger.kernel.org>,
        Eugeniu Rosca <erosca@de.adit-jv.com>
Subject: Re: [PATCH 02/14] dt-bindings: arm: don't embed SoC name into the
 ULCB boards' compatible
Message-ID: <20180806092813.GA3234@vmlxhi-102.adit-jv.com>
References: <20180804231114.21420-1-erosca@de.adit-jv.com>
 <20180804231114.21420-3-erosca@de.adit-jv.com>
 <87ftzspcej.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87ftzspcej.wl-kuninori.morimoto.gx@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san,

Thank you for your comments.

On Mon, Aug 06, 2018 at 12:33:34AM +0000, Kuninori Morimoto wrote:
> Hi Eugeniu
> 
> > In the context of M3N-ULCB (RTP0RC77965SKBX010SA00) board bring-up, it's
> > rather pointless to add a new "renesas,m3nulcb" compatible string. Any
> > SoC-level differences between the two variants of ULCB (M3 and M3-N)
> > should be successfully covered by making use of existing
> > "renesas,r8a7796" and "renesas,r8a77965" compatibles.
> > 
> > Prior to adding M3-N Starter Kit to the list, rename:
> >  - "renesas,h3ulcb" => "renesas,ulcb"
> >  - "renesas,m3ulcb" => "renesas,ulcb"
> 
> I'm not sure detail, but
> does it mean, both H3/M3 board can boot/work with
> "renesas,ulcb" compatible if we had such driver/soc ?

First, assuming latest vanilla v4.18-rc8 kernel, neither
"renesas,salvator-x[s]" nor "renesas,(m3|h3)ulcb" compatibles are
used anywhere outside of DTS and DT bindings documentation:

$ git grep -E --name-only "renesas,(h3ulcb|m3ulcb|salvator-x)" | xargs dirname | sort -u
arch/arm64/boot/dts/renesas
Documentation/devicetree/bindings/arm

Since there is no driver using these compatibles, no functional
breakage is expected by changing the compatible format/name.

Secondly, as pointed out in the commit summary line and description,
there is an overlap in scope between the SoC-level compatibles and
ULCB board-level compatibles, which doesn't happen for Salvator-X{S}
targets and creates some inconsistency. This inconsistency now spawns
debates about how other ULCB-based board compatibles should be named and
for that single reason IMO should be fixed.

Lastly, I don't think any driver will ever need to use
"renesas,(m3|m3n|h3)ulcb" string, since it is too broad. On/off-chip
IP-oriented compatibles are probably better candidates for that.

> 
> > diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
> > index d8cf740132c6..f391dba10574 100644
> > --- a/Documentation/devicetree/bindings/arm/shmobile.txt
> > +++ b/Documentation/devicetree/bindings/arm/shmobile.txt
> > @@ -81,7 +81,7 @@ Boards:
> >      compatible = "renesas,gose", "renesas,r8a7793"
> >    - H3ULCB (R-Car Starter Kit Premier, RTP0RC7795SKBX0010SA00 (H3 ES1.1))
> >      H3ULCB (R-Car Starter Kit Premier, RTP0RC77951SKBX010SA00 (H3 ES2.0))
> > -    compatible = "renesas,h3ulcb", "renesas,r8a7795"
> > +    compatible = "renesas,ulcb", "renesas,r8a7795"
> >    - Henninger
> >      compatible = "renesas,henninger", "renesas,r8a7791"
> >    - iWave Systems RZ/G1C Single Board Computer (iW-RainboW-G23S)
> > @@ -105,7 +105,7 @@ Boards:
> >    - Lager (RTP0RC7790SEB00010S)
> >      compatible = "renesas,lager", "renesas,r8a7790"
> >    - M3ULCB (R-Car Starter Kit Pro, RTP0RC7796SKBX0010SA09 (M3 ES1.0))
> > -    compatible = "renesas,m3ulcb", "renesas,r8a7796"
> > +    compatible = "renesas,ulcb", "renesas,r8a7796"
> >    - Marzen (R0P7779A00010S)
> >      compatible = "renesas,marzen", "renesas,r8a7779"
> >    - Porter (M2-LCDP)
> 
> My opinion is that if you want to exchange compatible name,
> related all driver/document should be exchanged in same patch.

AFAIK Simon maintains a number of branches hosting solely the DT
bindings. More precisely it is the "dt-bindings-for-v4.*" branch series
in https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git

For that reason, IMO it might be worth to detach the document updates
from DTS updates. I have no problems squashing the DTS and doc patches
into one single commit, but before doing that I would appreciate a
confirmation from the maintainer. Anyhow, many thanks for your feedback!

> 
> For example, above "h3ulcb" case, patch subject indicates
> "rename h3ulcb" or something, and it include [03/14][04/14][05/14][06/14].
> Same for m3

It was my impression that the DTS patches are always partitioned
per-file, to avoid misleading globbing patterns in the commit subjects
and allow easier DTS commit porting to future SoCs/boards. I will
gladly follow your suggestion once I get the confirmation from
maintainer.

Thank you very much!

Best regards,
Eugeniu.
