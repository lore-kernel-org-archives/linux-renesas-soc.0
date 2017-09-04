Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:42859 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753662AbdIDOsG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Sep 2017 10:48:06 -0400
Date: Mon, 4 Sep 2017 16:47:45 +0200
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH repost v2] serial: sh-sci: document R8A77970 bindings
Message-ID: <20170904144742.GA4356@verge.net.au>
References: <20170901221519.704978317@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170901221519.704978317@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sat, Sep 02, 2017 at 01:15:13AM +0300, Sergei Shtylyov wrote:
> R-Car V3M (R8A77970) SoC also has the R-Car gen3 compatible SCIF and HSCIF
> ports, so document the SoC specific bindings.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> This patch is against the 'tty-next' branch of GregKH's 'tty.git' repo.
> 
> Changes in version 2:
> - changed R8A7797 to R8A77970 everywhere;
> - rebased against the current branch.

Acked-by: Simon Horman <horms+renesas@verge.net.au>
