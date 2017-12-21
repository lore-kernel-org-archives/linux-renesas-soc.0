Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:42325 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753485AbdLUMd7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Dec 2017 07:33:59 -0500
Received: by mail-lf0-f68.google.com with SMTP id e30so10845909lfb.9
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Dec 2017 04:33:59 -0800 (PST)
Subject: Re: [PATCH v2] arm64: dts: renesas: salvator-common: add GPIO
 extender
To: Wolfram Sang <wsa@the-dreams.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>
References: <20171221122136.17773-1-wsa+renesas@sang-engineering.com>
 <20171221122425.3uz5mquj2a3373gb@ninjato>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <3d26f184-ed1a-0832-3c58-01a6173560e8@cogentembedded.com>
Date: Thu, 21 Dec 2017 15:33:55 +0300
MIME-Version: 1.0
In-Reply-To: <20171221122425.3uz5mquj2a3373gb@ninjato>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 12/21/2017 03:24 PM, Wolfram Sang wrote:

>> We need to configure its GPIOs later.
>>
>> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> ---
> 
> Forgot to say, this depends on 8a64e557f399090f5d1917b2f32a065da2b12be1
> ("gpio: pca953x: fix vendor prefix for PCA9654") which is in
> gpio/for-next already. I cherry-picked this commit and SATA still works.

    It's in Linus' (Torvalds!) tree for quite some time already. :-)

MBR, Sergei
