Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:36081 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752532AbeDXQC3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Apr 2018 12:02:29 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20180424160227euoutp02a10e071e24287e2b149a1eccab12cc0f~oaqjvA-UP0967309673euoutp02K
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Apr 2018 16:02:27 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        linux-omap@vger.kernel.org, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 58/61] video: fbdev: omap2: omapfb: displays: simplify
 getting .drvdata
Date: Tue, 24 Apr 2018 18:02:11 +0200
Message-ID: <1726457.eauaWiscAe@amdc3058>
In-Reply-To: <20180419140641.27926-59-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
References: <20180419140641.27926-1-wsa+renesas@sang-engineering.com>
        <CGME20180419140716epcas2p3dd25b3be301017affaef3908823c5ace@epcas2p3.samsung.com>
        <20180419140641.27926-59-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thursday, April 19, 2018 04:06:28 PM Wolfram Sang wrote:
> We should get drvdata from struct device directly. Going via
> platform_device is an unneeded step back and forth.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Patch queued for 4.18, thanks.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
