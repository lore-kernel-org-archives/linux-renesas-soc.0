Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:45142 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754710AbeDWK4N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Apr 2018 06:56:13 -0400
Date: Mon, 23 Apr 2018 12:56:09 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 01/04] arm64: dts: renesas: r8a7795: Enable IPMMU devices
Message-ID: <20180423105608.ihfnerio5f36u3ck@verge.net.au>
References: <152439168688.19829.5853068596124565316.sendpatchset@little-apple>
 <152439169549.19829.11796550786939315157.sendpatchset@little-apple>
 <CAMuHMdWHQdCwL_FuaDBnzB1rO=eHa_V2-n-Nm_4TgEtr-wDEvg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWHQdCwL_FuaDBnzB1rO=eHa_V2-n-Nm_4TgEtr-wDEvg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Apr 23, 2018 at 09:50:25AM +0200, Geert Uytterhoeven wrote:
> On Sun, Apr 22, 2018 at 12:08 PM, Magnus Damm <magnus.damm@gmail.com> wrote:
> > From: Magnus Damm <damm+renesas@opensource.se>
> >
> > Remove 'status = "disabled"' to make sure all IPMMU devices are enabled
> > in DT on the r8a7795 SoC.
> >
> > Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied.
