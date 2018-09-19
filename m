Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:42642 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727669AbeISOIY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Sep 2018 10:08:24 -0400
Date: Wed, 19 Sep 2018 10:31:31 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 02/03] arm: dts: Include R-Car Gen2 product name in DTSI
 files
Message-ID: <20180919083130.7jnou4gpweyy43rg@verge.net.au>
References: <153717356234.480.6698281193817518888.sendpatchset@octo>
 <153717357933.480.16204445206291701317.sendpatchset@octo>
 <CAMuHMdVzxOvxuO9UCbhkpFd-fj9mhE_j53uFVEULa03=8c5rXQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVzxOvxuO9UCbhkpFd-fj9mhE_j53uFVEULa03=8c5rXQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Sep 17, 2018 at 01:22:22PM +0200, Geert Uytterhoeven wrote:
> On Mon, Sep 17, 2018 at 10:39 AM Magnus Damm <magnus.damm@gmail.com> wrote:
> > From: Magnus Damm <damm@opensource.se>
> >
> > Improve the user friendliness of the DTS code base by including the
> > R-Car product name in each R-Car Gen2 DTSI file.
> >
> > The product names are taken from:
> > Documentation/devicetree/bindings/arm/shmobile.txt
> >
> > Signed-off-by: Magnus Damm <damm@opensource.se>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for v4.20.
