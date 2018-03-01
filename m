Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56500 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S967118AbeCAJy4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Mar 2018 04:54:56 -0500
Date: Thu, 1 Mar 2018 10:54:52 +0100
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
Message-ID: <20180301095451.jvsybu5k6pnahfbi@verge.net.au>
References: <23a6ac28-134b-b5dd-69a7-910774c4b8c1@cogentembedded.com>
 <2fd26075-525c-8d86-ef81-f32c73cf3e8b@cogentembedded.com>
 <20180228132707.mgunezg5o4lul7x5@verge.net.au>
 <f9574ea2-d8ee-7c9f-b850-874074eddad2@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9574ea2-d8ee-7c9f-b850-874074eddad2@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Feb 28, 2018 at 08:57:18PM +0300, Sergei Shtylyov wrote:
> On 02/28/2018 04:27 PM, Simon Horman wrote:
> 
> >>> Here's the set of 5 patches against Simon Horman's 'renesas.git' repo's
> >>> 'renesas-devel-20180227-v4.16-rc3' tag. We're adding the R8A77970 FCPVD/VSPD/
> >>> DU/LVDS device nodes and then describing the HDMI encoder connected to the LVDS
> >>> output (we're omitting the LVDS decoder for now). These patches depend on
> >>> the recent R8A77970 DU/LVDS rework patches by Laurent in order to work...	
> >>
> >>    Need to mention that the DU driver silently fails to probe now. I do
> >>    hope that this is not due to my updates. :-)
> > 
> > Please test that theory.
> 
>    Yeah, after sucking in the recent versions of the DU/LVDS patches and uncommenting
> and fixing rejects in a couple patches here, the graphical console works again. :-)

Ok, but does this patchset cause a regression? If so it seems
that we should wait for driver updates before applying it.
