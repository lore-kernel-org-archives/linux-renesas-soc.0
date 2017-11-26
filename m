Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pl0-f68.google.com ([209.85.160.68]:36705 "EHLO
        mail-pl0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751816AbdKZW3J (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 26 Nov 2017 17:29:09 -0500
Date: Sun, 26 Nov 2017 16:29:05 -0600
From: Rob Herring <robh@kernel.org>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>,
        linux-renesas-soc@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: renesas: document V3MSK board bindings
Message-ID: <20171126222905.62qkvnvep2rkqcb6@rob-hp-laptop>
References: <20171124204748.920422106@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171124204748.920422106@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Nov 24, 2017 at 11:47:39PM +0300, Sergei Shtylyov wrote:
> Document the V3M Starter Kit device tree bindings, listing it as
> a supported board.
> 
> This allows to use checkpatch.pl to validate .dts files referring to
> the V3MSK board.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
>  Documentation/devicetree/bindings/arm/shmobile.txt |    2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
