Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:41803 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751895AbdHUI6c (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Aug 2017 04:58:32 -0400
Date: Mon, 21 Aug 2017 10:58:32 +0200
From: Simon Horman <horms@verge.net.au>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Russell King <linux@armlinux.org.uk>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] ARM: multi_v7_defconfig: Enable BQ32000 RTC driver
Message-ID: <20170821085832.GD14174@verge.net.au>
References: <20170818080621.GI9175@verge.net.au>
 <1503054758-6713-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1503054758-6713-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Aug 18, 2017 at 12:12:38PM +0100, Biju Das wrote:
> The iWave RZ/G1M Q7 SOM supports RTC (TI BQ32000).
> To increase hardware support enable the driver in the
> multi_v7_defconfig multiplatform configuration.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Thanks, applied for v4.15.
