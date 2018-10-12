Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:58654 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726664AbeJLSqz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Oct 2018 14:46:55 -0400
Date: Fri, 12 Oct 2018 13:14:55 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH] ARM: dts: r8a77470: Add I2C[0123] support
Message-ID: <20181012111454.irboyqblqucdvcha@verge.net.au>
References: <1538992358-19701-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdUeBRUc8s=xKE09FVPfQSSgrVS6Ljv55QO3zQtnA0Ly0w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUeBRUc8s=xKE09FVPfQSSgrVS6Ljv55QO3zQtnA0Ly0w@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Oct 10, 2018 at 11:25:30AM +0200, Geert Uytterhoeven wrote:
> On Mon, Oct 8, 2018 at 11:53 AM Fabrizio Castro
> <fabrizio.castro@bp.renesas.com> wrote:
> > Add device tree nodes for the I2C[0123] controllers. Also, add
> > the aliases node.
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for v4.21.
