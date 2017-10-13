Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55836 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753231AbdJMM2a (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Oct 2017 08:28:30 -0400
Date: Fri, 13 Oct 2017 14:28:00 +0200
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Wolfram Sang <wsa@the-dreams.de>, Rob Herring <robh+dt@kernel.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] i2c: rcar: document R8A77970 bindings
Message-ID: <20171013122800.xyog4scbsp6m2aot@verge.net.au>
References: <20171013122401.540656908@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171013122401.540656908@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Oct 13, 2017 at 03:23:55PM +0300, Sergei Shtylyov wrote:
> R-Car V3M (R8A77970) SoC also has the R-Car gen3 compatible I2C controller,
> so document  the SoC specific bindings.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
