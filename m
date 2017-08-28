Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:41071 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751170AbdH1Mzh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Aug 2017 08:55:37 -0400
Date: Mon, 28 Aug 2017 14:55:41 +0200
From: Greg KH <greg@kroah.com>
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        magnus.damm@gmail.com, laurent.pinchart@ideasonboard.com,
        wsa@the-dreams.de, robh@kernel.org, peda@axentia.se,
        geert@linux-m68k.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 0/6] serdev multiplexing support
Message-ID: <20170828125541.GA10125@kroah.com>
References: <1502889748-31499-1-git-send-email-ulrich.hecht+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1502889748-31499-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Aug 16, 2017 at 03:22:22PM +0200, Ulrich Hecht wrote:
> Hi!
> 
> Here's a new version of serdev multiplexing support. Thanks to everybody who
> commented; I think I have included all non-optional suggestions. :)
> Changes are manifold, please refer to the changelog below.
> 
> This version drops "mux: include compiler.h from mux/consumer.h",
> which is on its way upstream by now.
> 
> CU
> Uli

Rob, any thoughts on this series?

thanks,

greg k-h
