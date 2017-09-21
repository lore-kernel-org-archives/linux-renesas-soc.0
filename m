Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33280 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751581AbdIUIs3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Sep 2017 04:48:29 -0400
Date: Thu, 21 Sep 2017 10:47:45 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Chris Paterson <chris.paterson2@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 8/8] ARM: drs: iwg22m: Add SPI NOR support
Message-ID: <20170921084744.GM15749@verge.net.au>
References: <1505322341-9480-1-git-send-email-chris.paterson2@renesas.com>
 <1505322341-9480-9-git-send-email-chris.paterson2@renesas.com>
 <CAMuHMdW2_Tz6Mu7bwTXiAuyyeUvJTFrbyMAnxCi+Nj7ig65Ong@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdW2_Tz6Mu7bwTXiAuyyeUvJTFrbyMAnxCi+Nj7ig65Ong@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Sep 20, 2017 at 01:10:00PM +0200, Geert Uytterhoeven wrote:
> On Wed, Sep 13, 2017 at 7:05 PM, Chris Paterson
> <chris.paterson2@renesas.com> wrote:
> > From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> >
> > Add support for the SPI NOR device used to boot up the system
> > to the System on Module DT.
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
> 
> With the subject fixed (s/drs/dts/):
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied as

ARM: dts: iwg22m: Add SPI NOR support
