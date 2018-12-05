Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36016 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727349AbeLETT3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Dec 2018 14:19:29 -0500
Date: Wed, 5 Dec 2018 11:19:24 -0800
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Biju Das <biju.das@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH 17/22] ARM: dts: iwg20d-q7-common: Move cmt/rwdt node out
 of RZ/G1M SOM
Message-ID: <20181205191923.u4cb523rkybtmljy@verge.net.au>
References: <1543319795-48325-1-git-send-email-biju.das@bp.renesas.com>
 <1543319795-48325-18-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdW6_3Vmv=vCxM9DaJwmpAsCUdK_sBk=ipGn5rD=1+ZF6Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdW6_3Vmv=vCxM9DaJwmpAsCUdK_sBk=ipGn5rD=1+ZF6Q@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Dec 04, 2018 at 03:55:28PM +0100, Geert Uytterhoeven wrote:
> On Tue, Nov 27, 2018 at 1:05 PM Biju Das <biju.das@bp.renesas.com> wrote:
> > The iWave RZ/G1N board is almost identical to RZ/G1M. cmt and rwdt modules
> > are SoC specific and should be part of board dts rather than SoM dtsi. By
> > moving these nodes to the common dtsi it allows cmt and rwdt to be enabled
> > on both of these boards with less lines of code.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for v4.21.
