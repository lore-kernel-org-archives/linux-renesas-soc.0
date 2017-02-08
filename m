Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:57066 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753676AbdBHK4m (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Feb 2017 05:56:42 -0500
Date: Wed, 8 Feb 2017 11:54:26 +0100
From: Simon Horman <horms@verge.net.au>
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org,
        gregkh@linuxfoundation.org, wsa@the-dreams.de,
        linux-serial@vger.kernel.org, magnus.damm@gmail.com,
        sergei.shtylyov@cogentembedded.com
Subject: Re: [PATCH v4 4/4] arm64: dts: r8a7796: salvator-x: add SCIF1
 (DEBUG1)
Message-ID: <20170208105426.GE26982@verge.net.au>
References: <1486118300-12633-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1486118300-12633-5-git-send-email-ulrich.hecht+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1486118300-12633-5-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Feb 03, 2017 at 11:38:20AM +0100, Ulrich Hecht wrote:
> Enables the SCIF hooked up to the DEBUG1 connector.
> 
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Hi Ulrich,

could you clarify the dependency of this patch on earlier ones in the
series. Is it safe to queue this up independently of the other patches?
