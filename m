Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ve1eur01on0138.outbound.protection.outlook.com ([104.47.1.138]:45455
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750883AbeETHHw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 20 May 2018 03:07:52 -0400
Subject: Re: [PATCH 1/2] i2c: mux: demux-pinctrl: use proper parent device for
 demux adapter
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20180430115544.22903-1-wsa+renesas@sang-engineering.com>
 <20180430115544.22903-2-wsa+renesas@sang-engineering.com>
 <12bff5fc-dee4-e0bf-2dde-96201a8cd1fb@axentia.se>
 <20180520064540.t54o7akrmx3g6cd6@ninjato>
From: Peter Rosin <peda@axentia.se>
Message-ID: <76a9c2b5-bdc8-4b91-05f2-751d214473d2@axentia.se>
Date: Sun, 20 May 2018 09:07:43 +0200
MIME-Version: 1.0
In-Reply-To: <20180520064540.t54o7akrmx3g6cd6@ninjato>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 2018-05-20 08:45, Wolfram Sang wrote:
> On Sat, May 19, 2018 at 11:40:04PM +0200, Peter Rosin wrote:
>> On 2018-04-30 13:55, Wolfram Sang wrote:
>>> Due to a typo, the wrong parent device was assigned to the newly created
>>> demuxing adapter device. It got connected to the demuxing platform
>>> device but not to the selected parent I2C adapter device. Fix it to get
>>> a proper parent-child relationship of the demuxed busses, needed also for
>>> proper PM.
>>>
>>
>> Should this one have a Fixes: tag? Should it go to current or next? Is
>> a backport to stable good enough?
> 
> A Fixes tag is probably apropriate. I don't think it should go to
> stable, though, because it will break a scheme a user might be using.
> This can't be avoided for a kernel upgrade here, but IMO we shouldn't
> enforce it for a stable update. Especially, given this is not a real
> bug, but more something improper. For the same reason, I'd think -next
> is good enough.
> 
> Thanks, will resend!

Hmm, in that case, I think a Fixes tag is best left out, because I suspect
the net effect is mostly a bunch of mails from the stable trees as the
automatic patch-picker finds this patch. So, I plan to go with this patch.

Ok?

Cheers,
Peter
