Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33525 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756560AbdJKHmd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Oct 2017 03:42:33 -0400
Date: Wed, 11 Oct 2017 09:42:27 +0200
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] ARM: shmobile: rcar-gen2: fix non-SMP build
Message-ID: <20171011074226.GH9661@verge.net.au>
References: <cover.1507623048.git.horms+renesas@verge.net.au>
 <dc15ca962757ca72a4492b2e13be2eecc6dcd716.1507623048.git.horms+renesas@verge.net.au>
 <44e29d14-b0f7-9454-4cf9-ee175fa078dd@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <44e29d14-b0f7-9454-4cf9-ee175fa078dd@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Oct 10, 2017 at 12:25:42PM +0300, Sergei Shtylyov wrote:
> Hello!
> 
> On 10/10/2017 11:12 AM, Simon Horman wrote:
> 
> >From: Arnd Bergmann <arnd@arndb.de>
> >
> >A bugfix for the SMP case broke the build for the UP case:
> >
> >arch/arm/mach-shmobile/headsmp-apmu.o: In function `shmobile_boot_apmu':
> >(.text+0x34): undefined reference to `secondary_startup'
> >
> >The assembler file mixes code that is used for SMP with code
> >that we also need on a single-CPU build, so I'm leaving it
> >always enabled in the Makefile, but enclose the SMP code
> >in an #ifdef.
> >
> >3fd45a136ff6 ("ARM: shmobile: rcar-gen2: Make sure CNTVOFF is initialized on CA7/15")
> 
>    "Fixes:"?

Thanks, I will fix and repost.
