Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp13.smtpout.orange.fr ([80.12.242.135]:56314 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1753223AbeDUTf2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 21 Apr 2018 15:35:28 -0400
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        David Woodhouse <dwmw2@infradead.org>,
        Brian Norris <computersforpeace@gmail.com>,
        Boris Brezillon <boris.brezillon@bootlin.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        Richard Weinberger <richard@nod.at>,
        linux-mtd@lists.infradead.org
Subject: Re: [PATCH 29/61] mtd: devices: simplify getting .drvdata
References: <20180419140641.27926-1-wsa+renesas@sang-engineering.com>
        <20180419140641.27926-30-wsa+renesas@sang-engineering.com>
Date: Sat, 21 Apr 2018 21:35:21 +0200
In-Reply-To: <20180419140641.27926-30-wsa+renesas@sang-engineering.com>
        (Wolfram Sang's message of "Thu, 19 Apr 2018 16:05:59 +0200")
Message-ID: <87o9icxshy.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Wolfram Sang <wsa+renesas@sang-engineering.com> writes:

> We should get drvdata from struct device directly. Going via
> platform_device is an unneeded step back and forth.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

Cheers.

--
Robert
