Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f67.google.com ([209.85.218.67]:36332 "EHLO
        mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726498AbeHUBwC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Aug 2018 21:52:02 -0400
Date: Mon, 20 Aug 2018 17:34:33 -0500
From: Rob Herring <robh@kernel.org>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Mark Brown <broonie@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] spi: sh-msiof: Add r8a774a1 support
Message-ID: <20180820223433.GA1580@bogus>
References: <1534517914-15406-1-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1534517914-15406-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, 17 Aug 2018 15:58:34 +0100, Fabrizio Castro wrote:
> Document RZ/G2M (R8A774A1) SoC bindings.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> ---
> This patch applies on top of next-20180817
> 
>  Documentation/devicetree/bindings/spi/sh-msiof.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
