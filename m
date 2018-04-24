Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:37422 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750729AbeDXQKB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Apr 2018 12:10:01 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20180424160959euoutp02e4053c3d9f0990d437c10c53767c81fa~oaxIcSp4_1166711667euoutp02o
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Apr 2018 16:09:59 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] video: fbdev: sh_mobile_meram: Drop SUPERH platform
 dependency
Date: Tue, 24 Apr 2018 18:09:42 +0200
Message-ID: <2605903.FtxXXJybeG@amdc3058>
In-Reply-To: <1524234051-14058-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
References: <CGME20180420142058epcas4p107bd9707fc2225753d4ae60ac316c45b@epcas4p1.samsung.com>
        <1524234051-14058-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Friday, April 20, 2018 04:20:51 PM Geert Uytterhoeven wrote:
> Since commit a521422ea4ae6128 ("ARM: shmobile: mackerel: Remove Legacy C
> board code"), the only remaining platforms using this driver are SuperH
> SH-Mobile SoCs (sh7723).  As both SUPERH and ARCH_SHMOBILE are set for
> these platforms, the SUPERH dependency can be dropped.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch queued for 4.18 (w/ Laurent's & Simon's ACKs), thanks.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
