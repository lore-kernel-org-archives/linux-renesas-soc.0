Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52898 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750786AbdGNHdG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Jul 2017 03:33:06 -0400
Date: Fri, 14 Jul 2017 09:33:00 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Chris Paterson <chris.paterson2@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Biju Das <biju.das@bp.renesas.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2] ARM: dts: iwg20m: Add MMCIF0 support
Message-ID: <20170714073259.GI12105@verge.net.au>
References: <1499853805-5915-4-git-send-email-chris.paterson2@renesas.com>
 <1499960340-25310-1-git-send-email-chris.paterson2@renesas.com>
 <CAMuHMdV2f1oyi9dNGdGmqx7x7RNk10jomKQ4jHJ9wXNSEBKtNA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdV2f1oyi9dNGdGmqx7x7RNk10jomKQ4jHJ9wXNSEBKtNA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jul 13, 2017 at 06:31:33PM +0200, Geert Uytterhoeven wrote:
> On Thu, Jul 13, 2017 at 5:39 PM, Chris Paterson
> <chris.paterson2@renesas.com> wrote:
> > Define the iwg20m board dependent part of the MMCIF0 device node.
> >
> > Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for v4.14.
