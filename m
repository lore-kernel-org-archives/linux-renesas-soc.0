Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:42390 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751102AbdHXKMC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Aug 2017 06:12:02 -0400
Date: Thu, 24 Aug 2017 06:11:52 -0400
From: Simon Horman <horms@verge.net.au>
To: Chris Paterson <Chris.Paterson2@renesas.com>
Cc: Biju Das <biju.das@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH  0/2] ARM: dts: Add iWave RZ/G1E board support
Message-ID: <20170824101152.GD17607@verge.net.au>
References: <1502794460-30213-1-git-send-email-biju.das@bp.renesas.com>
 <TY1PR06MB070230193DD40E5D09D0A9AFB7840@TY1PR06MB0702.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY1PR06MB070230193DD40E5D09D0A9AFB7840@TY1PR06MB0702.apcprd06.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Aug 22, 2017 at 04:03:23PM +0000, Chris Paterson wrote:
> Hello Simon,
> 
> > From: Biju Das [mailto:biju.das@bp.renesas.com]
> > Sent: 15 August 2017 11:54
> > 
> > Hello,
> > 
> > This series aims to add iWave RZ/G1E (R8A7745) based RainboW-G22M-SM
> > SODIMM SoM and RainboW-G22D board support.
> > 
> > This series has been tested against linux-next tag next-20170815 as well as
> > renesas-dev tag 20170814-v4.13-rc5
> > 
> > This patch has documentation dependency on below patches
> 
> The below patches are now in your v4.14 branch. Does this mean that this DT series can now be accepted?

Thanks, I have applied them for v4.15.
