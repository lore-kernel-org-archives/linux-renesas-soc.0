Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:43213 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727009AbeIMRpW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Sep 2018 13:45:22 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20180913123603euoutp01f35cedca579aae1eb1a829df23b10c4e~T9c4ofHs91895518955euoutp01y
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Sep 2018 12:36:03 +0000 (GMT)
Subject: Re: [PATCH 04/16] drm: bridge: thc63: Restrict modes based on
 hardware operating frequency
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        Archit Taneja <architt@codeaurora.org>,
        Jacopo Mondi <jacopo@jmondi.org>
From: Andrzej Hajda <a.hajda@samsung.com>
Date: Thu, 13 Sep 2018 14:36:00 +0200
MIME-Version: 1.0
In-Reply-To: <20180904121027.24031-5-laurent.pinchart+renesas@ideasonboard.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Message-Id: <20180913123601eucas1p1e0406c1d58fc55935c51be044e6100dc~T9c269gMo1695416954eucas1p1v@eucas1p1.samsung.com>
Content-Type: text/plain; charset="utf-8"
References: <20180904121027.24031-1-laurent.pinchart+renesas@ideasonboard.com>
        <CGME20180904121036epcas2p1cf799f2b791be1e2ff8fc6f6a534804d@epcas2p1.samsung.com>
        <20180904121027.24031-5-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 04.09.2018 14:10, Laurent Pinchart wrote:
> The THC63LVD1024 is restricted to a pixel clock frequency in the range
> of 8 to 135 MHz. Implement the bridge .mode_valid() operation
> accordingly.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

 --
Regards
Andrzej
