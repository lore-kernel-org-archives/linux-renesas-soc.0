Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f68.google.com ([209.85.218.68]:34726 "EHLO
        mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754740AbcJ3Ulb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 30 Oct 2016 16:41:31 -0400
Date: Sun, 30 Oct 2016 15:41:29 -0500
From: Rob Herring <robh@kernel.org>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: gregkh@linuxfoundation.org, linux-serial@vger.kernel.org,
        mark.rutland@arm.com, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] sh-sci: document R8A7743/5 support
Message-ID: <20161030204129.3aimogcpr6p352uv@rob-hp-laptop>
References: <4258682.UW6HhKP1CC@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4258682.UW6HhKP1CC@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Oct 21, 2016 at 11:00:43PM +0300, Sergei Shtylyov wrote:
> Renesas RZ/G SoC also have the SCIF, SCIFA, SCIFB, and HSCIF ports and
> they  seem compatible with the R-Car gen2 SoC  in this respect...
> Document RZ/G1[ME] (also known as R8A774[35]) SoC bindings.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Acked-by: Simon Horman <horms+renesas@verge.net.au>
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> ---
> This patch is against the 'tty-next' branch of GregKH's 'tty.git' repo.
> 
> Changes in version 2:
> - removed the RZ/G  family specific bindings, renamed the patch;
> - added Simon's and Geert's ACKs.
> 
>  Documentation/devicetree/bindings/serial/renesas,sci-serial.txt |    8 ++++++++
>  1 file changed, 8 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
