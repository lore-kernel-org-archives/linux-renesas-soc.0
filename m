Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:40982 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726054AbeHRKdt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 18 Aug 2018 06:33:49 -0400
Date: Sat, 18 Aug 2018 09:27:04 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] mmc: renesas_sdhi_internal_dmac: Whitelist r8a774a1
Message-ID: <20180818072703.GA973@kunai>
References: <1534250074-15890-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1534250074-15890-2-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <1534250074-15890-2-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Aug 14, 2018 at 01:34:33PM +0100, Fabrizio Castro wrote:
> We need r8a774a1 to be whitelisted for SDHI to work on the RZ/G2M,
> but we don't care about the revision of the SoC, so just whitelist
> the generic part number.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
