Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:54927 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965716AbcIZOzd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Sep 2016 10:55:33 -0400
Date: Mon, 26 Sep 2016 16:55:09 +0200
From: Simon Horman <horms@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH] ARM: dts: gose: use generic pinctrl properties in SDHI
 nodes
Message-ID: <20160926145509.GF5792@verge.net.au>
References: <1474020294-1544-1-git-send-email-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1474020294-1544-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Sep 16, 2016 at 12:04:54PM +0200, Simon Horman wrote:
> Since 16ccaf5bb5a5 ("pinctrl: sh-pfc: Accept standard function, pins and
> groups properties") renesas pfc drivers accept generic "function", "pins"
> and "groups" properties.
> 
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

I have queued this up.
