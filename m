Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:38143 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933423AbcLTKVl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Dec 2016 05:21:41 -0500
Date: Tue, 20 Dec 2016 11:21:31 +0100
From: Simon Horman <horms@verge.net.au>
To: Mark Brown <broonie@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, linux-spi@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH spi/for-next] spi: sh-msiof: Add R-Car Gen 2 and 3
 fallback bindings
Message-ID: <20161220102131.GI19532@verge.net.au>
References: <1481536175-17238-1-git-send-email-horms+renesas@verge.net.au>
 <20161214173811.iporb5qqulmndvg3@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161214173811.iporb5qqulmndvg3@sirena.org.uk>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Dec 14, 2016 at 05:38:11PM +0000, Mark Brown wrote:
> On Mon, Dec 12, 2016 at 10:49:35AM +0100, Simon Horman wrote:
> 
> > +	{ .compatible = "renesas,sh-msiof",        .data = &sh_data }, // Deprecated
> 
> C++ style comment here, please send a followup fixing this.

Thanks, done.
