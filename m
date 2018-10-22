Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:50755 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727493AbeJVQfJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Oct 2018 12:35:09 -0400
Date: Mon, 22 Oct 2018 11:17:36 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH 2/5] pinctrl: intel: pinctrl-cherryview: simplify getting
 .driver_data
Message-ID: <20181022081736.GR2302@lahna.fi.intel.com>
References: <20181021200032.1833-1-wsa+renesas@sang-engineering.com>
 <20181021200032.1833-3-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181021200032.1833-3-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sun, Oct 21, 2018 at 10:00:28PM +0200, Wolfram Sang wrote:
> We should get 'driver_data' from 'struct device' directly. Going via
> platform_device is an unneeded step back and forth.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
