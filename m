Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:45134 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752490AbeB1N1K (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Feb 2018 08:27:10 -0500
Date: Wed, 28 Feb 2018 14:27:07 +0100
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 0/5] Add R8A77970/V3MSK LVDS/HDMI support
Message-ID: <20180228132707.mgunezg5o4lul7x5@verge.net.au>
References: <23a6ac28-134b-b5dd-69a7-910774c4b8c1@cogentembedded.com>
 <2fd26075-525c-8d86-ef81-f32c73cf3e8b@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2fd26075-525c-8d86-ef81-f32c73cf3e8b@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Feb 27, 2018 at 11:23:39PM +0300, Sergei Shtylyov wrote:
> On 02/27/2018 11:06 PM, Sergei Shtylyov wrote:
> 
> > Here's the set of 5 patches against Simon Horman's 'renesas.git' repo's
> > 'renesas-devel-20180227-v4.16-rc3' tag. We're adding the R8A77970 FCPVD/VSPD/
> > DU/LVDS device nodes and then describing the HDMI encoder connected to the LVDS
> > output (we're omitting the LVDS decoder for now). These patches depend on
> > the recent R8A77970 DU/LVDS rework patches by Laurent in order to work...	
> 
>    Need to mention that the DU driver silently fails to probe now. I do
>    hope that this is not due to my updates. :-)

Please test that theory.
