Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:42211 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932628AbdJQIC0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Oct 2017 04:02:26 -0400
Date: Tue, 17 Oct 2017 10:02:20 +0200
From: Simon Horman <horms@verge.net.au>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH 3/4] ARM: dts: iwg22d-sodimm-dbhd-ca: Add device tree for
 HDMI DB
Message-ID: <20171017080220.ff5brg2jh4womfj2@verge.net.au>
References: <1507899796-7941-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1507899796-7941-4-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1507899796-7941-4-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Oct 13, 2017 at 02:03:15PM +0100, Fabrizio Castro wrote:
> Add file r8a7745-iwg22d-sodimm-dbhd-ca.dts to provide support for
> iW-RainboW-G22D with HDMI daughter board plugged in.
> 
> The interfaces defined in the new .dts file are: scif1, scif5,
> and hscif2.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>

I wonder if this patch should include a chosen node.
