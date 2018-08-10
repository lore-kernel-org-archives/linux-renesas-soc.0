Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:47344 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727028AbeHJKGD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Aug 2018 06:06:03 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Rob Herring <robh@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        batareich batareich <vladimir.barinov@cogentembedded.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        TAKESHI KIHARA <takeshi.kihara.df@renesas.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH v2 2/5] soc: renesas: rcar-sysc: Add r8a774a1 support
Date: Fri, 10 Aug 2018 07:37:18 +0000
Message-ID: <OSBPR01MB2103F54A22AD3A78011F2446B8240@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1533221599-52948-1-git-send-email-biju.das@bp.renesas.com>
 <5b6cc303.1c69fb81.26116.320b@mx.google.com>
In-Reply-To: <5b6cc303.1c69fb81.26116.320b@mx.google.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Rob,

> Subject: Re: [PATCH v2 2/5] soc: renesas: rcar-sysc: Add r8a774a1 support
>
> Hi, this is an automated email from Rob's (experimental) review bot. I fo=
und
> a couple of common problems with your patch. Please see below.

Do I need to send another patch? The mail says " Rob's (experimental) revie=
w bot".
Previously for RZ/G1C upstreaming I have submitted the patches in similar f=
ashion.
Is anything changed?

> On Thu,  2 Aug 2018 15:53:19 +0100, Biju Das wrote:
> > Add support for RZ/G2M (R8A774A1) SoC power areas to the R-Car SYSC
> > driver.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> The preferred subject prefix is "dt-bindings: <binding dir>: ...".
>
> DT bindings (including binding headers) should be a separate patch. See
> Documentation/devicetree/bindings/submitting-patches.txt.

Regards,
Biju




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
