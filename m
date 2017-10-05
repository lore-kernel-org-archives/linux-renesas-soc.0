Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33753 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751532AbdJEJRD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Oct 2017 05:17:03 -0400
Date: Thu, 5 Oct 2017 11:16:43 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] irqchip/renesas-intc-irqpin: Use
 of_device_get_match_data() helper
Message-ID: <20171005091642.GO26369@verge.net.au>
References: <1507119478-12641-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1507119478-12641-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Oct 04, 2017 at 02:17:58PM +0200, Geert Uytterhoeven wrote:
> Use the of_device_get_match_data() helper instead of open coding.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
