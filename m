Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:45078 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935523AbeEISzO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 May 2018 14:55:14 -0400
Date: Wed, 9 May 2018 20:54:55 +0200
From: Simon Horman <horms@verge.net.au>
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 0/2] ARM: dts: r7s72100: Correct interrupt types
Message-ID: <20180509185454.w52i7i3h4ub4t5k5@verge.net.au>
References: <1525699489-6172-1-git-send-email-geert+renesas@glider.be>
 <TYXPR01MB1568D369782351FB288EA8328A9B0@TYXPR01MB1568.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYXPR01MB1568D369782351FB288EA8328A9B0@TYXPR01MB1568.jpnprd01.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, May 07, 2018 at 02:39:13PM +0000, Chris Brandt wrote:
> Hi Geert,
> 
> On Monday, May 07, 2018, Geert Uytterhoeven wrote:
> > 
> > 	Hi Simon, Magnus,
> > 
> > RZ/A1H peripherals use a mix of level and edge interrupts.
> > 
> > This patch series corrects the interrupt types for watchdog and RTC from
> > edge to level, to match the datasheet.
> > 
> > Is there any easy way to test this?
> > The watchdog interrupt is not used by the Linux driver.
> > The RTC interrupts are used, but how to trigger them?
> 
> Honestly, I can't remember if I did that for a reason, or it was just an
> oversight.
> 
> Like you mentioned, the watchdog driver does not use interrupts, it 
> simply resets system on overflow.
> 
> As for RTC, I thought I remember setting an 'alarm' and testing the code
> did work. But, I can't seem to find any leftover test scripts (so did I
> really do that????)
> 
> I would say make the changes anyway as they should match what is in the 
> hardware manual.

Thanks, applied.
