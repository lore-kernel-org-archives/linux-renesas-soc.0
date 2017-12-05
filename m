Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from anchovy3.45ru.net.au ([203.30.46.155]:43619 "EHLO
        anchovy.45ru.net.au" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751964AbdLEBNg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Dec 2017 20:13:36 -0500
Subject: Re: [PATCH 0/6] i2c: send STOP after recovery; use it for i2c-rcar
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Claudio Foellmi <claudio.foellmi@ergon.ch>,
        Andrzej Hajda <a.hajda@samsung.com>
References: <20171204123640.3382-1-wsa+renesas@sang-engineering.com>
From: Phil Reid <preid@electromag.com.au>
Message-ID: <89963af5-3378-f70c-79ba-0988cce4689d@electromag.com.au>
Date: Tue, 5 Dec 2017 09:13:33 +0800
MIME-Version: 1.0
In-Reply-To: <20171204123640.3382-1-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 4/12/2017 20:36, Wolfram Sang wrote:
> When implementing bus recovery for the i2c-rcar driver, two problems were
> encountered: 1) When reading the SDA bit, not the SDA status was returned but
> the internal state of the "bus_is_busy" logic. 2) This logic needs a STOP to
> consider the bus free again. SCL/SDA high is not enough, and there is no other
> way known to reset the internal logic otherwise.
> 
> The obvious solution to just send STOP after recovery makes sense for the
> generic case, too, IMO. If we made a device release SDA again, and are about
> start a new transfer using START, then we should terminate the previous state
> properly with STOP. This may help with some devices and shouldn't create any
> drawback AFAICS.
> 
> For this, we need to introduce a 'set_sda' callback to the recovery
> infrastructure. Because of this and some other minor recovery core changes, I
> CCed a few people working on I2C bus recovery recently. The first five patches
> may be interesting for you, so your input is greatly appreciated. Also, testing
> the new features with GPIO based recovery would be awesome to have.
> 
> This was tested on a Renesas Lager board (r8a7790/R-Car H2). My test procedure
> is documented here:

Patches 1-5.
Tested-by: Phil Reid <preid@electromag.com.au>


-- 
Regards
Phil Reid
