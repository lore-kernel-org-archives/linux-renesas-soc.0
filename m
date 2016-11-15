Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52825 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752513AbcKORz2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Nov 2016 12:55:28 -0500
Date: Tue, 15 Nov 2016 18:55:23 +0100
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, devicetree@vger.kernel.org,
        magnus.damm@gmail.com, linux@arm.linux.org.uk,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/11] Add R8A7745/SK-RZG1E board support
Message-ID: <20161115175522.GC3979@verge.net.au>
References: <2368353.xfo5beGC5E@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2368353.xfo5beGC5E@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sat, Nov 05, 2016 at 12:42:33AM +0300, Sergei Shtylyov wrote:
> Hello.
> 
>    Here's the set of 11 patches against Simon Horman's 'renesas.git' repo's
> 'renesas-devel-201611104-v4.9-rc3' tag plus the R8A7743/SK-RZG1M patch series
> posted earlier. I'm adding the device tree support for the R8A7745-based
> SK-RZG1E board. The SoC is close to R8A7794 and the board seems identical to the
> R8A7794/SILK board. The device tree patches depend on the R8A7745 CPG/MSSR
> driver series in order to compile and work.

Thanks, I have queued this up.
