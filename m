Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:34729 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750851AbcLHPe1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Dec 2016 10:34:27 -0500
Date: Thu, 8 Dec 2016 16:34:22 +0100
From: Simon Horman <horms@verge.net.au>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Magnus <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm64: dts: r8a7795: add sound CTU support
Message-ID: <20161208153422.GB31836@verge.net.au>
References: <877f7dbtpm.wl%kuninori.morimoto.gx@renesas.com>
 <8760mxbtnu.wl%kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8760mxbtnu.wl%kuninori.morimoto.gx@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Dec 06, 2016 at 03:54:21AM +0000, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> This patch adds CTU (= Channel Transfer Unit) supoort which is needed
> to sound mixing.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks Morimoto-san,

I have queued up this and the following patch for v4.11 after running
the following on the changelog: s/supoort/support/
