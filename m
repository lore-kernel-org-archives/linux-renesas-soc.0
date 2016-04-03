Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Subject: Re: [PATCH 2/6] net: ethernet: renesas: ravb_main: test clock rate to
 avoid division by 0
To: Wolfram Sang <wsa@the-dreams.de>, linux-kernel@vger.kernel.org
References: <1456958018-7849-1-git-send-email-wsa@the-dreams.de>
 <1456958018-7849-3-git-send-email-wsa@the-dreams.de>
 <20160403213641.GA24129@katana>
Cc: linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
	David Miller <davem@davemloft.net>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <5701991C.4020904@cogentembedded.com>
Date: Mon, 4 Apr 2016 01:28:44 +0300
MIME-Version: 1.0
In-Reply-To: <20160403213641.GA24129@katana>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 04/04/2016 12:36 AM, Wolfram Sang wrote:

>> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
>>
>> The clk API may return 0 on clk_get_rate, so we should check the result before
>> using it as a divisor.
>>
>> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> Ping.

    http://patchwork.ozlabs.org/patch/591160/

    I have no idea why it's marked this way... Dave?

MBR, Sergei
