Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56318 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751721AbeDIMj3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Apr 2018 08:39:29 -0400
Date: Mon, 9 Apr 2018 14:39:25 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Biju Das <biju.das@bp.renesas.com>,
        Russell King <linux@armlinux.org.uk>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] ARM: debug-ll: Add support for r8a77470
Message-ID: <20180409123924.u4b5nix6rgngg3ck@verge.net.au>
References: <1522320146-41110-1-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdWJLrkLndVazM5QSE938sJ0kDphzodPcMc2t8T4_=9oUA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWJLrkLndVazM5QSE938sJ0kDphzodPcMc2t8T4_=9oUA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Mar 30, 2018 at 11:28:06AM +0200, Geert Uytterhoeven wrote:
> On Thu, Mar 29, 2018 at 12:42 PM, Biju Das <biju.das@bp.renesas.com> wrote:
> > Enable low-level debugging support for RZ/G1C (r8a77470). RZ/G1C uses
> > SCIF1 for the debug console.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for v4.18.
