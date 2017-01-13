Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:57934 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751146AbdAMIf3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Jan 2017 03:35:29 -0500
Date: Fri, 13 Jan 2017 09:35:22 +0100
From: Simon Horman <horms@verge.net.au>
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: r7s72100: fix sdhi clock define
Message-ID: <20170113083522.GD2269@verge.net.au>
References: <20170112181149.29035-1-chris.brandt@renesas.com>
 <CAMuHMdUz6nb-STMQK39hDqwHRt4R5t+Lndj150Lkg7prN=HQZQ@mail.gmail.com>
 <SG2PR06MB1165F25FA9498C3AAD03D7698A790@SG2PR06MB1165.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SG2PR06MB1165F25FA9498C3AAD03D7698A790@SG2PR06MB1165.apcprd06.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jan 12, 2017 at 08:34:26PM +0000, Chris Brandt wrote:
> Hi Geert,
> 
> On Thursday, January 12, 2017, Geert Uytterhoeven wrote:
> > This is strange. There are two SDHI channels, but the STBCR12
> > documentation (all versions up to rev. 3.00) says the register has MSTP
> > bits for four SD host interfaces?
> > 
> > Can you please enlighten me? Thanks!
> 
> Ya, I saw that. There are 2 bits per SDHI channel. I did check and just
> enabling the one works fine.
> 
> Honestly, I'm not sure why there are two clock enables.
> 
> I'll go back and ask the design team if they can tell me why there are 2.
> 
> As I said, I just re-tested and it works fine, but you can hold off on the
> patch if you want until I come up with a real explanation.

I'd prefer to hold off on this for now.
