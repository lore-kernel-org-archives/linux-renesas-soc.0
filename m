Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-db5eur01on0138.outbound.protection.outlook.com ([104.47.2.138]:62076
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752546AbeESViP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 19 May 2018 17:38:15 -0400
Subject: Re: [PATCH 0/2] i2c: mux: demux-pinctrl: improve device relationships
To: Wolfram Sang <wsa@the-dreams.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20180430115544.22903-1-wsa+renesas@sang-engineering.com>
 <20180517141142.qlt4ekvvvsy74gvh@ninjato>
From: Peter Rosin <peda@axentia.se>
Message-ID: <f4f69369-f8d2-c1da-d97a-ef209c18f8ac@axentia.se>
Date: Sat, 19 May 2018 23:38:08 +0200
MIME-Version: 1.0
In-Reply-To: <20180517141142.qlt4ekvvvsy74gvh@ninjato>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 2018-05-17 16:11, Wolfram Sang wrote:
> On Mon, Apr 30, 2018 at 01:55:42PM +0200, Wolfram Sang wrote:
>> While researching some PM behaviour within I2C, I found out that the i2c-demux
>> driver does not play well with that due to broken relationship with other
>> devices. Patch 1 ensures the right parent-child relationship. Patch 2 makes the
>> connection between the demux device and the demuxed bus similar to that we have
>> in the mux core.
>>
>> Tested on a Renesas Lager board (R-Car H2).
> 
> Peter, I'd think these demux patches (and the single one later) should
> go via your tree. Let me know if you prefer that I pick them up.

Agreed, sorry for being a bit slow. I'll add some comments to the individual
patches...

Cheers,
Peter
