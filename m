Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f67.google.com ([209.85.218.67]:36205 "EHLO
        mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759994AbcJaGW5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 Oct 2016 02:22:57 -0400
Date: Mon, 31 Oct 2016 01:22:54 -0500
From: Rob Herring <robh@kernel.org>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
        horms@verge.net.au, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 09/11] ARM: shmobile: document SK-RZG1M board
Message-ID: <20161031062254.2ykm26wwkotglk2t@rob-hp-laptop>
References: <4121805.SRTmqJtRfv@wasted.cogentembedded.com>
 <3956722.6l6VXXKMOL@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3956722.6l6VXXKMOL@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sat, Oct 29, 2016 at 01:23:59AM +0300, Sergei Shtylyov wrote:
> Document the SK-RZG1E device tree bindings, listing it as a supported board.
> 
> This allows to use checkpatch.pl to validate .dts files referring to the
> SK-RZG1E board.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
>  Documentation/devicetree/bindings/arm/shmobile.txt |    2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
