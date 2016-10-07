Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:37605 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754042AbcJGDOy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Oct 2016 23:14:54 -0400
Date: Fri, 7 Oct 2016 12:14:50 +0900
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, devicetree@vger.kernel.org,
        magnus.damm@gmail.com
Subject: Re: [PATCH v3 01/11] ARM: shmobile: r8a7743: add power domain index
 macros
Message-ID: <20161007031450.GI13721@verge.net.au>
References: <2056698.ncAHq8vRQ3@wasted.cogentembedded.com>
 <5183851.NpIWVzMZV9@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5183851.NpIWVzMZV9@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Oct 06, 2016 at 12:31:30AM +0300, Sergei Shtylyov wrote:
> Add macros usable by the device tree sources to reference R8A7743 SYSC power
> domains by index.
> 
> Based on the original (and large) patch by Dmitry Shifrin
> <dmitry.shifrin@cogentembedded.com>.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> ---
> Changes in version 2:
> - added Geert's tag.
> 
>  include/dt-bindings/power/r8a7743-sysc.h |   25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)

Thanks, I have queued this up.
