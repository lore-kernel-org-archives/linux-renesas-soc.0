Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:54409 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751061AbdKTJwT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Nov 2017 04:52:19 -0500
Date: Mon, 20 Nov 2017 10:52:13 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/4] arm64: dts: renesas: salvator-x/xs: Add SoC name to
 file header
Message-ID: <20171120095212.fkfyns2stne7dqd2@verge.net.au>
References: <1510839861-12303-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1510839861-12303-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Nov 16, 2017 at 02:44:17PM +0100, Geert Uytterhoeven wrote:
> 	Hi Simon, Magnus,
> 
> With the proliferation of Salvator-X and Salvator-XS boards carrying
> different R-Car Gen3 SoCs variants, several DTS files ended up having
> the same file headers.
> 
> Add the SoC names to the file headers to avoid confusion.
> 
> Thanks!
> 
> Geert Uytterhoeven (4):
>   arm64: dts: renesas: r8a7795-es1-salvator-x: Add SoC name to file
>     header
>   arm64: dts: renesas: r8a7795-salvator-x: Add SoC name to file header
>   arm64: dts: renesas: r8a7796-salvator-x: Add SoC name to file header
>   arm64: dts: renesas: r8a7795-salvator-xs: Add SoC name to file header

Thanks, applied.
