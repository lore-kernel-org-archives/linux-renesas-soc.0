Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55782 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751559AbeBSImL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Feb 2018 03:42:11 -0500
Date: Mon, 19 Feb 2018 09:41:52 +0100
From: Simon Horman <horms@verge.net.au>
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org
Subject: Re: [PATCH 0/3] pinctrl: sh-pfc: r8a7795,6: Fix pin assignment
 definitions
Message-ID: <20180219084151.tsd26w2zl6ptstv7@verge.net.au>
References: <1518791104-13928-1-git-send-email-ulrich.hecht+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1518791104-13928-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Feb 16, 2018 at 03:25:01PM +0100, Ulrich Hecht wrote:
> Hi!
> 
> This series contains fixes to the PFC register definitions for r8a7795 and
> r8a7796 from the BSP that are not upstream yet.
> As far as I could tell, these changes check out with the Gen3 datasheet
> revision 0.80.

Agreed.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
