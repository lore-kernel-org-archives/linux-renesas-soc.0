Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:35188 "EHLO
        mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759721AbcJaGV1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 Oct 2016 02:21:27 -0400
Date: Mon, 31 Oct 2016 01:21:25 -0500
From: Rob Herring <robh@kernel.org>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: horms@verge.net.au, linux-renesas-soc@vger.kernel.org,
        mark.rutland@arm.com, devicetree@vger.kernel.org
Subject: Re: [PATCH 02/11] soc: renesas: rcar-sysc: add R8A7745 support
Message-ID: <20161031062125.rvdx46wfuj2rauly@rob-hp-laptop>
References: <4121805.SRTmqJtRfv@wasted.cogentembedded.com>
 <5689104.8HluMoeKiR@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5689104.8HluMoeKiR@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sat, Oct 29, 2016 at 01:09:49AM +0300, Sergei Shtylyov wrote:
> Add support for RZ/G1E (R8A7745) SoC power areas to the R-Car SYSC driver.
> 
> Based on the original (and large) patch by Dmitry Shifrin
> <dmitry.shifrin@cogentembedded.com>.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
>  Documentation/devicetree/bindings/power/renesas,rcar-sysc.txt |    1 

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/soc/renesas/Makefile                                  |    1 
>  drivers/soc/renesas/r8a7745-sysc.c                            |   32 ++++++++++
>  drivers/soc/renesas/rcar-sysc.c                               |    3 
>  drivers/soc/renesas/rcar-sysc.h                               |    1 
>  5 files changed, 38 insertions(+)
