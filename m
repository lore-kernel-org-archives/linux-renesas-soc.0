Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:42805 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727056AbeISOUv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Sep 2018 10:20:51 -0400
Date: Wed, 19 Sep 2018 10:43:56 +0200
From: Simon Horman <horms@verge.net.au>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Russell King <linux@armlinux.org.uk>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Laura Abbott <labbott@redhat.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jinbum Park <jinb.park7@gmail.com>,
        =?utf-8?Q?Cl=C3=A9ment?= Peron <clement.peron@devialet.com>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] ARM: debug-ll: Add support for r8a7744
Message-ID: <20180919084355.jefducb4mjx7xook@verge.net.au>
References: <1537196790-4775-1-git-send-email-biju.das@bp.renesas.com>
 <1537196790-4775-3-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1537196790-4775-3-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Sep 17, 2018 at 04:06:30PM +0100, Biju Das wrote:
> Enable low-level debugging support for RZ/G1N (R8A7744). RZ/G1N uses
> SCIF0 for the debug console.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Thanks Biju,

applied to the renesas tree for v4.20.
