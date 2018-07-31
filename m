Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:60122 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727409AbeGaMBL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 31 Jul 2018 08:01:11 -0400
Date: Tue, 31 Jul 2018 12:21:29 +0200
From: Simon Horman <horms@verge.net.au>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: renesas: r8a77990: Enable PWM for Ebisu
 board
Message-ID: <20180731102121.b42np7vz3hcwbs4p@verge.net.au>
References: <1533022999-14087-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1533022999-14087-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jul 31, 2018 at 04:43:19PM +0900, Yoshihiro Shimoda wrote:
> This patch adds PWM device nodes and enables PWM3 and PWM5 for
> R-Car E3 Ebisu board. These devices are used for backlight control.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  I have submitted dt-bindings for R-Car E3 (not merged into PWM subsystem yet):
>  https://patchwork.kernel.org/patch/10548969/
> 
>  Changes from v1:
>   - Add a comment about backlight on commit log.
>   - Add "Reviewed-by: Geert Uytterhoeven". (Thanks!)

Thanks, applied for v4.20.
