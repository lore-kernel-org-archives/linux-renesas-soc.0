Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:51878 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1423385AbeBOREA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Feb 2018 12:04:00 -0500
Date: Thu, 15 Feb 2018 18:03:56 +0100
From: Simon Horman <horms@verge.net.au>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH V2] ARM: shmobile: stout: enable R-Car Gen2 regulator
 quirk
Message-ID: <20180215170356.r63dmgt5umfirqlu@verge.net.au>
References: <20180215100208.24646-1-marek.vasut+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180215100208.24646-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Feb 15, 2018 at 11:02:08AM +0100, Marek Vasut wrote:
> Regulator setup is suboptimal on H2 Stout too. The Stout newly has
> two DA9210 regulators, so the quirk is extended to handle another
> DA9210 at i2c address 0x70.

It looks like this patch has received some review that needs addressing.
I have marked it as "Changes Requested".
