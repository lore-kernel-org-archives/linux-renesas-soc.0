Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f194.google.com ([209.85.208.194]:40558 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727149AbeJYCNK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Oct 2018 22:13:10 -0400
Received: by mail-lj1-f194.google.com with SMTP id t22-v6so5585744lji.7
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Oct 2018 10:44:11 -0700 (PDT)
Subject: Re: [PATCH 2/3] net: ethernet: Remove dummy runtime PM callbacks from
 Renesas drivers
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-pm@vger.kernel.org
Cc: linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>,
        linux-renesas-soc@vger.kernel.org, linux-usb@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
References: <20181024135134.28456-1-jarkko.nikula@linux.intel.com>
 <20181024135134.28456-3-jarkko.nikula@linux.intel.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <ecf01d95-f973-5294-932f-41e2a68decf3@cogentembedded.com>
Date: Wed, 24 Oct 2018 20:44:07 +0300
MIME-Version: 1.0
In-Reply-To: <20181024135134.28456-3-jarkko.nikula@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 10/24/2018 04:51 PM, Jarkko Nikula wrote:

> Platform drivers don't need dummy runtime PM callbacks that just return
> success in order to have runtime PM happening. This has changed since
> following commits:
> 
> 05aa55dddb9e ("PM / Runtime: Lenient generic runtime pm callbacks")
> 543f2503a956 ("PM / platform_bus: Allow runtime PM by default")
> 8b313a38ecff ("PM / Platform: Use generic runtime PM callbacks directly")

   Wow, these are old! :-)

> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> ---
> Only build tested.

   Seems long overdue...

[...]

Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

MBR, Sergei
