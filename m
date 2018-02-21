Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f174.google.com ([209.85.128.174]:33988 "EHLO
        mail-wr0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750786AbeBUUOF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Feb 2018 15:14:05 -0500
Received: by mail-wr0-f174.google.com with SMTP id m5so7989139wrg.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Feb 2018 12:14:05 -0800 (PST)
Subject: Re: [PATCH 1/2] ARM: shmobile: Factor out complex condition
To: Simon Horman <horms@verge.net.au>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20180217020642.21375-1-marek.vasut+renesas@gmail.com>
 <20180219085837.tsza3xakwxodrwko@verge.net.au>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <b51178de-26f3-45fb-18a8-52a5ba91f153@gmail.com>
Date: Wed, 21 Feb 2018 20:59:59 +0100
MIME-Version: 1.0
In-Reply-To: <20180219085837.tsza3xakwxodrwko@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 02/19/2018 09:58 AM, Simon Horman wrote:
> On Sat, Feb 17, 2018 at 03:06:41AM +0100, Marek Vasut wrote:
>> Pull the complex condition in regulator_quirk_notify() into
>> regulator_quirk_check(). Moreover, do not hard-code the I2C
>> address, but rather use the one in da9xxx_msgs[].
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>> Cc: Simon Horman <horms+renesas@verge.net.au>
>> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 
> There appears to be some review of this series that needs addressing,
> I have marked it as "Changes Requested".
> 
Jupp

-- 
Best regards,
Marek Vasut
