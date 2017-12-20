Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52011 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753760AbdLTIZc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Dec 2017 03:25:32 -0500
Date: Wed, 20 Dec 2017 09:25:28 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] soc: renesas: rcar-sysc: Mark rcar_sysc_matches[]
 __initconst
Message-ID: <20171220082527.k7wldjwjxut3j4xz@verge.net.au>
References: <1513698884-26663-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1513698884-26663-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Dec 19, 2017 at 04:54:44PM +0100, Geert Uytterhoeven wrote:
> rcar_sysc_matches[] is used only by rcar_sysc_pd_init(), which is
> __init.  Hence mark rcar_sysc_matches[] __initconst.
> 
> This frees another 1764 bytes (arm32/shmobile_defconfig) or 1000 bytes
> (arm64/renesas_defconfig) of memory after kernel init.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <simon.horman@netronome.com>
