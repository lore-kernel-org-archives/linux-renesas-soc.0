Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:49609 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751743AbdJPHpj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Oct 2017 03:45:39 -0400
Date: Mon, 16 Oct 2017 09:45:19 +0200
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: mmc: describe new eMMC binding for
 fixed driver type
Message-ID: <20171016074519.hs7w5vhngnjtr74o@verge.net.au>
References: <20171015124615.31391-1-wsa+renesas@sang-engineering.com>
 <20171015124615.31391-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171015124615.31391-2-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sun, Oct 15, 2017 at 02:46:13PM +0200, Wolfram Sang wrote:
> Some boards may have to use a certain driver type (or drive strength) to
> achieve stable eMMC communication. Describe a binding to set this up via
> DT.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
