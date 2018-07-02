Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56377 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752137AbeGBM6l (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Jul 2018 08:58:41 -0400
Date: Mon, 2 Jul 2018 14:58:22 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: salvator-common: Prefer HSCIF1 over
 SCIF1
Message-ID: <20180702125821.q4gpqs2uymx2onx3@verge.net.au>
References: <20180629145112.9329-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180629145112.9329-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Jun 29, 2018 at 04:51:12PM +0200, Geert Uytterhoeven wrote:
> HSCIF is superior to SCIF (larger FIFOs, more accurate and wider
> supported range of bitrates).
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks,

This looks fine to me but I will wait to see if there are other reviews
before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
