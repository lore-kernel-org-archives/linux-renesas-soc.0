Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f193.google.com ([209.85.208.193]:37583 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728883AbeGQJgs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Jul 2018 05:36:48 -0400
Received: by mail-lj1-f193.google.com with SMTP id v9-v6so336234ljk.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Jul 2018 02:05:11 -0700 (PDT)
Subject: Re: [PATCH v2] i2c: recovery: make pin init look like STOP
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Peter Rosin <peda@axentia.se>,
        Wolfram Sang <wsa@the-dreams.de>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
References: <20180717090005.14997-1-wsa+renesas@sang-engineering.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <6696f21f-edb1-730c-a03a-175e421f7f5d@cogentembedded.com>
Date: Tue, 17 Jul 2018 12:05:09 +0300
MIME-Version: 1.0
In-Reply-To: <20180717090005.14997-1-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 7/17/2018 12:00 PM, Wolfram Sang wrote:

> When we we initialize the pins, make sure it looks like STOP by dividing

    One "we" is enough. :-)

> the delay into halves. It shouldn't matter because SDA is expected to be
> held low by a device, but for super-safety, let's do it.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> Reviewed-by: Peter Rosin <peda@axentia.se>
> Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
[...]

MBR, Sergei
