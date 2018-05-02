Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:45508 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750859AbeEBHDp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 May 2018 03:03:45 -0400
Date: Wed, 2 May 2018 09:03:26 +0200
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a77980: use SYSC power domain
 macros
Message-ID: <20180502070326.h52wsmbexs4p3z44@verge.net.au>
References: <ea6d3e8a-71a9-9998-f364-7dc82b97c2c0@cogentembedded.com>
 <df17ca8f-7942-3cdb-04d5-5d73e0259be5@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df17ca8f-7942-3cdb-04d5-5d73e0259be5@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Apr 26, 2018 at 01:45:21PM +0300, Sergei Shtylyov wrote:
> Now that the commit 7755b40d07a8 ("dt-bindings: power: add R8A77980 SYSC
> power domain definitions") has hit Linus' tree, we can replace  the bare
> numbers (we had to use to avoid a cross tree dependency) with these macro
> definitions...
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Thanks, applied.
