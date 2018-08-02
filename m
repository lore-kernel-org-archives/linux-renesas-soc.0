Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr1-f67.google.com ([209.85.221.67]:43160 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728685AbeHBNhs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Aug 2018 09:37:48 -0400
Received: by mail-wr1-f67.google.com with SMTP id b15-v6so1784368wrv.10
        for <linux-renesas-soc@vger.kernel.org>; Thu, 02 Aug 2018 04:47:00 -0700 (PDT)
Subject: Re: [PATCH] ARM: shmobile: gose: Add DA9210 node for CPU DVFS
To: Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20180730111726.5526-1-marek.vasut+renesas@gmail.com>
 <CAMuHMdUop4fUTbgh0iCQRWTNz_X49070qPKZc0iJ9xFvhi9RHA@mail.gmail.com>
 <20180802112345.nnb6zcnq5t3cxvnu@verge.net.au>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <08920867-e6c9-e89c-7fc9-aa047a6fd44a@gmail.com>
Date: Thu, 2 Aug 2018 13:46:57 +0200
MIME-Version: 1.0
In-Reply-To: <20180802112345.nnb6zcnq5t3cxvnu@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 08/02/2018 01:23 PM, Simon Horman wrote:
> On Wed, Aug 01, 2018 at 02:16:14PM +0200, Geert Uytterhoeven wrote:
>> Hi Marek,
>>
>> On Mon, Jul 30, 2018 at 1:17 PM Marek Vasut <marek.vasut@gmail.com> wrote:
>>> Add DA9210 DVFS node to the I2C bus and link it to CPU0 for DVFS.
>>>
>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
>>
>> Thanks for your patch!
>>
>> Oneline-summary prefix should be "ARM: dts: gose:".
>>
>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Thanks, applied with that fixed.

Oh, was about to send V2. Thanks, this saves me a minute.

-- 
Best regards,
Marek Vasut
