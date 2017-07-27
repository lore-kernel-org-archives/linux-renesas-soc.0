Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:54277 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751113AbdG0PJX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Jul 2017 11:09:23 -0400
Date: Thu, 27 Jul 2017 17:09:00 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/4] soc: renesas: Add R-Car D3 support
Message-ID: <20170727150859.GE16143@verge.net.au>
References: <1500554094-22198-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1500554094-22198-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jul 20, 2017 at 02:34:50PM +0200, Geert Uytterhoeven wrote:
> 	Hi Simon, Magnus,
> 
> This patch series adds R-Car D3 support to the Renesas-specific SoC
> drivers:
>   - SoC identification,
>   - System controller,
>   - Reset controller.
> 
> Thanks!
> 
> Geert Uytterhoeven (4):
>   soc: renesas: Identify R-Car D3
>   soc: renesas: Add r8a77995 SYSC PM Domain Binding Definitions
>   soc: renesas: rcar-sysc: Add support for R-Car D3 power areas
>   soc: renesas: rcar-rst: Add support for R-Car D3

Thanks, applied for v4.14.
