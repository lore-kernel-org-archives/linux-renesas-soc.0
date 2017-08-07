Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.134]:44680 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751881AbdHGXrF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Aug 2017 19:47:05 -0400
Cc: shawn.lin@rock-chips.com, Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] mmc: block: prevent propagating R1_OUT_OF_RANGE for
 open-ending mode
To: Wolfram Sang <wsa@the-dreams.de>
References: <1502069565-114396-1-git-send-email-shawn.lin@rock-chips.com>
 <20170807205117.GA2104@katana>
From: Shawn Lin <shawn.lin@rock-chips.com>
Message-ID: <f225432a-8d94-b9c9-dfda-26ec63870198@rock-chips.com>
Date: Tue, 8 Aug 2017 07:46:54 +0800
MIME-Version: 1.0
In-Reply-To: <20170807205117.GA2104@katana>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On 2017/8/8 4:51, Wolfram Sang wrote:
> Hi Shawn,
> 
> On Mon, Aug 07, 2017 at 09:32:45AM +0800, Shawn Lin wrote:
>> We to some extent should tolerate R1_OUT_OF_RANGE for open-ending
>> mode as it is expected behaviour and most of the backup partition
>> tables should be located near some the last blocks which will always
>> make open-ending read exceed the capcity of cards.
>>
>> Fixes: 9820a5b11101 ("mmc: core: for data errors, take response of stop cmd into account")
>> Fixes: a04e6bae9e6f (mmc: core: check also R1 response for stop commands)
>> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
> 
> Thanks a lot for debugging and working on this issue! I think the above
> reason is correct, yet I wonder if we shouldn't implement it
> differently: how about introducing a new #define called STOP_ERRORS
> which does not include R1_OUT_OF_RANGE and use it instead of CMD_ERRORS?

I'm fine with that as mmc_blk_has_cmd_err is now only used to check stop
command.

> 
> Kind regards,
> 
>     Wolfram
> 
