Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:42554 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750949AbeBEJTm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Feb 2018 04:19:42 -0500
Date: Mon, 5 Feb 2018 10:19:38 +0100
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 02/11] soc: renesas: rcar-rst: add R8A77980 support
Message-ID: <20180205091937.vljhrt6by3mj7adk@verge.net.au>
References: <46fca582-220d-e5a7-62cd-2fc77a29846b@cogentembedded.com>
 <76b4144e-423a-65fd-fe17-bfedbc0deb8e@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <76b4144e-423a-65fd-fe17-bfedbc0deb8e@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Feb 02, 2018 at 09:27:01PM +0300, Sergei Shtylyov wrote:
> Add support for R-Car V3H (R8A77980) to the R-Car RST driver -- this driver
> is  needed  for the clock driver to work.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
