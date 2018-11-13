Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:60312 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387599AbeKNAl1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Nov 2018 19:41:27 -0500
Date: Tue, 13 Nov 2018 06:42:58 -0800
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a774a1: Replace power magic
 numbers
Message-ID: <20181113144257.rul3hpyc72prryli@verge.net.au>
References: <1541604267-4652-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1541604267-4652-2-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdUq4EC0cuOePUO-WJrTi38ypT=GQoze9rpgmFm55mBXyA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUq4EC0cuOePUO-WJrTi38ypT=GQoze9rpgmFm55mBXyA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Nov 13, 2018 at 09:52:19AM +0100, Geert Uytterhoeven wrote:
> On Wed, Nov 7, 2018 at 4:24 PM Fabrizio Castro
> <fabrizio.castro@bp.renesas.com> wrote:
> > Now that include/dt-bindings/power/r8a774a1-sysc.h is in Linus'
> > master branch we can replace power related magic numbers with
> > the corresponding labels.
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for v4.21.
