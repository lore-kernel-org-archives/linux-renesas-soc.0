Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr1-f66.google.com ([209.85.221.66]:44365 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729177AbeKFU6o (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Nov 2018 15:58:44 -0500
Subject: Re: [PATCH 2/2] pinctrl: sh-pfc: r8a77990: Add voltage switch
 operations for SDHI
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-gpio@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org
References: <20181105214012.11626-1-marek.vasut+renesas@gmail.com>
 <20181105214012.11626-2-marek.vasut+renesas@gmail.com>
 <20181106111550.zakxqk2rkcmmqtnc@ninjato>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <876aa2aa-7fd1-8aaa-d86f-d1b2d2f5cb72@gmail.com>
Date: Tue, 6 Nov 2018 12:33:55 +0100
MIME-Version: 1.0
In-Reply-To: <20181106111550.zakxqk2rkcmmqtnc@ninjato>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 11/06/2018 12:15 PM, Wolfram Sang wrote:
> On Mon, Nov 05, 2018 at 10:40:12PM +0100, Marek Vasut wrote:
>> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>>
>> This patch supports the {get,set}_io_voltage operations of SDHI.
>>
>> This operates the IOCTRL30 register on the R8A77990 SoC and makes
>> 1.8V/3.3V signal voltage switch possible.
>>
>> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>> Cc: Simon Horman <horms+renesas@verge.net.au>
>> Cc: Wolfram Sang <wsa@the-dreams.de>
>> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>> Cc: linux-renesas-soc@vger.kernel.org
> 
> Looks good from a high-level point of view. Didn't check the actual
> values. I trust Shimoda-san and Geert for that:
> 
> Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 
I also checked them in U-Boot :)

-- 
Best regards,
Marek Vasut
