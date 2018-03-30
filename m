Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:45417 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750725AbeC3GuK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Mar 2018 02:50:10 -0400
Date: Fri, 30 Mar 2018 08:50:06 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Biju Das <biju.das@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH v2 5/8] ARM: shmobile: r8a77470: basic SoC support
Message-ID: <20180330065005.m373p5w2jwycaxy4@verge.net.au>
References: <1522265176-33226-1-git-send-email-biju.das@bp.renesas.com>
 <1522265176-33226-6-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdUFhNQZckFU5vPzUYtBSOpV6GKWN1pHTtcg50wJmt2VKA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUFhNQZckFU5vPzUYtBSOpV6GKWN1pHTtcg50wJmt2VKA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Mar 29, 2018 at 09:15:05AM +0200, Geert Uytterhoeven wrote:
> On Wed, Mar 28, 2018 at 9:26 PM, Biju Das <biju.das@bp.renesas.com> wrote:
> > Add minimal support for the RZ/G1C (R8A77470) SoC.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > ---
> > V1->V2:
> > * No change
> 
> Hence my
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> for v1 is still valid.

Thanks, applied.
