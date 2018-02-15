Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52777 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1163126AbeBOSaS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Feb 2018 13:30:18 -0500
Date: Thu, 15 Feb 2018 19:30:13 +0100
From: Simon Horman <horms@verge.net.au>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH V2] ARM: shmobile: Document Renesas H2-based Stout DT
 bindings
Message-ID: <20180215183013.hv2odp73omcn6mhq@verge.net.au>
References: <20180215100228.24695-1-marek.vasut+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180215100228.24695-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Feb 15, 2018 at 11:02:28AM +0100, Marek Vasut wrote:
> Document the Renesas H2 Stout (ADAS Starterkit) device tree bindings,
> listing it as a supported board.
> 
> This allows to use checkpatch.pl to validate .dts files referring to
> the Stout board.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Cc: Simon Horman <horms+renesas@verge.net.au>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> V2: - Keep the list of boards alphabetically sorted
>     - Rename the board from ADAS Starter Kit to ADAS Starterkit

Thanks, applied with Geert's reviewed-by tag from v1.
