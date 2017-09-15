Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52729 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750865AbdIOH2P (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Sep 2017 03:28:15 -0400
Date: Fri, 15 Sep 2017 09:27:55 +0200
From: Simon Horman <horms@verge.net.au>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: renesas: r8a77995: add GPIO device nodes
Message-ID: <20170915072755.GB3924@verge.net.au>
References: <1505298839-17435-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1505298839-17435-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Sep 13, 2017 at 07:33:59PM +0900, Yoshihiro Shimoda wrote:
> This patch adds GPIO device nodes for r8a77995.
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  Changes from v1:
>   - Change power-domains property in each node.
>   - Add Reviewed-by (Thanks Geert-san!).
> 
>  arch/arm64/boot/dts/renesas/r8a77995.dtsi | 112 ++++++++++++++++++++++++++++++

Thanks, applied.
