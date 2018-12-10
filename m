Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:42663 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726209AbeLJNQP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Dec 2018 08:16:15 -0500
Date: Mon, 10 Dec 2018 14:16:10 +0100
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
Subject: Re: [PATCH] ARM: dts: r8a7743: Remove aliases from SoC dtsi
Message-ID: <20181210131609.526zy73r7eedgl6y@verge.net.au>
References: <1544443624-65471-1-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdXGmCdHhuQ303Nc4DZ5yPKs+vJN3Zxx2HKGomW4AenvRw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXGmCdHhuQ303Nc4DZ5yPKs+vJN3Zxx2HKGomW4AenvRw@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Dec 10, 2018 at 01:19:42PM +0100, Geert Uytterhoeven wrote:
> On Mon, Dec 10, 2018 at 1:15 PM Biju Das <biju.das@bp.renesas.com> wrote:
> > This patch removes aliases from SoC dtsi tree. Device aliases are
> > board-specific, if needed define it in board dts rather than SoC
> > dtsi.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for v4.22.
