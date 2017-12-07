Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:34907 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751432AbdLGJDh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Dec 2017 04:03:37 -0500
Date: Thu, 7 Dec 2017 10:03:17 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Chris Paterson <chris.paterson2@renesas.com>
Subject: Re: [PATCH v2] ARM: dts: r8a7745: Add APMU node and second CPU core
Message-ID: <20171207090316.kqo2iqwrkjtearuz@verge.net.au>
References: <1512561929-16540-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdWTepYLpySfo6hq10-9TrGh+o=P9k5RnTYxBTe-eh-pQw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWTepYLpySfo6hq10-9TrGh+o=P9k5RnTYxBTe-eh-pQw@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Dec 06, 2017 at 01:12:02PM +0100, Geert Uytterhoeven wrote:
> On Wed, Dec 6, 2017 at 1:05 PM, Fabrizio Castro
> <fabrizio.castro@bp.renesas.com> wrote:
> >
> > Add DT node for the Advanced Power Management Unit (APMU), add the
> > second CPU core, and use "renesas,apmu" as "enable-method".
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
> > Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> 
> > v2:
> > - rebased against renesas-devel-20171205-v4.15-rc2
> 
> Seems my
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> was not added.

Its added now :)

I've applied this for v4.16.
