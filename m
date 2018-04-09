Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56004 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752432AbeDIMQi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Apr 2018 08:16:38 -0400
Date: Mon, 9 Apr 2018 14:16:34 +0200
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-mmc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [RFC PATCH] mmc: renesas_sdhi_internal_dmac: use more generic
 whitelisting
Message-ID: <20180409121634.d5mahheijnoa63d2@verge.net.au>
References: <20180404164507.3394-1-wsa@the-dreams.de>
 <20180405164216.7175-1-wsa@the-dreams.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180405164216.7175-1-wsa@the-dreams.de>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Apr 05, 2018 at 06:42:16PM +0200, Wolfram Sang wrote:
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 
> Whitelisting every ES version does not scale. So, we whitelist whole
> SoCs independent of ES version. If we need specific handling for an ES
> version, we put it to the front, so it will be matched first.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
