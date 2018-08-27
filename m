Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mailgw02.mediatek.com ([210.61.82.184]:37099 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726731AbeH0FO3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Aug 2018 01:14:29 -0400
Message-ID: <1535333395.22101.4.camel@mhfsdcap03>
Subject: Re: [PATCH 0/3] i2c: refactor releasing a DMA safe buffer
From: Jun Gao <jun.gao@mediatek.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
CC: <linux-i2c@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        "Yingjoe Chen" <yingjoe.chen@mediatek.com>
Date: Mon, 27 Aug 2018 09:29:55 +0800
In-Reply-To: <20180824145246.19987-1-wsa+renesas@sang-engineering.com>
References: <20180824145246.19987-1-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, 2018-08-24 at 16:52 +0200, Wolfram Sang wrote:
> Jun Gao correctly identified a problem when freeing a DMA safe buffer [1], many
> thanks for that! However, I'd like to not introduce yet another function. So, I
> thought about changing the existing API to support the case of freeing a buffer
> in case no sync back to the message is needed. Here is what I came up with and
> I like the new way better.
> 
> Once this is set in place, the only existing user so far, has been fixed. It
> was leaking the bounce buffer on error cases before. Tested on a Renesas Lager
> board (R-Car H2).
> 
> Please let me know your thoughts. Jun Gao, does it work for you as well?

Dear Wolfram,

Thanks for your work.
It can work for us. I will modify my patch base on it.

Thanks!
Jun

> 
> If all goes well, I would like to apply it for -rc2. But I am still open for
> comments, of course.
> 
> Thanks and happy hacking,
> 
>    Wolfram
> 
> 
> [1] http://patchwork.ozlabs.org/patch/940768/
> 
> Wolfram Sang (3):
>   i2c: refactor function to release a DMA safe buffer
>   i2c: sh_mobile: define start_ch() void as it only returns 0 anyhow
>   i2c: sh_mobile: fix leak when using DMA bounce buffer
> 
>  Documentation/i2c/DMA-considerations | 10 +++++++---
>  drivers/i2c/busses/i2c-sh_mobile.c   | 15 +++++++--------
>  drivers/i2c/i2c-core-base.c          | 11 ++++++-----
>  include/linux/i2c.h                  |  2 +-
>  4 files changed, 21 insertions(+), 17 deletions(-)
> 
