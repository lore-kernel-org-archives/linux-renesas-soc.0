Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:45083 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388236AbeGXMdn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Jul 2018 08:33:43 -0400
Date: Tue, 24 Jul 2018 13:27:39 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Biju Das <biju.das@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: r8a77470: Use r8a77470-sysc binding definitions
Message-ID: <20180724112738.ze3ky7rhmsmenawx@verge.net.au>
References: <1532092022-64918-1-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdX89v+UqSmJPLqG-SgQqQPj-hLpzJ_Nt3aU7k0niweSpA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdX89v+UqSmJPLqG-SgQqQPj-hLpzJ_Nt3aU7k0niweSpA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jul 24, 2018 at 08:54:01AM +0200, Geert Uytterhoeven wrote:
> On Fri, Jul 20, 2018 at 3:12 PM Biju Das <biju.das@bp.renesas.com> wrote:
> > Replace the hardcoded power domain indices by R8A77470_PD_* symbols.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for v4.20.
