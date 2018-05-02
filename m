Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:45496 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750800AbeEBHDf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 May 2018 03:03:35 -0400
Date: Wed, 2 May 2018 09:03:16 +0200
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
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a77980: use CPG core clock
 macros
Message-ID: <20180502070315.gyxvbevjswtjojsc@verge.net.au>
References: <ea6d3e8a-71a9-9998-f364-7dc82b97c2c0@cogentembedded.com>
 <0fa354d7-2403-1d41-49f0-1502912f5656@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0fa354d7-2403-1d41-49f0-1502912f5656@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Apr 26, 2018 at 01:43:56PM +0300, Sergei Shtylyov wrote:
> Now that the commit 35b3c462dae1 ("dt-bindings: clock: add R8A77980 CPG
> core clock definitions") has hit Linus' tree, we can replace the bare
> numbers (we had to use to avoid a cross tree dependency) with these macro
> definitions...
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Thanks, applied.
