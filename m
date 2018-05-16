Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:51874 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751510AbeEPIi0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 May 2018 04:38:26 -0400
Date: Wed, 16 May 2018 10:38:22 +0200
From: Simon Horman <horms@verge.net.au>
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 5/5] arm64: dts: renesas: r8a77995-draak: add X12 input
 dot clock
Message-ID: <20180516083822.xfmmg7sybdn37cjr@verge.net.au>
References: <1526386840-15368-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1526386840-15368-6-git-send-email-ulrich.hecht+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1526386840-15368-6-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, May 15, 2018 at 02:20:40PM +0200, Ulrich Hecht wrote:
> 74.25 Mhz oscillator X12 is connected to DU_DOTCLKIN0.
> 
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 11 +++++++++++
>  1 file changed, 11 insertions(+)

This looks fine but I will wait to see if there are other reviews before
applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
