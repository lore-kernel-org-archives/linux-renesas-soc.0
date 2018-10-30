Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33998 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727650AbeJ3WtR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Oct 2018 18:49:17 -0400
Date: Tue, 30 Oct 2018 14:55:37 +0100
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/2] pinctrl: sh-pfc: r8a7790: initialize TDSEL register
Message-ID: <20181030135531.ejippb6hzha3jngo@verge.net.au>
References: <20181028212457.1017-1-wsa+renesas@sang-engineering.com>
 <20181028212457.1017-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181028212457.1017-2-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sun, Oct 28, 2018 at 09:24:56PM +0000, Wolfram Sang wrote:
> Documentation says that some bits in TDSEL must be set (ch 5.3.39 in R-Car H2
> v0.91). However, the reset value of the register is 0, so software has to do
> it. Add this to the kernel driver to ensure this is really done independent of
> firmware versions.
> 
> This is needed for some SD cards supporting SDR104 transfer mode. For
> me, TDSEL was not initialized by the firmware and I had problems with
> the card when re-inserting it.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
