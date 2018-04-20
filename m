Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:39094 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754465AbeDTKPH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Apr 2018 06:15:07 -0400
Date: Fri, 20 Apr 2018 12:15:03 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] soc: renesas: r8a77995-sysc: Cleanups
Message-ID: <20180420101502.ahckf2tlzjoosuuk@verge.net.au>
References: <1524063498-2752-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1524063498-2752-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Apr 18, 2018 at 04:58:18PM +0200, Geert Uytterhoeven wrote:
> Minor cleanup of artefacts caused by deriving from r8a7795-sysc.c:
>   - Remove unused inclusion of <linux/sys_soc.h>,
>   - Make r8a77995_areas[] const.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied.
