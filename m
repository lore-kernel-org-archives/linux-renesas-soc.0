Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:49652 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726319AbeHQNXH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Aug 2018 09:23:07 -0400
Date: Fri, 17 Aug 2018 12:20:11 +0200
From: Simon Horman <horms@verge.net.au>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Gross <andy.gross@linaro.org>,
        Wei Xu <xuwei5@hisilicon.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Alex Elder <elder@linaro.org>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Olof Johansson <olof@lixom.net>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: enable R8A774A1 SoC
Message-ID: <20180817102011.ru7erhoytvd6gqsw@verge.net.au>
References: <1534146093-1651-1-git-send-email-biju.das@bp.renesas.com>
 <1534146093-1651-2-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1534146093-1651-2-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Aug 13, 2018 at 08:41:33AM +0100, Biju Das wrote:
> Enable the Renesas RZ/G2M (R8A774A1) SoC in the ARM64 defconfig.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Thanks, applied for v4.20.
