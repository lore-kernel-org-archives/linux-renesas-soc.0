Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:60937 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751236AbeCPIjH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Mar 2018 04:39:07 -0400
Date: Fri, 16 Mar 2018 09:39:03 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 0/3] arm64: dts: renesas: Rename EtherAVB "mdc" pin group
 to "mdio"
Message-ID: <20180316083858.bgx56kriezcd5pal@verge.net.au>
References: <1520867520-13942-1-git-send-email-geert+renesas@glider.be>
 <20180313184919.si37h5xdkcfiadxu@verge.net.au>
 <CAMuHMdX8yjx9BaAYpVOhmNfse1rfZ9JYQ__aKQxt73DKoWKdkA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdX8yjx9BaAYpVOhmNfse1rfZ9JYQ__aKQxt73DKoWKdkA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Mar 13, 2018 at 08:23:05PM +0100, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Tue, Mar 13, 2018 at 7:49 PM, Simon Horman <horms@verge.net.au> wrote:
> > On Mon, Mar 12, 2018 at 04:11:57PM +0100, Geert Uytterhoeven wrote:
> >> On Renesas R-Car Gen2 SoCs, the pin group for the MDIO bus is named
> >> "mdio".
> >>
> >> When initial support was added for R-Car H3, the MDIO pin was forgotten,
> >> and the MDC pin got its own group named "mdc".  During the addition of
> >> support for R-Car M3-W, this mistake was noticed.  But as R-Car H3 and
> >> M3-W are pin compatible, and can be mounted on the same boards, the
> >> decision was made to just add the MDIO pin to the existing "mdc" group.
> >> Later this was extended to R-Car H3 ES2.0, and M3-N, because of pin
> >> compatibility, and to R-Car D3, in the name of consistency among R-Car
> >> Gen3 SoCs.
> >>
> >> However, this decision keeps on being questioned when adding new SoC
> >> support.  Hence bite the bullet and admit our mistake, and rename the
> >> pin group from "mdc" to "mdio", like on R-Car Gen2 SoCs.
> >>
> >> This series is the DTS part, and depends on the series '[PATCH 0/6]
> >> pinctrl: sh-pfc: rcar-gen3: Rename EtherAVB "mdc" pin group to "mdio"'.
> >
> > could you comment on the forwards/backwards compatibility considerations
> > of this series?
> 
> Old and new kernels work with old DT (tested on Salvator-X(S).
> New DT requires a new kernel, hence the dependency of the DTS part on the
> driver part.

Thanks, that is fine by me.

I have marked these patches as deferred. Please repost or ping me
once the dependency is available in an RC release.
