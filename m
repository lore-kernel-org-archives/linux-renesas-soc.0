Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36624 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752419AbeDZGM7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Apr 2018 02:12:59 -0400
Date: Wed, 25 Apr 2018 08:06:20 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Biju Das <biju.das@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] ARM: dts: r8a77470: Add SCIF support
Message-ID: <20180425060620.iqaihs5npgwhylna@verge.net.au>
References: <1524560164-30040-1-git-send-email-biju.das@bp.renesas.com>
 <1524560164-30040-2-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdUQoNkRq1_fHV6a2yVseTMSYaw+07aKpcUaw0fD1RqhOA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUQoNkRq1_fHV6a2yVseTMSYaw+07aKpcUaw0fD1RqhOA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Apr 24, 2018 at 04:42:19PM +0200, Geert Uytterhoeven wrote:
> On Tue, Apr 24, 2018 at 10:56 AM, Biju Das <biju.das@bp.renesas.com> wrote:
> > Describe SCIF ports in the R8A77470 device tree.
> > Also it fixes the CPG clock index ZS from 6 to 5.
> >
> > Fixes: 6929dfc5918049 ("ARM: dts: r8a77470: Initial SoC device tree")
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, tag retrospectively added.
