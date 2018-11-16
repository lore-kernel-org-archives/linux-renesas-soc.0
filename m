Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:48567 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728079AbeKQBIA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Nov 2018 20:08:00 -0500
Date: Fri, 16 Nov 2018 06:55:15 -0800
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Kevin Hilman <khilman@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] ARM: shmobile: Move SoC Kconfig symbols to
 drivers/soc/renesas/
Message-ID: <20181116145514.kmg462fzgnfzownj@verge.net.au>
References: <20181116134842.26488-1-geert+renesas@glider.be>
 <20181116134842.26488-3-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181116134842.26488-3-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Nov 16, 2018 at 02:48:42PM +0100, Geert Uytterhoeven wrote:
> For consistency with arm64, where vendors have a single Kconfig symbol
> in arch/arm64/Kconfig.platforms.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks Geert,

applied for v4.21.
