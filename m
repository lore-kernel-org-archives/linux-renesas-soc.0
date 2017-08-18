Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33219 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751176AbdHRHzz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Aug 2017 03:55:55 -0400
Date: Fri, 18 Aug 2017 09:55:50 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Russell King <linux@armlinux.org.uk>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2] ARM: debug-ll: Add support for r8a7745
Message-ID: <20170818075549.GD9175@verge.net.au>
References: <1502878810-17011-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdW_XMQGYrKcEmax59ADBD+zNMkNbqZQAPGOAkB0Ja5MJw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdW_XMQGYrKcEmax59ADBD+zNMkNbqZQAPGOAkB0Ja5MJw@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Aug 17, 2017 at 03:01:30PM +0200, Geert Uytterhoeven wrote:
> On Wed, Aug 16, 2017 at 12:20 PM, Fabrizio Castro
> <fabrizio.castro@bp.renesas.com> wrote:
> > Enable low-level debugging support for RZ/G1E (r8a7745). RZ/G1E uses
> > SCIF4 for the debug console.
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for v4.15.
