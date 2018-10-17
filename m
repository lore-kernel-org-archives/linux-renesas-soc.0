Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:44347 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727218AbeJQQsa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Oct 2018 12:48:30 -0400
Date: Wed, 17 Oct 2018 10:53:45 +0200
From: Simon Horman <horms@verge.net.au>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: renesas: add/enable USB2.0 peripheral for
 R-Car [DE]3
Message-ID: <20181017085345.sbzrcxbxyajyvvop@verge.net.au>
References: <1539669909-25767-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1539669909-25767-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Oct 16, 2018 at 03:05:09PM +0900, Yoshihiro Shimoda wrote:
> This patch adds/enables USB2.0 peripheral for R-Car [DE]3 boards.
> So, the default mode on each board is:
>  - R-Car D3 Draak board (has a type-A connector) = host.
>  - R-Car E3 Ebisu board (has a type-B micro connector) = peripheral.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks Shimoda-san,

This looks fine to me but I will wait to see if there are other reviews
before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
