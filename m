Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:32905 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756950AbcHWHe0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Aug 2016 03:34:26 -0400
Date: Tue, 23 Aug 2016 09:34:19 +0200
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, devicetree@vger.kernel.org,
        magnus.damm@gmail.com, linux@arm.linux.org.uk,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] Add R8A7792 VSP1V support
Message-ID: <20160823073419.GH14998@verge.net.au>
References: <1635089.v8k0jcJkvb@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1635089.v8k0jcJkvb@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sat, Aug 20, 2016 at 01:17:09AM +0300, Sergei Shtylyov wrote:
> Hello.
> 
>    Here's the set of 2 patches against Simon Horman's 'renesas.git' repo,
> 'renesas-devel-20160817-v4.8-rc2' tag. We're adding the R8A7792 VSP1V clocks
> and device nodes. The 2nd patch depends on the VSP1 driver patch in order for
> the VSP1V core to be recognized by the driver. The patches have been tested on
> the Blanche board...
> 
> [1/2] ARM: dts: r8a7792: add VSP1V clocks
> [2/2] ARM: dts: r8a7792: add VSP1V support

Thanks, I have queued these up.
